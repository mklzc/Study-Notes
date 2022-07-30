# Config a New Linux System (Ubuntu)

## 1. Set hostname (Require reboot)

```shell
hostnamectl set-hostname new-hostname
```

## 2. Change mirror source

1. open software & update
2. change mirror sources to domestic source

```shell
sudo apt update
```

## 3. Typewriting (Require reboot)

```shell
sudo apt install ibus-rime
reboot
ibus-setup
```

Then add Rime to InputMethod && Add Rime to setting- Region & language

## 4. Coding Environment

```shell
sudo apt install vim
sudo snap install --classic code
```

If can't connect to extensions in vs-code, change the proxy setting to automatic

```shell
sudo apt install g++
```

## 5. System tools

```shell
sudo apt install screenfetch
screenfetch
```

## 6. Vmware

Install

```sh
wget https://www.vmware.com/go/getplayer-linux
chmod +x getplayer-linux
sudo ./getplayer-linux --required --eulas-agreed
```

Unistall

```sh
sudo /usr/bin/vmware-installer -u vmware-player
```

## 7. find lost-archives (with photorec in linux)

```sh
sudo apt install testdisk
sudo photorec /directories
sudo apt remove testdisk
rm ~/photorec*
```

## Wine setup

Install

```sh
lscpu
sudo apt install wine64 (sudo apt install wine32)
wine --version
```

Run

```sh
winecfg
wine program.exe
```

Uninstall

```sh
sudo apt purge wine32 (wine64)
sudo apt autoremove
```

## Add a sudo user in a linux system

```sh
sudo adduser newuser
sudo chsh -s /bin/bash newuser
sudo usermod -aG sudo newuser
```
