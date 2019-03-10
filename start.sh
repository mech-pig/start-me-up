# usr/bin/sh

echo "---------------------------"
echo "🚀  Time to start you up! 🚀"
echo "---------------------------"

echo "⏳  Installing pip..."
easy_install pip
pip install --upgrade pip
echo "✅  pip installed!"

echo "⏳  Installing ansible..."
pip install ansible
echo "✅  ansible installed!"
