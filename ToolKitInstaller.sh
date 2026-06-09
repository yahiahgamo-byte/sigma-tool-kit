#!/bin/bash

# =================================================================
# ⚔️ Sigma Tool Kit - Ultimate Bash Installer
# 📜 المطور: يحيى ياسر حسان سعيد (Yahia Yasser)
# 🌎 مفتوح المصدر بالكامل للجميع (Open Source Ecosystem)
# =================================================================

clear
echo "======================================================="
echo "  ⚔️  SIGMA TOOL KIT INSTALLER IS LAUNCHING... ⚔️"
echo "  Supporting all Pure Bash Systems (Linux / macOS)"
echo "======================================================="
echo ""
echo "sigma tool kit is installing"

cat << "EOF" >> ~/.bashrc
beeb(){
	play -q -t pulse -n synth "${1:-0.1}" sin "${2:-2000}" 2>/dev/null
}
mkcode() {
	if [[ -z "$1" || -z "$2" ]]; then
		echo "❌ الاستخدام الصحيح: mkcode <اسم_الملف> <نوع_الكود>"
		echo "💡 مثال: mkcode myscript py"
		beeb && beeb && beeb
		return 1
	fi
	local filename="$1"
	local codetype="$2"
	case "$codetype" in
		"py" | "python")
			echo "#!/usr/bin/env python3" > "$filename.py"
			chmod +x "$filename.py"
			beeb && echo "🐍 ملف بايثون [$filename.py] جاهز للجلد والتكويد!"
			;;
		"sh" | "bash")
			echo "#!/bin/bash" > "$filename.sh"
			chmod +x "$filename.sh"
			beeb && echo "🐚 ملف باش سكريبت [$filename.sh] جاهز للعمليات!"
			;;
		"cs" | "c#" | "csharp")
			echo -e "using System;\n\nclass Program {\n    static void Main(string[] args) {\n\n    }\n}" > "$filename.cs"
			beeb && echo "🎯 ملف لغة #C [$filename.cs] جاهز للتكويد!"
			;;
		"c")
			echo -e "#include <stdio.h>\n\nint main() {\n\n    return 0 ;\n}" > "$filename.c"
			beeb && echo "🲲 ملف لغة C جاهز مع الهيكل والمكتبات الأساسية!"
			;;
		"cpp" | "c++")
			echo -e "#include <iostream>\n\nint main() {\n\n    return 0;\n}" > "$filename.cpp"
			beeb && echo "🚀 ملف لغة C++ جاهز مع الـ Boilerplate الأساسي!"
			;;
		"html" | "web")
			echo -e "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n    <meta charset=\"UTF-8\">\n    <title>$filename</title>\n</head>\n<body>\n    <h1>Welcome to Sigma Project</h1>\n</body>\n</html>" > "$filename.html"
			beeb && echo "🌐 صفحة HTML5 متكاملة وجاهزة لتأسيس الفرونت إيند!"
			;;
		"java")
			local classname="$(tr '[:lower:]' '[:upper:]' <<< ${filename:0:1})${filename:1}"
			echo -e "public class $classname {\n    public static void main(String[] args) {\n \n    }\n}" > "$classname.java"
			beeb && echo "☕ ملف جافا جاهز متظبط باسم كلاس [$classname.java]!"
			;;
		"go" | "golang")
			echo -e "package main\n\nimport \"fmt\"\n\nfunc main() {\n \n}" > "$filename.go"
			beeb && echo "🐹 ملف لغة Go جاهز بالـ Package والـ main function!"
			;;
		*)
			echo "$codetype  ❌ غير مدعوم"
                        echo "💡 الأنواع المدعومة هي : "
                        echo "  - Python: py | python"
                        echo "  - Bash:   sh | bash"
                        echo "  - C:      c"
                        echo "  - C++:    cpp أو c++"
                        echo "  - HTML:   html أو web"
                        echo "  - Java:   java"
                        echo "  - Go:     go أو golang"
                        beeb && beeb && beeb
                        return 1
			;;
	esac
}
mkcd() {
	mkdir -p "$1"
	cd "$1"
	beeb
}
update() {
	sudo apt update && sudo apt upgrade
	beeb
}
pyproject()
{
	echo "Starting your task..."
	if [ -z "$1" ]; then
		echo "please enter your venv name"
		return 1
	fi
	if sudo apt install python3-venv -y && python3 -m venv "$1"; then
		echo "your project $1 is created succefully"
		source "$1"/bin/activate
		echo "Evironment is active now"
		beeb 0.1 1000
	else 
		echo "somthing wrong happend"
		beeb 0.1 200
		return 1
	fi
}
pylipTo()
{	
	local my_venv="$1"
	local lip_name="$2"
	local version="$3"
	if [ -z "$my_venv" ] || [ -z "$lip_name" ]; then
		echo "error : you need to enter venv name and lip name"
		beeb 0.1 200
		return 1
	fi
	if [ -z "$version" ]; then
		echo "downloading latest version of $lip_name"
		if "$my_venv/bin/python3" -m pip install "$lip_name"; then 
			echo "✅ every thing is done succesfully($lip_name is in $version)"
		else
			echo "something went wrong and your lip doesnt downloaded"
			return 1
		fi
	else 
		echo "downloading $version of $lip_name lip"
		if "$my_venv/bin/python3" -m pip install "$lip_name"=="$version"; then
			echo "✅ $lip_name version $version installed successfully."
		else
			echo "something went wrong and your lip doesnt downloaded"
			return 1
		fi
	fi
	echo "every thing is done just for you"
	"$my_venv/bin/pip" list
	beeb 0.1 1000
}
bkup()
{
	if [ -z "$1" ] || [ -z "$2" ]; then
		echo "error: enter your file name and path first"
		beeb 0.1 200
		return 1
	else
		if tar -cvzf "$1.tar.gz" "$2"; then
		echo "everything is done"
		beeb 0.1 1000
		else
			echo "Compression failed"
			beeb 0.1 200
		fi
	fi
}
unbkup()
{
	if tar -xvzf "$1"; then
		echo "everything is done"
		beeb 0.1 1000
	else
		echo "something wrong"
		beeb 0.1 200
	fi
}
EOF

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

echo "======================================================="
echo " 🎉 SIGMA TOOLKIT IS INSTALLED SUCCESSFULLY !!"
echo " 👉 Open a new terminal or type: source ~/.bashrc"
echo " 💡 Try out commands like: mkcode myscript py"
echo "======================================================="

