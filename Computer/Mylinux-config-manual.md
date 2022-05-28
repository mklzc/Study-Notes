# Config a New Linux System

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
