#!/bin/sh -e 

echo "running examples/multi_label_text_classification/pytorch.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/multi_label_text_classification/pytorch.ipynb
echo ""

echo "running examples/multi_label_text_classification/tensorflow.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/multi_label_text_classification/tensorflow.ipynb
echo ""

echo "running examples/named_entity_recognition/pytorch.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/pytorch.ipynb
echo ""

echo "running examples/named_entity_recognition/spacy.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/spacy.ipynb
echo ""

echo "running examples/named_entity_recognition/tensorflow.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/tensorflow.ipynb
echo ""

echo "running examples/natural_language_inference/pytorch.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/natural_language_inference/pytorch.ipynb
echo ""

echo "running examples/natural_language_inference/tensorflow.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/natural_language_inference/tensorflow.ipynb
echo ""

echo "running examples/text_classification/keras.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/keras.ipynb
echo ""

echo "running examples/text_classification/pytorch.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/pytorch.ipynb
echo ""

echo "running examples/text_classification/tensorflow.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/tensorflow.ipynb
echo ""
