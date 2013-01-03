# Puppet module to install composer

## Description

install php composer - from http://getcomposer.org/ with puppet-composer module

## Installation

    git submodule add git://github.com/dazz/puppet-composer.git modules/composer

## Requirements

This requires additional modues in your project:

    git submodule add git://github.com/puppetlabs/puppetlabs-apt.git modules/apt
    git submodule add git://github.com/puppetlabs/puppetlabs-stdlib.git modules/stdlib
    git submodule add git://github.com/camptocamp/puppet-augeas.git modules/augeas

### puppetlabs-apt and puppetlabs-stdlib

Used for running `apt-get update` at least once before any package is installed.
puppetlabs-apt has the puppetlabs-stdlib as dependency.

### puppet-augeas

Augeas is a command line tool to manipulate configuration from the shell. see for more [augeas.net](http://augeas.net/)
Composer needs some php-ini values set. The modifications are handled by augeas.

### PHP5-CLI

To run composer the package php5-cli needs to be installed.

## Usage

In your manifest.pp:

    ## top block to call apt-get update at least once ##
    include apt::update
    Exec { path => ['/usr/local/bin', '/opt/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'], logoutput => true }
    Exec["apt_update"] -> Package <| |>
    ## end top block ##

    class {"composer":
      target_dir      => '/usr/local/bin',
      composer_file   => 'composer',
      download_method => 'curl', # download methods are curl or wget
      logoutput       => false
    }


The final file is just called `composer`. It is placed into the `target_dir` you specified in your manifest.
If you chose a path that is in the search path for executable files `composer` can be run from anywhere (see `PATH`).


## Todo

* add php5-cli install path as parameter

## puppet-composer v0.8

* install php5-cli package
* modify php5-cli ini for running composer
* download composer with curl or wget method
* copy composer.phar to search path for executable files
* run composer self-update (runs every time)

## Motivation and call for participation

I developed this module for installing the Symfony2 framework vendors. It is used in the [try-symfony2](https://github.com/dazz/try-symfony2) (still in beta, see develop branch) project .If you want to add to this puppet module please fork the develop branch (as I am working with `git-flow`) and send me a pull request.
