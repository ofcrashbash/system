#!/bin/bash

#basic updating
yes | apt upgrade
yes | apt update
yes | apt install build-essential
yes | apt install git
yes | apt install cmake
yes | apt install gfortran
yes | apt install doxygen





echo "Science libs instalation"
echo "CLN"
#dependecies:
# m4, autoconf, flex?, libtool, texinfo

echo "adol-c"
#dependencies:
# mpi
autoreconf -iv
./configure --with-boost=yes
make
make check
make test
make install
make installcheck


echo "OpenMPI"

#short description#
#
# dependecies
# m4, autoconf, automake, libtool
git clone https://github.com/open-mpi/ompi.git OpenMPI

yes | apt install m4
yes | apt install autoconf
yes | apt install automake
yes | apt install libtool
yes | apt install flex
#yes | apt install libfabric-dev
echo "export AUTOMAKE_JOBS=4" >> ~/.bashrc
cd OpenMPI
./autogen.pl
./configure --disable-picky --enable-static
make -j 4 all 
#make -j 4 check ?
make -j 4 install 
#make -j 4 distclean ?
cd ..



echo "BLAS/LAPACK"
git clone https://github.com/Reference-LAPACK/lapack-release.git 
#cp make.inc.example make.inc and added there -fPIC flag
#make lapack_install #cos there is problem with ulimit
#make lib 
#make blas_testing
#or
cmake -DCMAKE_Fortran_FLAGS:STRING="-fPIC" ../lapack


echo "CLN"
#CLN is a library for efficient computations with all kinds of numbers in arbitrary precision
#apt install libcln-devmk
git clone git://www.ginac.de/cln.git
cd cln
autoreconf -iv
./configure
make -j 4
make check
make install
make distclean
cd ..

echo "GINAC"
git clone git://www.ginac.de/ginac.git
cd ginac
autoreconf -iv
./configure
make -j 4
make -j 4 check
make install
make distclean
cd ..



echo "BOOST"
#short description
#
#dependecies:
#   apt-get install python3-dev
#   OpenMPI   
git clone --recurse-submodules https://github.com/boostorg/boost.git
#apt-get install libopenmpi-dev
#./bootstrap.sh --with-python=python3
echo #"using mpi ;" >> project-config.jam
#./b2 install threading=multi link=static variant=release -j 4
#pushd tools/build/test 
#python test_all.py 
#popd

echo "HDF5"
#dependencies
#zlib
yes | sudo apt install libhdf5-dev
#failed tests
#wget -O "hdf5.tar" "https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-1.10.1.tar"
#tar xvf hdf5.tar
##rm hdf5.tar
#cd hdf5-1.10.1
#mkdir build
#cd build
./autogen.pl
./configure --prefix=/usr/local --enable-parallel --enable-optimization=high --enable-cxx --enable-build-mode=production
# make
# make check                # run test suite.
# make install
# make check-install        # verify installation.
#cd ../..



echo "SUNDIALS"
git clone https://github.com/LLNL/sundials.git
mkdir sundials_build
cd sundials_build
cmake ../sundials
make
make install
make clean
.
rm -r sundials_build

echo "NetCDF"
#dependencie:
# libcurl-dev
#git clone https://github.com/Unidata/netcdf-c.git
yes | apt install libnetcdf-dev
./configure 

echo "METIS"
wget -O "metis.tar.gz" "http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/metis-5.1.0.tar.gz"
tar xvzf metis.tar.gz metis
rm metis.tar.gz

make config
make
make install
make distclean
cd .. 



echo "ASSIMP"
git clone https://github.com/assimp/assimp.git
yes | apt install minizip #dependecy
cd assimp
mkdir build
cd build
cmake ..
make
make install
make clean
cd ../..




echo "TRILINOS"
git clone https://github.com/trilinos/Trilinos.git

echo "gmsh"
git clone https://gitlab.onelab.info/gmsh/gmsh.git

echo "PETSc"
#dependecies, python-dev(for boost), 
#includes also a lot of other packages like, OpenGL, Glut, OpenCL, Trilinos, BOOST, CUDA
#GOOGLE Test, Numpy, Matlab, Mathematica, Metis, Eigen, NetCDF, HDF5, BLAS\LAPACK
#downloads OpenMPI, MPICH, 
#before this PMI and BLACK/LAPLACK should be installed
git clone https://bitbucket.org/petsc/petsc

#recuires libbz2.h,  
cd petsc
./configure  
--download-scalapack=yes --with-scalapack=1  
--download-suitesparse=yes --with-suitesparse=1  
--download-trilinos=yes --with-trilinos=1 
--download-hwlock=yes --with-hwlock=1 
--download-boost=yes --with-boost=1 
--download-googletest=yes --with-googletest=1 
--download-libmesh=yes   
--download-muparser=yes --with-muparser=1 
--download-p4est=yes --with-p4est=1
--download-sundials=1 --with-sundials=1 
--dwonload-slepc=yes 
--download-petsc4py=yes 
--download-metis=yes --with-metis=1  
--download-netcdf=yes --with-netcdf=1  
--download-hdf5=yes --with-hdf5=1  
--download-szlib=yes --with-szlib=1
--download-zlib=yes --with-zlib=1
--download-fblaslapack=yes
--download-openmpi=yes
--with-blaslapack=1  
--download--eigen=yes --with-eigen=1
--prefix=/usr/local --with-cc=gcc --with-cxx=g++ --with-fc=gfortran --with-cmake=1


echo "MUPARSER"
./configure
make
make install
ldconfig

echo scalapack
cmake
make
make test
make install


echo "ARPACK -ng"
sh bootstrap
./configure --with-lapack=/usr/local --with-blas=/usr/local --enable-mpi --with-metis --with-petsc
make 
make check
make install

echo "p4est"
git submodule init 
git submodule update
./bootstrap
./configure --enable-mpi

echo "GLS"
git clone git://git.savannah.gnu.org/gsl.git

echo "FEniCS"
apt-get install software-properties-common
add-apt-repository ppa:fenics-packages/fenics
apt-get update
apt-get install --no-install-recommends fenics

echo "DEAL.II"
git clone https://github.com/dealii/dealii.git



echo "Machine Learning"
echo "TensorFlow"
#pip install tf-nightly
git clone https://github.com/tensorflow/tensorflow.git

echo "OpenAI\GYM"
git clone https://github.com/openai/gym.git

echo "OpenCV"
git clone https://github.com/opencv/opencv.git





echo "OpenGL"
echo "glfw"
git clone https://github.com/glfw/glfw.git

echo "glew"
git clone https://github.com/nigels-com/glew.git

echo "FreeGLUT"
git clone https://github.com/dcnieho/FreeGLUT.git

echo "Glad"
git clone https://github.com/Dav1dde/glad.git




echo "PELICAN"
echo "plugins"
git clone https://github.com/getpelican/pelican-plugins.git

echo "themes"
git clone https://github.com/getpelican/pelican-themes.git