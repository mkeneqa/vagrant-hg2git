# Vagrant Hg2Git Converter

This Vagrant script provisions and automates a virtualbox VM for converting Mercurial repositories to Git.

After setting up the Vagrant box, copy mercurial repositories over to the **Hg2GitConvert/MERC** directory and run the `sh Hg2GitConvert/convert.sh` command. This will convert and put the Git coversion in the **Hg2GitConvert/GIT** directory.

## Requirements

 - [Virtual Box](https://www.virtualbox.org/wiki/Downloads)     
 - [Vagrant](https://www.vagrantup.com/downloads.html)
 - Enough Hard Drive space (>5GB)
 - Enough RAM (VM will need 2GB)


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

 1. #### Clone this repository to local workspace
	```
	git clone https://github.com/mkeneqa/vagrant-hg2git.git
	```

 2. #### Change directory to be within **`VagrantHg2Git`**
	```
	cd VagrantHg2Git
	```
		
 3. #### Run Vagrant to automatically provision the VM
	```
	vagrant up
	```
	Two additional directories should be created within the **`Hg2GitConvert`** directory : 
	- **`GIT`** 
	- **`MERC`**

 4. #### Copy Over Mercurial Repositories

	Copy and place all the Mercurial directories under the **`Hg2GitConvert/MERC`** directory

 5. #### Log in to Vagrant server

	_(Make sure you are within the **`Hg2GitConvert`** directory where the **Vagrantfile** file is located)_

	Log in to the vagrant server using the console/terminal with the following command.

	```
	vagrant ssh
	```
 6. #### Covert Mercurial Repositories to Git

	Once logged in run the following command to convert the repository

	```
	sh Hg2GitConvert/convert.sh
	```

	You will see an output of the progress on the terminal. If there are no errors then the mercurial repositories will have succesfully converted to git and will be found under the **`Hg2GitConvert/GIT/`** directory.

---

## Troubleshooting

#### Dos/Nix Line Endings Error

You may run into this error: 

```
: not foundrt/convert.sh: 2: Hg2GitConvert/convert.sh:
: not foundrt/convert.sh: 7: Hg2GitConvert/convert.sh:
mkdir: cannot create directory ‘/home/vagrant\r’: Permission denied
: not foundrt/convert.sh: 9: Hg2GitConvert/convert.sh:
/Hg2GitConvert/MERC/MyCoolRepo't cd to /home/vagrant

```

This happens because Windows inserts a different line endings at the end of every new line from unix and the built in commands like `cd` and `git` aren't being recognized.

The easy fix is to run this command:

```
dos2unix Hg2GitConvert/convert.sh
```

and Then run this:

```
sh Hg2GitConvert/convert.sh
```

#### To shutdown the vagrant vm run:

	
	vagrant halt	
	

#### To remove the vagrant vm run:

	
	vagrant destroy -f
	
#
