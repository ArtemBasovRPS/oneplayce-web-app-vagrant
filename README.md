# OnePlayce Web Application

## Requirements

* Vagrant
* VirtualBox

## Deployment

1. Clone this repository: `git clone git@github.com:SergeyKuzmich/oneplayce-web-app-vagrant.git`
2. Go to repository folder: `cd oneplayce-web-app-vagrant`
3. Install hostmanager: `vagrant plugin install vagrant-hostmanager`
3. Get OnePlayce project: `git@github.com:iggym4/OnePlayce-RPS-Backend.git sites/oneplayce`  
   [*Make sure you have access rights to read* **iggym4/OnePlayce-RPS-Backend** *repository*]
   [**OPTIONAL**: Go to `sites/oneplayce` and switch branch to `develop`]
5. Vagrant Up: `vagrant up`

### OR

Just download `shell/deploy.sh` file, make it executable and run in project folder.

`curl -O "https://raw.githubusercontent.com/SergeyKuzmich/oneplayce-web-app-vagrant/master/shell/deploy.sh" && chmod 777 deploy.sh && ./deploy.sh`

---
The website will be available by http://oneplayce.le URL
