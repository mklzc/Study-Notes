# !/bin/bash
print_pass(){
    echo -e "\033[32m$1 \033[0m"
    #echo "++> PASS""$1" >> "$file"
}
print_check(){
  echo -e "\033[35m$1 \033[0m"
  #echo "[$1]"" $2" >> "$file"
}
print_info(){
  echo -e "\033[34m$1 \033[0m"
}

function PackageInstall(){
    dpkg -s $1 &> /dev/null
    if [ $? -eq 0 ]
        then
            print_info "${1}已下载，跳过操作"
        else
            print_check "${2}(y/n)"
            read choice
            if [ ${choice} = "Y" ] || [ ${choice} = "y" ]; then
                sudo apt install $1 -y
                print_pass "下载成功"
            fi
    fi
}

print "---------Linux(Ubuntu) 常用软件包安装--------"

PackageInstall "screenfetch" "是否下载系统情况检测插件screenfetch"

PackageInstall "ffmpeg" "是否下载视频播放插件ffmpeg"

PackageInstall "g++" "是否下载g++编辑器"

PackageInstall "git" "是否下载分布式版本控制系统git"

PackageInstall "vim" "是否下载命令行文本编辑器vim"

PackageInstall "unrar" "是否下载rar压缩包解压软件unrar"

PackageInstall "axel" "是否下载命令行多线程下载工具axel"
