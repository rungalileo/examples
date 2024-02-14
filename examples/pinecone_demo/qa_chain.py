import os

from langchain_openai import ChatOpenAI
from langchain.prompts import ChatPromptTemplate
from langchain.schema.runnable import RunnablePassthrough
from langchain.schema import StrOutputParser
from langchain_community.vectorstores import Pinecone as langchain_pinecone
from pinecone import Pinecone

def get_qa_chain(embeddings, index_name, top_k, llm_model_name, temperature = 0.1):
    # setup retriever
    pc = Pinecone(api_key=os.getenv("PINECONE_API_KEY"))
    index = pc.Index(index_name)
    vectorstore = langchain_pinecone(index, embeddings.embed_query, "text")
    retriever = vectorstore.as_retriever(search_kwargs={"k": top_k})

    # setup prompt
    rag_prompt = ChatPromptTemplate.from_messages(
        [
            (
                "system",
                "Answer the question based only on the provided context."
            ),
            ("human", "Context: \n'{context}' \n\nQuestion: \n'{question}'"),
        ]
    )

    # setup llm
    llm = ChatOpenAI(model_name=llm_model_name, temperature=temperature)

    # helper function to format docs
    def format_docs(docs):
        return "\n\n".join([d.page_content for d in docs])

    # setup chain
    rag_chain = (
        {"context": retriever | format_docs, "question": RunnablePassthrough()}
        | rag_prompt
        | llm
        | StrOutputParser()
    )
    
    return rag_chain