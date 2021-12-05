# Pop OS 21.04 Dotfiles

My personal set-up scripts. Used in Pop OS 21.04 Distro. 

## Included `dotfiles/`

- `bashrc` sets up Bash shell script.
- `settings.dconf` sets up all gnome settings. 

## Included `scripts/`

- `symlink.sh` sets up symbolic links in `$HOME`.
- `aptinstall.sh` sets up repository installs.
- `desktop.sh` setups desktop environment settings.
- `setup.sh` collects all the scripts and executes them.

## Usage Hints 

- After cloning the repo use the `initialize.sh` file to start and make sure that its executable buy using chmod +x `initialize.sh`. This file will go through and make all other `.sh` files executable and then run the `setup.sh` file. 
