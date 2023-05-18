#!/bin/sh -e 

echo "Running examples/multi_label_text_classification/Multi_Label_Text_Classification_using_Pytorch_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/multi_label_text_classification/Multi_Label_Text_Classification_using_Pytorch_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/multi_label_text_classification/Multi_Label_Text_Classification_using_TensorFlow_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/multi_label_text_classification/Multi_Label_Text_Classification_using_TensorFlow_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/named_entity_recognition/Named_Entity_Recognition_with_Huggingface_Trainer_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/Named_Entity_Recognition_with_Huggingface_Trainer_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/named_entity_recognition/Named_Entity_Recognition_with_Pytorch_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/Named_Entity_Recognition_with_Pytorch_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/named_entity_recognition/Named_Entity_Recognition_with_SpaCy_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/Named_Entity_Recognition_with_SpaCy_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/named_entity_recognition/Named_Entity_Recognition_with_Tensorflow_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/named_entity_recognition/Named_Entity_Recognition_with_Tensorflow_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/natural_language_inference/Natural_Language_Inference_using_Pytorch_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/natural_language_inference/Natural_Language_Inference_using_Pytorch_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/natural_language_inference/Natural_Language_Inference_using_TensorFlow_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/natural_language_inference/Natural_Language_Inference_using_TensorFlow_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/text_classification/Text_Classification_using_Huggingface_Trainer_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/Text_Classification_using_Huggingface_Trainer_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/text_classification/Text_Classification_using_Keras_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/Text_Classification_using_Keras_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/text_classification/Text_Classification_using_PyTorch_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/Text_Classification_using_PyTorch_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/text_classification/Text_Classification_using_Tensorflow_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/text_classification/Text_Classification_using_Tensorflow_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/image_classification/Image_Classification_using_PyTorch_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/image_classification/Image_Classification_using_PyTorch_and_🔭_Galileo.ipynb
echo "Done!\n"

echo "Running examples/object_detection/Object_Detection_using_Ultralytics_and_🔭_Galileo.ipynb"
MINIMIZE_FOR_CI=true jupyter nbconvert --to notebook --execute examples/object_detection/Object_Detection_using_Ultralytics_and_🔭_Galileo.ipynb
echo "Done!\n"
