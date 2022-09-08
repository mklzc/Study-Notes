"""
使用方法：
python add.py "Prefix" --path "File path"
参数 path 可选，默认值为 in
使用样例：
python add.py qpow --path qpow.cpp
"""
import sys
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("FirstParser", type = str, help = "Input the prefix of your code")
parser.add_argument("--path", type = str, default = "in", help = "Input the path of your code(The defualt path is ./in)")
args = parser.parse_args()
savstdout = sys.stdout

# Add your user snippets in Vscode
Name = args.FirstParser
code = args.path
try:
    with open(code, 'r') as infile, open("out.json", "w") as outfile:
        sys.stdout = outfile
        print('"%s": {' %Name)
        print('    "prefix": "%s",' %Name)
        print('    "body": [')
        list = infile.readlines()
        for i in range(len(list) - 1):
            print('        "%s",' %list[i].rstrip())
        print('        "%s"' %list[-1].rstrip())
        print("    ]\n}")
    sys.stdout = savstdout
    print("Ok, file have sucessfully generated")
    print("Read From %s, Write to out.json" %code)
except:
    print("No certain file: %s exists!" %Name)