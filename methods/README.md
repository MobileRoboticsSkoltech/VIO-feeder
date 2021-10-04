In this directory the methods are placed.

# ORB_SLAM3
Add ORB_SLAM3 repository in this directory and install it according to it's instruction. 

https://github.com/UZ-SLAMLab/ORB_SLAM3.git

# Basalt
## APT installation for Ubuntu 20.04 and 18.04 (Fast)
```ruby
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0AD9A3000D97B6C9
sudo sh -c 'echo "deb [arch=amd64] http://packages.usenko.eu/ubuntu $(lsb_release -sc) $(lsb_release -sc)/main" > /etc/apt/sources.list.d/basalt.list'
sudo apt-get update
sudo apt-get install basalt
````
