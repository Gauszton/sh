#!/bin/bash
#Gauszton_skrypt_v_1_3
echo "##########################################################################################################################";
echo "#";
echo "#   Power Gauszton skrypcik
echo "#";
echo "##########################################################################################################################";
echo "";
# update i upgrade z wymuszeniem -y 
echo "Update i Upgrade ";
sudo apt update > /dev/null 2>&1; 
sudo apt upgrade -y > /dev/null 2>&1;
echo -e '\e[32mGotowe\e[0m';

#Tworzenie struktury katalogów
if [[ -d ~/tools ]];then
    echo -e "\e[32mkatalog ~/tools istnieje\e[0m"
else
    echo -e -n "\e[91mBrak katalogu ~/tools\e[0m"
    echo -e -n " - \e[34mTworze katalog ~/tools\e[0m"

            mkdir ~/tools

    echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/tools/other ]];then
    echo -e "\e[32mkatalog ~/tools/other istnieje\e[0m"
else
    echo -e -n "\e[91mBrak katalogu ~/tools/other\e[0m"
    echo -e -n " - \e[34mTworze katalog ~/tools/other\e[0m"

            mkdir ~/tools/other

    echo -e " - \e[32mGotowe\e[0m";
fi
#----------------------------------------------------------------------------------------------------------------------------------------------
#W fasie testowania pętla instalacyjna po sprawdzeniu przejdziemy na kilka pętli do instalacji wszyskiego
dodatek="libcurl4-openssl-dev libssl-dev  ruby-full ruby-dev libxml2 libxml2-dev build-essential libffi-dev python-dev 
  libxslt1-dev libgmp-dev zlib1g-dev python-setuptools libldns-dev"

for dodatekA in $dodatek; do
        echo -n -e " - \e[34mSprawdzanie $dodatekA\e[0m"
        
            sudo apt install $dodatekA -y -qq 
            #> /dev/null 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
done

aplikacje="rename jq xargs unzip curl wget git whois golang python2 python3 python3-pip autojump zsh sqlmap nmap masscan"
for aplikacja in $aplikacje; do
    if command -v $aplikacja &> /dev/null 2>&1; then
    	echo -e "\e[32m$aplikacja juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $aplikacja\e[0m"
        echo -n -e " - \e[34mInstalacja $aplikacja\e[0m"
        
            sudo apt install $aplikacja -y -qq > /dev/null 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
    fi
done

#----------------------------------------------------------------------------------------------------------------------------------------------
#instalacja pakietw apt Linux 

if command python2 -m pip --version &> /dev/null 2>&1; then
        echo -e "\e[32mpython2-pip juz zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak python2-pip\e[0m"
        echo -n -e " - \e[34mInstalacja python2-pip\e[0m"
        
            curl https://bootstrap.pypa.io/get-pip.py --output ~/tools/other/get-pip.py > /dev/null 2>&1; 
            sudo python2 ~/tools/other/get-pip.py > /dev/null 2>&1; 
        
        echo -e " - \e[32mGotowe\e[0m";
fi


if command -v amass &> /dev/null 2>&1; then
        echo -e "\e[32mamass juz zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak amass\e[0m"
        echo -n -e " - \e[34mInstalacja amass\e[0m"

                sudo snap install amass > /dev/null 2>&1;

        echo -e " - \e[32mGotowe\e[0m";
fi

#----------------------------------------------------------------------------------------------------------------------------------------------
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
#----------------------------------------------------------------------------------------------------------------------------------------------
#Dodanie mojego pliku zshrc
if [[ $(curl -sb -H "Accept: application/txt" "https://raw.githubusercontent.com/Gauszton/zsh/main/.zshrc" | head -n 1) == $(cat ~/.zshrc | head -n 1) ]];then
	    echo -e "\e[32mPlik .zshrc w aktualnej wersji zgodnej z Github.com/Gauszton/zsh\e[0m"
else
        echo -e -n "\e[91mBrak pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
	    echo -n -e " - \e[34mDodanie mojego pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
            
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
	    echo -e -n " - \e[34mDodanie usera m do suders bez hasla\e[0m"

            sudo sh -c "(sudo echo '# Dodanie usera M do autoryzacji sudo bez hasla' >> /etc/sudoers)"
            sudo sh -c "(sudo echo -n 'm ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers)"

        echo -e " - \e[32mGotowe\e[0m";
fi
#----------------------------------------------------------------------------------------------------------------------------------------------
#instalacja Chromedriver ( wymagany przez HydraRecon)
if [[ -f /usr/bin/chromedriver ]];then
        echo -e "\e[32mchromedriver zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak chromedriver\e[0m"
        echo -n -e " - \e[34mInstalacja chromedriver\e[0m"

            wget "https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip" -P ~/tools/other > /dev/null 2>&1;
            unzip ~/tools/other/chromedriver_linux64.zip -d ~/tools/other/ > /dev/null 2>&1;
            sudo mv ~/tools/other/chromedriver /usr/bin/chromedriver
            sudo chown root:root /usr/bin/chromedriver
            sudo chmod +x /usr/bin/chromedriver

        echo -e " - \e[32mGotowe\e[0m";
fi

#instalacja HydraRecon
if [[ -d ~/tools/HydraRecon ]];then
        echo -e "\e[32mHydraRecon juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak HydraRecon\e[0m"
        echo -e -n " - \e[34mInstalacja HydraRecon\e[0m"
	
            sh -c "(git clone https://github.com/aufzayed/HydraRecon.git ~/tools/HydraRecon)" > /dev/null 2>&1;
	
        echo -e -n " - \e[34mGit clone\e[0m";
	        
            sh -c "(pip3 install -r ~/tools/HydraRecon/requirements.txt)" > /dev/null 2>&1;
	
        echo -e -n " - \e[34mInstalacja requirements\e[0m";
	    echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja sublister
