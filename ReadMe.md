# Vagrant Hg2Git Converter

## Requirements

 - [Virtual Box](https://www.virtualbox.org/wiki/Downloads)     
 - [Vagrant](https://www.vagrantup.com/downloads.html)
- Enough Hard Drive space (>5GB)
- Enough RAM (VM will need 2GB)

---

## Setup

 1. Clone this repository to local work space
	```
	git clone http://code.mistras.local/Software/VagrantHg2Git.git
	```

 2. Change directory to be within **VagrantHg2Git**
	```
	cd VagrantHg2Git
	```
		
 3. Run Vagrant to automatically provision the VM
	```
	vagrant up
	```


#### Directory Structure
	```
	├───Hg2GitConvert
    │   	.hg2gitconvert.sh
    │   	
    │.gitignore
    │ReadMe.md
    │Vagrantfile
    │setup.sh
	```


## Usage

### Step 1: Place Mercurial Repositories

After the VM has been provisioned, two additional directories should be created within the **Hg2GitConvert** directory : **GIT** and **MERC**

These directories are automatically mapped to the vagrant server in the: `/home/vagrant` directory

Place Mercurial repositories in the **MERC** directory from the windows Host

### Step 2: Edit hg2gitconver Script

Edit the **Hg2GitConvert/hg2gitconvert.sh** script and add the name of the mercurial repository directory in the `REPO` variable.

```
REPO="PutMercRepoNameHere"
```

**NOTE:** Make sure the name matches the Mercurial Repo directory


### Step 3: Do Conversion

Log into the vagrant server via console/terminal using the following command. (Must be within the host's **Hg2GitConvert** directory where the **Vagrantfile** is)

```
vagrant ssh
```

This log you in to the vagrant server. Then run the following command to convert the repository

```
sh Hg2GitConvert/hg2gitconvert.sh
```

You will see an output of the progress on the terminal. If there is no errors then the repository succesfully converted and is in the **Hg2GitConvert/GIT/** directory.