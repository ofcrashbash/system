#!/bin/bash

#basic updating
yes | apt-get upgrade
yes | apt-get update
yes | apt-get install build-essential
yes | apt-get install git
yes | apt-get install cmake
yes | apt-get install gfortran
yes | apt-get install doxygen

#science libs instalation

echo "BLAS/LAPACK"
#git clone https://github.com/Reference-LAPACK/lapack-release.git 
#cp make.inc.example make.inc
#make lapack_install 
#make lib 
#make blas_testing

echo "BOOST"
#git clone https://github.com/boostorg/boost.git
#sudo apt-get install python3-dev
#sudo apt-get install libopenmpi-dev
#sudo ./bootstrap.sh --with-python=python3
#echo "using mpi ;" >> project-config.jam
#sudo ./b2 install treading=multi link=share -j 4
#pushd tools/build/test 
#python test_all.py 
#popd

echo "OpenGL"
echo "glfw"
#git clone https://github.com/glfw/glfw.git

echo "glew"
#git clone https://github.com/nigels-com/glew.git

echo "FreeGLUT"
#git clone https://github.com/dcnieho/FreeGLUT.git

echo "Glad"
#git clone https://github.com/Dav1dde/glad.git

echo "ASSIMP"
#git clone https://github.com/assimp/assimp.git

echo "Openmpi"
#git clone https://github.com/open-mpi/ompi.git

echo "TRILINOS"
#git clone https://github.com/trilinos/Trilinos.git

echo "FEniCS"
#apt-get install software-properties-common
#add-apt-repository ppa:fenics-packages/fenics
#apt-get update
#apt-get install --no-install-recommends fenics


echo "Machine Learning"
echo "TensorFlow"
#pip install tf-nightly
#git clone https://github.com/tensorflow/tensorflow.git

echo "OpenAI\GYM"
#git clone https://github.com/openai/gym.git

echo "DEAL.II"
#git clone https://github.com/dealii/dealii.git

echo "OpenCV"
#git clone https://github.com/opencv/opencv.git


echo "PELICAN"
echo "plugins"
#git clone https://github.com/getpelican/pelican-plugins.git

echo "themes"
#git clone https://github.com/getpelican/pelican-themes.git