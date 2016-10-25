# homebridgepi

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What homebridgepi affects](#what-homebridgepi-affects)
4. [Limitations](#limitations)

## Overview

Simplify the installation and initial setup of Homebridge on the Raspberry Pi.

## Module Description

This module makes the installation and initial configuration of Homebridge simpler on the Raspberry Pi. It 
may work on other operating systems but it was tested on a Raspberry Pi running Raspbian Jessie.

## Setup

To utilize this module you should have a Raspberry Pi with Raspbian Jessie or Raspbian Jessie Lite installed 
and running. From there, simply do the following:

* sudo apt-get update
* sudo apt-get install puppet
* sudo puppet module install puppetlabs-apt
* sudo puppet module install puppet-nodejs
* sudo puppet module install dustinrue-homebridgepi

Then create a file called homebridge.pp and place 'include homebridgepi' into it. Apply this configuration
with 'puppet apply homebridge.pp'. 

### What homebridgepi affects

* Installs Nodejs and Homebridge.
* Configures Homebridge to run as root and start at system boot using systemd.
* Places a basic config.json file into /root/.homebridge/config.json

## Limitations

This was tested on Raspbian Jessie Lite. It may work on other operating systems and other platforms.