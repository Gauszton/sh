#!/bin/bash
#Gauszton_skrypt_v_1_1
echo "##########################################################################################################################";
echo "#";
echo "#   Power Gauszton skrypt, wszyskiego co potrzebne na nowej VM w jednym prostym skryptem - testowano na Ubuntu 20.04LTS";
echo "#";
echo "##########################################################################################################################";
echo "";
# update i upgrade z wymuszeniem -y 
echo -n "Update i Upgrade ";
sudo apt-get update > /dev/null; 
sudo apt-get upgrade -y > /dev/null;
echo -e ' - \e[32mGotowe\e[0m';

#dodanie katalogu tools

if [[ -d ~/tools ]];then
        echo -e "\e[32mkatalog ~/tools istnieje\e[0m"
else
        echo -e -n "\e[91mBrak katalogu ~/tools\e[0m"
        echo -e -n " - \e[34mTworze katalog ~/tools\e[0m"

                mkdir ~/tools

        echo -e " - \e[32mGotowe\e[0m";
fi

#instalacja pakietw przez apt install 

if command -v curl &> /dev/null; then
    	echo -e "\e[32mcurl juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak curl\e[0m"
    echo -n -e " - \e[34mInstalacja curl\e[0m"
	sudo apt-get install curl -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v wget &> /dev/null; then
    echo -e "\e[32mwget juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak wget\e[0m"
    echo -n -e " - \e[34mInstalacja wget\e[0m"
	sudo apt-get install wget -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v git &> /dev/null; then
    echo -e "\e[32mgit juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak Git\e[0m"
    echo -n -e " - \e[34mInstalacja git\e[0m"
	sudo apt-get install git -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v python3 &> /dev/null; then
    echo -e "\e[32mpython3 juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak python3\e[0m"
    echo -n -e " - \e[34mInstalacja python3\e[0m"
	sudo apt-get install python3 -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command python3 -m pip --version &> /dev/null; then
    	echo -e "\e[32mpython3-pip juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak python3-pip\e[0m"
    echo -n -e " - \e[34mInstalacja python3-pip\e[0m"
	sudo apt install python3-pip -y > /dev/null 2>&1;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command go version &> /dev/null; then
    echo -e "\e[32mgolang juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak golang\e[0m"
    echo -n -e " - \e[34mInstalacja golang\e[0m"
	sudo apt-get install golang -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v autojump &> /dev/null; then
    echo -e "\e[32mautojump juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak autojump\e[0m"
    echo -n -e " - \e[34mInstalacja autojump\e[0m"
	sudo apt-get install autojump -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v zsh &> /dev/null; then
    echo -e "\e[32mzsh juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak zsh\e[0m"
    echo -n -e " - \e[34mInstalacja zsh\e[0m"
	sudo apt-get install zsh -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command pip2 -v  &> /dev/null; then
    echo -e "\e[32mpython2 juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak python2\e[0m"
    echo -n -e " - \e[34mInstalacja python2\e[0m"
	sudo apt-get install python2 -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command python2 -m pip --version &> /dev/null; then
    echo -e "\e[32mpython2-pip juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak python2-pip\e[0m"
    echo -n -e " - \e[34mInstalacja python2-pip\e[0m"
	cd ~/tools;
	curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py > /dev/null 2>&1; 
	sudo python2 get-pip.py > /dev/null 2>&1; 
	echo -e " - \e[32mGotowe\e[0m";
	
fi

if command -v sqlmap &> /dev/null; then
    echo -e "\e[32msqlmap juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak sqlmap\e[0m"
    echo -n -e " - \e[34mInstalacja sqlmap\e[0m"
	sudo apt-get install sqlmap -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v nmap &> /dev/null; then
    echo -e "\e[32mnmap juz zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak nmap\e[0m"
   	echo -n -e " - \e[34mInstalacja nmap\e[0m"
	sudo apt-get install nmap -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

if command -v masscan &> /dev/null; then
    	echo -e "\e[32mmasscan juz zainstalowany\e[0m"
else   
    echo -e -n "\e[91mBrak masscan\e[0m"
   	echo -n -e " - \e[34mInstalacja masscan\e[0m"
	sudo apt-get install masscan -y -qq > /dev/null;
	echo -e " - \e[32mGotowe\e[0m";
