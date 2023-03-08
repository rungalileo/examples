
mkdir -p tmp/content
if [ ! -d tmp/content/ImageNet15_animals ]
then
  echo "Downloading data"
  curl https://storage.googleapis.com/galileo-public-data/CV_datasets/ImageNet15_animals.zip -o tmp/content/ImageNet15_animals.zip
  unzip tmp/content/ImageNet15_animals.zip -d tmp/content
else
  echo "Data exists. Moving on."
fi