if [[ -d ~/tools/Sublist3r ]];then
        echo -e "\e[32mSublist3r juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak Sublist3r\e[0m"
        echo -e -n " - \e[34mInstalacja Sublist3r\e[0m"
	
            sh -c "(git clone https://github.com/aboul3la/Sublist3r.git ~/tools/Sublist3r)" > /dev/null 2>&1;
	    
        echo -e -n " - \e[34mGit clone\e[0m";
	        
            sh -c "(sudo pip3 install -r ~/tools/Sublist3r/requirements.txt)" > /dev/null 2>&1;
	    
        echo -e -n " - \e[34mInstalacja requirements\e[0m";
	    echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja Knock.py
if [[ -d ~/tools/knock ]];then
        echo -e "\e[32mKnock.py juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak knock.py\e[0m"
        echo -e -n " - \e[34mInstalacja knock.py\e[0m"
	
            sh -c "(git clone https://github.com/guelfoweb/knock.git ~/tools/knock)" > /dev/null 2>&1;
	    
        echo -e -n " - \e[34mGit clone\e[0m";
	
	        sh -c "(sudo apt install python3-dnspython -y)" > /dev/null 2>&1;
            sh -c "(sudo apt install python2-dnspython -y)" > /dev/null 2>&1;
            sh -c "(sudo pip3 install -r ~/tools/knock/requirements.txt)" > /dev/null 2>&1;
	        sh -c "(sudo python2 ~/tools/knock/setup.py install)" > /dev/null 2>&1;
	    
        echo -e -n " - \e[34mInstalacja requirements\e[0m";
	    echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja httpx
if command -v httpx &> /dev/null 2>&1; then
        echo -e "\e[32mhttpx juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak httpx\e[0m"
        echo -e -n " - \e[34mInstalacja httpx\e[0m"
        echo -e -n " - \e[34mPobieranie\e[0m";

            sh -c "(wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.2/httpx_1.0.2_linux_amd64.tar.gz -P ~/tools/httpx)" > /dev/null 2>&1;

        echo -e -n " - \e[34mInstalacja\e[0m";

            tar -xvf ~/tools/httpx/httpx_1.0.2_linux_amd64.tar.gz -C ~/tools/httpx/ > /dev/null 2>&1;
            sudo mv ~/tools/httpx/httpx /usr/local/bin/httpx

        echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja gau
if command -v gau &> /dev/null 2>&1; then
        echo -e "\e[32mgau juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak gau\e[0m"
        echo -e -n " - \e[34mInstalacja gau\e[0m"
        echo -e -n " - \e[34mPobieranie\e[0m";

            sh -c "(wget https://github.com/lc/gau/releases/download/v1.0.7/gau_1.0.7_linux_amd64.tar.gz -P ~/tools/gau)" > /dev/null 2>&1;

        echo -e -n " - \e[34mInstalacja\e[0m";

            tar -xvf ~/tools/gau/gau_1.0.7_linux_amd64.tar.gz -C ~/tools/gau/ > /dev/null 2>&1;
            sudo mv ~/tools/gau/gau /usr/bin/gau

        echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja sherlock
if [[ -d ~/tools/sherlock ]];then
        echo -e "\e[32msherlock juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak sherlock\e[0m"
        echo -e -n " - \e[34mInstalacja sherlock\e[0m"
	    echo -e -n " - \e[34mGit clone\e[0m";
            
            sh -c "(git clone https://github.com/sherlock-project/sherlock.git ~/tools/sherlock)" > /dev/null 2>&1;
	    
	    echo -e -n " - \e[34mInstalacja requirements\e[0m";    
            
            sh -c "(sudo python3 -m pip install -r ~/tools/sherlock/requirements.txt)" > /dev/null 2>&1;
	    
	    echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja WhatsMyName
if [[ -f ~/tools/WhatsMyName/whatsmyname.sh ]];then
        echo -e "\e[32mWhatsMyName juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak WhatsMyName\e[0m"
        echo -e -n " - \e[34mInstalacja WhatsMyName\e[0m"
	    echo -e -n " - \e[34mGit clone\e[0m";
            
            sh -c "(git clone https://github.com/WebBreacher/WhatsMyName ~/tools/WhatsMyName)" > /dev/null 2>&1;
	    
	    echo -e -n " - \e[34mInstalacja requirements\e[0m";    
            
            sh -c "(sudo python3 -m pip install -r ~/tools/WhatsMyName/requirements.txt)" > /dev/null 2>&1;
	    
	    echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja dirsearch
if [[ -d ~/tools/dirsearch ]];then
        echo -e "\e[32mdirsearch juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak dirsearch\e[0m"
        echo -e -n " - \e[34mInstalacja dirsearch\e[0m"
	    echo -e -n " - \e[34mGit clone\e[0m";
            
            sh -c "(git clone https://github.com/maurosoria/dirsearch.git ~/tools/dirsearch)" > /dev/null 2>&1;
	    
	    echo -e " - \e[32mGotowe\e[0m";
fi

#ustawienie ZSH jako natywny shell dla mojego usera
echo -e -n " - \e[34mUstawienie ZSH natywnym shell\e[0m"
chsh -s $(which zsh);
echo -e " - \e[32mGotowe\e[0m";

echo -e "\e[41mReboot\e[0m";
echo "";
sudo reboot

#TODO:
#Przeglad i dodanie narzedzi z : https://github.com/AlexisAhmed/BugBountyToolkit
#Przeglad i dodanie narzedzi z : https://github.com/nahamsec/bbht