fi

#instalacja OhMyZSH
if [[ -d ~/.oh-my-zsh ]];then
    echo -e "\e[32mOhMyZSH zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak OhMyZSH\e[0m"
    echo -n -e " - \e[34mInstalacja OhMyZSH\e[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1; 
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]];then
    echo -e "\e[32mzsh-autosuggestions zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak zsh-autosuggestions\e[0m"
    echo -n -e " - \e[34mInstalacja zsh-autosuggestions\e[0m"
    sh -c "(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]];then
    echo -e "\e[32mzsh-syntax-highlighting zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak zsh-syntax-highlighting\e[0m"
    echo -n -e " - \e[34mInstalacja zsh-syntax-highlighting\e[0m"
    sh -c "(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]];then
    echo -e "\e[32mzsh-completions zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak zsh-completions\e[0m"
    echo -n -e " - \e[34mInstalacja zsh-completions\e[0m"
    sh -c "(git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-docker ]];then
    echo -e "\e[32mzsh-docker zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak zsh-docker\e[0m"
    echo -n -e " - \e[34mInstalacja zsh-docker\e[0m"
    sh -c "(git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/auto-color-ls ]];then
    echo -e "\e[32mauto-color-ls zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak auto-color-ls\e[0m"
    echo -n -e " - \e[34mInstalacja auto-color-ls\e[0m"
    sh -c "(git clone https://github.com/gretzky/auto-color-ls.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-color-ls)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -f ~/.oh-my-zsh/custom/themes/common.zsh-theme ]];then
    echo -e "\e[32mCommon zsh theme zainstalowany\e[0m"
else
    echo -e -n "\e[91mBrak Common zsh theme\e[0m"
    echo -n -e " - \e[34mCommon zsh theme zainstalowany\e[0m"
    sh -c "(wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme)" > /dev/null 2>&1;
    echo -e " - \e[32mGotowe\e[0m";
fi

#ustawienie ZSH jako natywny shell dla mojego usera
#echo "ustawienie ZSH natywnym shell"
#chsh -s $(which zsh);

#Dodanie mojego pliku zshrc
if [[ $(curl -sb -H "Accept: application/txt" "https://raw.githubusercontent.com/Gauszton/zsh/main/.zshrc" | head -n 1) == $(cat ~/.zshrc | head -n 1) ]];then
	echo -e "\e[32mPlik .zshrc w aktualnej wersji zgodnej z Github.com/Gauszton/zsh\e[0m"
else
    echo -e -n "\e[91mBrak pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
	echo -n -e "\e[34mDodanie mojego pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
    cd ~; mv .zshrc old.zshrc; git clone https://github.com/Gauszton/zsh > /dev/null 2>&1; mv zsh/.zshrc ~/.zshrc; rm -rf zsh; rm ~/old.zshrc;
    echo -e " - \e[32mGotowe\e[0m";
fi

#echo "Dodanie klucza prywatnego"
if [[ -d ~/.ssh ]];then
        echo -e "\e[32mKatalog ~/.ssh istnieje\e[0m"
else
        echo -e -n "\e[91mBrak katalogu ~/.ssh\e[0m"
        echo -e -n " - \e[34mTworze\e[0m"

                mkdir ~/.ssh

        echo -e " - \e[32mGotowe\e[0m";

fi

#echo "Sprawdzono plik przechodze do klucza"
if [[ -f ~/.ssh/authorized_keys ]];then
    echo -e "\e[32mPlik ~/.ssh/authorized_keys istnieje\e[0m"
else
    echo -e -n "\e[91mBrak pliku ~/.ssh/authorized_keys istnieje\e[0m"
    echo -e -n " - \e[34mTworze\e[0m"

                touch ~/.ssh/authorized_keys

    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ $(curl -sb -H "Accept: application/txt" "https://raw.githubusercontent.com/Gauszton/publicKey/main/kay") == $(cat ~/.ssh/authorized_keys | tail -c 30) ]];then
	echo -e "\e[32mKlucz autrozided_keys w aktualnej wersji zgodnej z Github.com/Gauszton/kay\e[0m"
