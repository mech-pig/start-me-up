# usr/bin/sh

NOW=$(date -u +%Y-%m-%dT%H:%M:%SZ)
INSTALL_FOLDER="$HOME/tmp/start-me-up_$NOW"
START_ME_UP_REPO="git@github.com:MechanicalPig/start-me-up.git"
PLAYBOOK_FILE="playbook.yml"
HOSTS_FILE="hosts.yml"

PATH=$PATH:"$HOME/Library/Python/2.7/bin"

echo "---------------------------"
echo "🚀  Time to start you up! 🚀"
echo "---------------------------"

echo "👉  Temporary installation files will be stored here:"
echo "\t$INSTALL_FOLDER"
cd $INSTALL_FOLDER

echo "⏳  Installing pip..."
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
echo "✅  pip installed!"

echo "⏳  Installing ansible..."
pip install ansible --user
echo "✅  ansible installed!"

echo "⏳  Cloning git repository..."
git clone $START_ME_UP_REPO $INSTALL_FOLDER
echo "✅  repository cloned!"

echo "⏳  Executing playbook..."
ansible-playbook -i $HOSTS_FILE $PLAYBOOK_FILE --verbose
echo "✅  playbook succesfully executed!"

echo "🚿  Cleaning everything up..."
rm -rf $INSTALL_FOLDER
echo "✨  everything is clean!"

echo "-------------------------------------"
echo "You have been succesfully started up!"
echo "Have fun! 👋"
