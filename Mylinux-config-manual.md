**1. Set hostname**
```console
$ hostnamectl set-hostname new-hostname
```

**2. Change mirror source** 
```console
open software & update
change mirror sources to domestic source

$ sudo apt update
```
**3. Typewriting (require reboot)** 
```console
$ sudo apt install ibus-rime
$ reboot
$ ibus-setup
Then add Rime to InputMethod && Add Rime to setting- Region & language
```
**4. Coding Environment**
```console
$ sudo apt install vim
$ sudo snap install --classic code
# If can't connect to extensions, change the proxy setting to automatic
$ sudo apt install g++
```
**5. System tools**
```console
$ sudo apt install screenfetch
$ screenfetch
```
