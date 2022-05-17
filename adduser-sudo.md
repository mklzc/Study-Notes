# Add a sudo user in a linux system

```sh
sudo adduser newuser
sudo chsh -s /bin/bash newuser
sudo usermod -aG sudo newuser
```