else
	echo -e -n "\e[91mBrak mojego klucza w pliku authorized_keys\e[0m"
        echo -e -n " - \e[32mDodaje moj klucz\e[0m"

            echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAwTDJ2wBreFKIg6WeSIbi4XwvK3gIm1YI+c0u1s7vXoV6CCq4QQkWvJ7eXCUb8fE1Fe+T7OU4ssOiUq4TkKeRnHSDlsr9i/ln1XI4SsXM5VMxp01lFZAjilPQpJDd6Fd+Px2Sc5AuKCCNycmeFdbEvT45iCYLa29znhjqIYjg242GoyBvj6nBGdXqbeoRLe67Sszsh1EJnWEIEW4izzgGZU7v/JZ9m8u8Fj76SXAu2ho4oF/ddFJ11ktNu8sBAOAcdUb/y+dNi76KfzWC9UpqK/aZ/TL4S/zM+x9f1lVOWLfI9L3NvIcTaJk/PzPiC8ALgRwBfO73Sf+84gnS91ULiQ== rsa-key-20200730' > ~/.ssh/authorized_keys

        echo -e " - \e[32mGotowe\e[0m";
fi

#dodanie m do sudersow
#!/bin/bash
if [[ $(sudo cat /etc/sudoers | grep "m ALL=(ALL) NOPASSWD: ALL" | tail -n 1) == "m ALL=(ALL) NOPASSWD: ALL" ]];then
	echo -e "\e[32mUser m jest juz dodany do autoryzacji suders bez hasla\e[0m"
else
    echo -e -n "\e[91mBrak usera m w grupie suders bez hasla\e[0m"
	echo -e -n " - Dodanie usera m do suders bez hasla"
    sudo sh -c "(sudo echo '# Dodanie usera M do autoryzacji sudo bez hasla' >> /etc/sudoers)"
    sudo sh -c "(sudo echo -n 'm ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers)"
    echo -e " - \e[32mGotowe\e[0m";
fi
#echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers

#instalacja HydraRecon
if [[ -d ~/tools/HydraRecon ]];then
    echo -e "\e[32mHydraRecon juz zainstalowane\e[0m"
else
    echo -e -n "\e[91mBrak HydraRecon\e[0m"
    echo -e -n " - \e[34mInstalacja HydraRecon\e[0m"
	cd ~/tools; 
	sh -c "(git clone https://github.com/aufzayed/HydraRecon.git ~/tools/HydraRecon)" > /dev/null 2>&1;
	echo -e -n " - \e[34mGit clone\e[0m";
	sh -c "(pip3 install -r requirements.txt)" > /dev/null 2>&1;
	echo -e -n " - \e[34mInstalacja requirements\e[0m";
	echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja Knock.py
if [[ -d ~/tools/knock ]];then
        echo -e "\e[32mKnock.py juz zainstalowane\e[0m"
else
    echo -e -n "\e[91mBrak knock.py\e[0m"
    echo -e -n " - \e[34mInstalacja knock.py\e[0m"
	cd ~/tools; 
	sh -c "(git clone https://github.com/guelfoweb/knock.git ~/tools/knock)" > /dev/null 2>&1;
	echo -e -n " - \e[34mGit clone\e[0m";
	
	sh -c "(sudo apt-get install python-dnspython -y)" > /dev/null 2>&1;
	sh -c "(sudo python2 ~/tools/knock/setup.py install)" > /dev/null 2>&1;
	echo -e -n " - \e[34mInstalacja requirements\e[0m";
	echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja sublister
if [[ -d ~/tools/Sublist3r ]];then
        echo -e "\e[32mSublist3r juz zainstalowane\e[0m"
else
    echo -e -n "\e[91mBrak Sublist3r\e[0m"
    echo -e -n " - \e[34mInstalacja Sublist3r\e[0m"
	cd ~/tools; 
	sh -c "(git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r)" > /dev/null 2>&1;
	echo -e -n " - \e[34mGit clone\e[0m";
	sh -c "(sudo pip3 install -r ~/tools/Sublist3r/requirements.txt)" > /dev/null 2>&1;
	echo -e -n " - \e[34mInstalacja requirements\e[0m";
	echo -e " - \e[32mGotowe\e[0m";
fi

echo -e "\e[41mReboot\e[0m";
echo "";
#sudo reboot
