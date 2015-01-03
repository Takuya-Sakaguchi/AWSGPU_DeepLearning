sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install make python-dev python-setuptools libblas-dev gfortran g++ python-pip python-numpy python-scipy liblapack-dev
sudo pip install ipython nose
sudo pip install pandas
apt-get install nvidia-cuda-toolkit
sudo pip install --upgrade git+git://github.com/Theano/Theano.git
sudo pip install --upgrade theano
sudo pip install -r https://raw.githubusercontent.com/dnouri/kfkd-tutorial/master/requirements.txt
sudo pip install -r https://raw.githubusercontent.com/dnouri/kfkd-tutorial/master/requirements-2.txt
 
# setup theano
cat <<EOF >~/.theanorc
[global]
floatX = float32
device = gpu0
[nvcc]
fastmath = True
EOF


# download data files and save them under /data
mkdir data
cd data
wget -x --load-cookies ~/cookies.txt https://www.kaggle.com/c/facial-keypoints-detection/download/training.zip
wget -x --load-cookies ~/cookies.txt https://www.kaggle.com/c/facial-keypoints-detection/download/test.zip
wget -x --load-cookies ~/cookies.txt https://www.kaggle.com/c/facial-keypoints-detection/download/SampleSubmission.csv
wget -x --load-cookies ~/cookies.txt https://www.kaggle.com/c/facial-keypoints-detection/download/IdLookupTable.csv
mv www.kaggle.com/c/facial-keypoints-detection/download/* .
sudo apt-get install unzip
unzip training.zip
unzip test.zip
 

# run step 1
cd ~
sudo chmod -R 777 .theano/
