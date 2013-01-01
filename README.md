# Vagrant PHP 5.4 development box

**WORK IN PROGRESS.**

Currently based on Ubuntu 12.04 (Precise) distribution.

## Requirements

* VirtualBox - Free virtualization software [Downloads](https://www.virtualbox.org/wiki/Downloads)
* Vagrant    - Tool for working with VirtualBox images [Vagrant Home](https://www.vagrantup.com), click on 'download now link'
* Git        - Source Control Management [Downloads](http://git-scm.com/downloads)

## VM specifications

* OS     - Ubuntu 12.04
* Apache - 2.2.22
* PHP    - 5.4.9
* MySQL  - 5.5.28

## Project architecture

```
Root
 `-- vagrant/
 `-- web/
 ```

 * `vagrant/` is this cloned repository and contains the Vagrant VM configuration
 * `web/`     is the Apache DocumentRoot directory, where its VirtualHost will point

## Setup

* Be at your project root directory (see "Project architecture" above)
* Clone this repository into vagrant/ directory with `git clone http://github.com/Ph3nol/vagrant-php54.git vagrant/`
* Go to vagrant directory (with `cd vagrant`) and start the VM with `vagrant up` (first start can download the Ubuntu box and can take some time to be ready)
* Access your web project from [http://11.11.11.11/](http://11.11.11.11/) in your favorite browser (you can add your specific host to your local `/etc/hosts`)
