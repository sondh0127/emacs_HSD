# new automatic install
## 1. run:
./setup_HSD
type password for sudo

## 2. emacs activating
 open emacs then:
M-x irony-install-server

# (old) emacs_HSD manual install
## download and install cMake
https://cmake.org/download/

extract and open cmake folder

./bootstrap

make

sudo make install
## config for irony/company - UBUNTU 
sudo apt-get install libclang-3.5-dev 

sudo apt-get install global
## emacs activating
M-x irony-install-server
