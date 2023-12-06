# bu-ubuntu-dev-machine-setup | Ubuntu 22.04

## Descrição

Esse projeto é um fork de: https://github.com/fazlearefin/ubuntu-dev-machine-setup, foi customizado para atender o propósito de provisionar máquina de desenvolvedores, a partir de uma instalação limpa do Ubuntu 22.04

---

## What gets installed and cofigured?

Resumo dos pacotes e ferramentas que serão instalados:

- **role: base**
  - mount `/tmp` on tmpfs (reduce SSD read writes and increase SSD lifespan; no leftover files on system shutdown)
  - set default system editor to vim instead of nano
  - disable ufw firewall and install ufw graphical frontend gufw
  - disable system crash reports
  - tune system swappiness so that swapping is greatly reduced
  - upgrade all packages
  - install archiving tools like zip, rar, etc
  - install libreoffice
  - install power management tools like [TLP](https://github.com/linrunner/TLP)
  - install development related packages like android-tools, awscli, httpie, clusterssh, docker, filezilla, golang, pipenv, etc
  - setup golang directories
  - install download tools like axel, transmission, wget, aria2
  - install image, audio and video packages like vlc, totem, gimp, imagemagick, etc
  - install virtualization tools like virtualbox, docker, docker-compose
  - install and configure ssh server if not set to `laptop_mode`
  - option to turn on night light settings for eye comfort (set `base_permanent_night_light.night_light_enabled` to `True`)
  - enable `fzf` fuzzy finder in zsh terminal; check out this [YouTube video](https://www.youtube.com/watch?v=1a5NiMhqAR0) to see how to use it
<!-- - **role: hashicorp**
  - install vagrant, terraform, packer
- **role: terminal_customizations**
  - download and install some nerd fonts from ryanoasis/nerd-fonts; these are mono fonts ideal for use in terminal or programming editors
  - copy and enable sample tilix config file with configured nerd font
  - copy and enable sample tmux config file if one does not exist
  - copy and enable sample `~/.tmux.conf` file with powerline status bar and mouse support!
    - open Tilix terminal and run `tmux` command, or enable custom command option in Tilix
    - edit `~/.tmux.conf` if necessary -->
- **role: spacevim**
  - install spacevim packages
  <!-- - install amix/vimrc vim distribution
  - create sample vim customization file in `~/.vim_runtime/my_configs.vim`
    - additional vim settings are enabled in `~/.vim_runtime/my_configs.vim` which are not part of the Vim Distribution. Edit this file if necessary. -->
- **role: ohmyfish**
  - install ohmyfish
  <!-- - install antigen zsh plugin manager
  - copy and enable sample `~/.zshrc` file if one does not exist
    - contains function to stop ssh-agent from asking for encrypted ssh key password repeatedly when launching new terminal
  - install ohmyzsh/ohmyzsh and enable some bundled plugins
  - enable bullet train zsh theme (others like p10k can be configured as well) -->
- **role: googlechrome**
  - add Google Chrome apt repo
  - install Google Chrome
- **role: dbeaver**
  - install Dbeaver
- **role: phpstorm**
  - install PHPStorm
- **role: PyCharm**
  - install pycharm
- **role: Insomnia**
  - install Insomnia http client
- **role: ASDF**
- install ASDF

- **role: vscode**
  - add Visual Studio Code apt repo
  - install Visual Studio Code
  - install some popular Visual Studio Code extensions
<!-- - **role: privacy**
  - install tor
  - configure tor to run at boot and prevent using certain countries as exit nodes
    - edit `/etc/tor/torrc` if necessary
  - install proxychains
  - configure proxychains to use tor. View [my Medium story](https://fazlearefin.medium.com/tunneling-traffic-over-tor-network-using-proxychains-34c77ec32c0f) to see how to use it
    - edit `/etc/proxychains4.conf` if necessary
  - install metadata anonymization toolkit -->
<!-- - **role: security**
  - install ClamAV (antivirus) and ClamAV GNOME interface. Manual scan from nautilus or from CLI using `clamscan`; clamd not installed for its huge memory footprint -->

---

## Step 0 | Pre-requisites for running the ansible playbooks

On the system which you are going to setup using Ansible, perform these steps.

You need to install `ansible` and `git` before running the playbooks. You can either install it using `pip` or `apt`.

```bash
/usr/bin/sudo apt update
/usr/bin/sudo apt install ansible git -y
git config --global --add safe.directory '/home/usuario/.asdf'
```

And clone this repo (do not clone in `/tmp` as this dir is cleaned and mounted in tmpfs)

```bash
git clone https://github.com/fazlearefin/ubuntu-dev-machine-setup.git
cd ubuntu-dev-machine-setup
ansible-galaxy collection install community.general 
```

## Step 1 | Running the playbooks to configure your system

**Invoke the following as yourself, the primary user of the system. Do not run as `root`.**

```bash
ansible-playbook main.yml -vv -e "{ laptop_mode: True }" -e "local_username=$(id -un)" -K
```

Enter the sudo password when asked for `BECOME password:`.

The `main.yml` playbook will take anything from 15 minutes to an hour to complete.

After all is done, give your laptop a new life by rebooting.

> ### What is this `laptop_mode`?

#### Setting this to `True`

- will install some packages like [TLP](https://github.com/linrunner/TLP) for battery economy

#### Setting this to `False`

- will NOT install some packages like [TLP](https://github.com/linrunner/TLP) for battery economy

---

## Known Issues

- If the ansible playbook halts after completing a few tasks, simply run the playbook again. Since most of the tasks are idempotent, running the playbook multiple times won't break anything.
- If your terminal shows any weird characters because of installing one of the zsh themes, simply change the font to a suitable Nerd Font from the terminal's settings.
- If you do not like the fuzzy finder completions in your terminal, remove or comment out the `#fzf` lines in your `~/.zshrc` (this is not a known issue but a feature)

---

## Pull Requests and Forks

You are more than welcome to send any pull requests. However, the intention of this repo is to suit my development needs. So it might be better if you *fork* this repo instead for your own needs and personalization.

---
