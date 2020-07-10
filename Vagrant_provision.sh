# Migrated from Centos7 to Ubuntu20.04 ml_scripts
# Done by Chris Bording
#  Original Author Hideo Joho
# Vagrant jupyter with R.md
# Update package
echo "Updating default packages ..."
sudo apt -y update
# Install dev tools
#echo "Installing Development tools ..."
#sudo apt -y groupinstall base "Development tools"
#sudo apt -y install zlib-devel bzip2-devel openssl-devel sqlite-devel readline-devel

# Disable SELinux and firewall
#echo "Disabling SELinux and firewall ..."
#sudo setenforce 0
#sudo systemctl stop firewalld
#sudo systemctl disable firewalld
#sudo sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

# Install Python and Jupyter notebook
echo "Installing Python and Jupyter Notebook ..."
# sudo apt -y install epel-release
sudo apt -y install python3.8 python3.8-dev python3-distutils
sudo apt -y install python3-widgetsnbextension python3-testresources jupyter-client
sudo ln -s /usr/bin/python3 /usr/bin/python
  #statements
cd
wget https://bootstrap.pypa.io/get-pip.py
sudo python3.8 get-pip.py
sudo pip install ipython jupyter jupyter_contrib_nbextensions
sudo pip install numpy scipy pandas matplotlib janome pyper
cd
jupyter contrib nbextension install --user

# Install R and packages
echo "Installing R and packages ..."
sudo apt -y install r-base-core
sudo apt -y install libczmq-dev libcurl4-openssl-dev libxml2 libxml2-dev
sudo R -e "install.packages(c('crayon', 'pbdZMQ', 'devtools'), repos = 'https://cran.rstudio.com/', dep = TRUE)"
sudo R -e "devtools::install_github(paste0('IRkernel/', c('repr', 'IRdisplay', 'IRkernel')))"
sudo R -e "IRkernel::installspec(user = FALSE)"

# Start Jupyter Notebook
# echo "Starting Jupyter Notebook ..."
# jupyter notebook --ip=0.0.0.0 --no-browser
