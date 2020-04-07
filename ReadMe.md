# Vagrant Hg2Git Converter

## Requirements

 - [Virtual Box](https://www.virtualbox.org/wiki/Downloads)     
 - [Vagrant](https://www.vagrantup.com/downloads.html)
 - Enough Hard Drive space (>5GB)
 - Enough RAM (VM will need 2GB)


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

 4. To Shutdown the vm run:
	```
	vagrant halt	
	```

 5. To remove the vm run:
	```
	vagrant destroy -f
	```

## Directory Structure

	├───Hg2GitConvert
    │       convert.sh
    |       GIT
    |       MERCURIAL    
    │   	
    │.gitignore
    │ReadMe.md
    │Vagrantfile
    │setup.sh
	
    
## Usage

### Step 1: Place Mercurial Repositories

After the VM has been provisioned, two additional directories should be created within the **`Hg2GitConvert`** directory : **`GIT`** and **`MERC`**.

These directories are automatically mapped to the vagrant server in the: `/home/vagrant/Hg2GitConvert` directory.

Copy and place Mercurial repositories in the **`MERC`** directory.

### Step 2: Edit hg2gitconvert Script

Edit the **`Hg2GitConvert/convert.sh`** file and update the `REPO_NAME` variable with the appropriate Mercurial repository name. 


```
REPO_NAME="<<##REPO_NAME_GOES_HERE##>>"
```

**Important:** Make sure the name matches the Mercurial Repo directory.

### Step 3: Do Conversion

Log in to the vagrant server using the console/terminal with the following command. _(This ust be within the **`Hg2GitConvert`** directory where the **`Vagrantfile`** file is located)_

```
vagrant ssh
```

Once logged in run the following command to convert the repository

```
sh Hg2GitConvert/convert.sh
```

You will see an output of the progress on the terminal. If there are no errors then the mercurial repository succesfully converted to git and will be in the **`Hg2GitConvert/GIT/`** directory.


## Troubleshooting

#### Dos/Nix Line Endings Error

When editing the convert file in Windows and then executing the file in Linux you may run into this error, Where the built in commands like `cd` and `git` aren't recognized: 

```
: not foundrt/convert.sh: 2: Hg2GitConvert/convert.sh:
: not foundrt/convert.sh: 7: Hg2GitConvert/convert.sh:
mkdir: cannot create directory ‘/home/vagrant\r’: Permission denied
: not foundrt/convert.sh: 9: Hg2GitConvert/convert.sh:
/Hg2GitConvert/MERC/Revenue-Dashboard't cd to /home/vagrant

```

The main reason this happens is due to Windows inserting different line endings at the end of every new line. 

The easy fix is to run this command:

```
dos2unix Hg2GitConvert/convert.sh
```

Then run the `sh Hg2GitConvert/convert.sh` script noramlly again.
