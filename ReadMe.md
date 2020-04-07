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

 2. Change directory to be within **`VagrantHg2Git`**
	```
	cd VagrantHg2Git
	```
		
 3. Run Vagrant to automatically provision the VM
	```
	vagrant up
	```


## Directory Structure

	├───Hg2GitConvert
    │       .hg2gitconvert.sh
    |       GIT
    |       MERCURIAL    
    │   	
    │.gitignore
    │ReadMe.md
    │Vagrantfile
    │setup.sh
	
    
## Usage

### Step 1: Place Mercurial Repositories

After the VM has been provisioned, two additional directories should be created within the **`Hg2GitConvert`** directory : **`GIT`** and **`MERC`**

These directories are automatically mapped to the vagrant server in the: `/home/vagrant` directory

Place Mercurial repositories in the `**MERC**` directory from the windows Host

### Step 2: Edit hg2gitconvert Script

Edit the **`Hg2GitConvert/hg2gitconvert.sh`** script and update the name of the Mercurial repository directory in the `REPO` variable. **Important:** Make sure the name matches the Mercurial Repo directory.

```
REPO="MercRepoNameHere"
```


### Step 3: Do Conversion

Log into the vagrant server via console/terminal using the following command. (Must be within the **`Hg2GitConvert`** directory where the **`Vagrantfile`** file is located)

```
vagrant ssh
```

This log you in to the vagrant server. Then run the following command to convert the repository

```
sh Hg2GitConvert/hg2gitconvert.sh
```

You will see an output of the progress on the terminal. If there are no errors then the mercurial repository succesfully converted to git and will be in the **`Hg2GitConvert/GIT/`** directory.