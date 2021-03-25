#!/bin/zsh
# SSH keyの作成から検証まで自動化するスクリプト

printf "set your email address: "
read EMAIL
ssh-keygen -t rsa -b 4096 -C "$EMAIL"
mv $HOME/.ssh/id_rsa ~/.ssh/gh_rsa
mv $HOME/.ssh/id_rsa.pub ~/.ssh/gh_rsa.pub
echo "Host github.com
	HostName github.com
	User git
	Port 22
	IdentityFile ~/.ssh/gh_rsa" > $HOME/.ssh/config
chmod 600 $HOME/.ssh/config
cat $HOME/.ssh/gh_rsa.pub | pbcopy
echo "Your ssh public key copy to clipboard."
echo "Set your key to Github ssh settings."
open "https://github.com/settings/keys"
printf "Waiting...\nDone to Press Enter"
read ENTER
echo "Test Your settings"
ssh -T github.com
printf "Would you clone psbss/psbss? (Y or N): "
read CLONE
if [[ $CLONE = [yY] ]] ; then
	cd
	mkdir personal
	cd personal
	git clone psbss/psbss
else
	echo "Not cloned."
fi
printf "That's All.\nHave a nice Hacking!"
