#!/bin/bash
#Gauszton_skrypt_v_1_5
echo "##########################################################################################################################";
echo "#";
echo "#   Power Gauszton skrypcik v 1.4"
echo "#";
echo "##########################################################################################################################";
echo "";
echo "Tworzenie pliku logowania: "; 
sudo touch /var/log/skryptgauszton.log
sudo chmod 666 /var/log/skryptgauszton.log
echo 'Rozpoczecie instalacji' >> /var/log/skryptgauszton.log
# update i upgrade z wymuszeniem -y 
echo "Update i Upgrade ";
sudo apt update >> /var/log/skryptgauszton.log 2>&1; 
sudo apt upgrade -y >> /var/log/skryptgauszton.log 2>&1;
echo -e '\e[32mGotowe\e[0m';

#Tworzenie struktury katalogów
katalogi="tools tools/other dane"

for katalog in $katalogi; do
	if [[ -d ~/$katalog/ ]];then
    		echo -e "\e[32mkatalog $katalog istnieje\e[0m"
	else
    		echo -e -n "\e[91mBrak katalogu $katalog\e[0m"
    		echo -e -n " - \e[34mTworze katalog $katalog\e[0m"

            		mkdir ~/$katalog

    		echo -e " - \e[32mGotowe\e[0m";
	fi
done
#----------------------------------------------------------------------------------------------------------------------------------------------

dodatek="libcurl4-openssl-dev libssl-dev  ruby-full ruby-dev libxml2 libxml2-dev build-essential libffi-dev python-dev 
  libxslt1-dev libgmp-dev zlib1g-dev python-setuptools libldns-dev python3-dnspython python2-dnspython xvfb awscli inetutils-ping dnsutils net-tools"

for dodatekA in $dodatek; do
        echo -n -e " - \e[34mSprawdzanie $dodatekA\e[0m"
        
            sudo apt install $dodatekA -y -qq >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
done

aplikacje="rename jq xargs unzip curl wget git whois python2 python3 autojump zsh sqlmap nmap masscan recon-ng phantomjs dirb 
gcc vim make whois perl nikto tmux hydra dnsrecon"
for aplikacja in $aplikacje; do
    if command -v $aplikacja &>> /var/log/skryptgauszton.log 2>&1; then
    	echo -e "\e[32m$aplikacja juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $aplikacja\e[0m"
        echo -n -e " - \e[34mInstalacja $aplikacja\e[0m"
        
            sudo apt install $aplikacja -y -qq >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
    fi
done

snapAplikacje="chromium amass"
for aplikacja in $snapAplikacje; do
    if command -v $aplikacja &>> /var/log/skryptgauszton.log 2>&1; then
    	echo -e "\e[32m$aplikacja juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $aplikacja\e[0m"
        echo -n -e " - \e[34mInstalacja $aplikacja\e[0m"
        
            sudo snap install $aplikacja >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
    fi
done

gitInstall="
                https://github.com/yassineaboukir/asnlookup.git 
                https://github.com/WebBreacher/WhatsMyName.git 
                https://github.com/nahamsec/crtndstry.git
                https://github.com/aufzayed/HydraRecon.git
                https://github.com/aboul3la/Sublist3r.git
                https://github.com/sherlock-project/sherlock.git
                https://github.com/maurosoria/dirsearch.git
                https://github.com/nahamsec/lazys3.git
                https://github.com/nahamsec/crtndstry.git
                https://github.com/nahamsec/lazyrecon.git
                https://github.com/jobertabma/virtual-host-discovery.git
                https://github.com/s0md3v/Striker.git
                https://github.com/s0md3v/Photon.git
                https://github.com/pwn0sec/PwnXSS.git
                https://github.com/blechschmidt/massdns.git
                https://github.com/scipag/vulscan.git
                https://github.com/maaaaz/webscreenshot.git
                https://github.com/infosec-au/altdns.git
                https://github.com/s0md3v/XSStrike.git
                https://github.com/urbanadventurer/WhatWeb.git
                https://github.com/AlexisAhmed/bucket_finder.git 
                https://github.com/enablesecurity/wafw00f.git
                https://github.com/AlexisAhmed/theHarvester.git 
                https://github.com/christophetd/CloudFlair.git 
                 
"
#github.com/projectdiscovery/subfinder.git
for aplikacja in $gitInstall; do

    if [[ -d ~/tools/$(basename $aplikacja .git) ]];then
    	echo -e "\e[32m$(basename $aplikacja .git) juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $(basename $aplikacja .git)\e[0m"
        echo -n -e " - \e[34mGit clone $(basename $aplikacja .git)\e[0m"
        
        	git clone $aplikacja ~/tools/$(basename $aplikacja .git) >> /var/log/skryptgauszton.log 2>&1;
        	
        	if [[ -f ~/tools/$(basename $aplikacja .git)/requirements.txt ]];then
    			echo -n -e " - \e[34mInstalacja wymaganych plikow \e[0m"
    			
    			sh -c "(sudo python3 -m pip install -r ~/tools/$(basename $aplikacja .git)/requirements.txt)" >> /var/log/skryptgauszton.log 2>&1;
    			
    			echo -e " - \e[32mGotowe\e[0m";
    		else
    			echo -e " - \e[32mGotowe\e[0m";
    		fi
        
    fi
done

goInstall=" github.com/michenriksen/aquatone 
            github.com/tomnomnom/httprobe 
            github.com/tomnomnom/unfurl
            github.com/tomnomnom/waybackurls
            github.com/Emoe/kxss
            github.com/OJ/gobuster
            github.com/ffuf/ffuf
"

for aplikacja in $goInstall; do

    if [[ -f ~/go/bin/$(basename $aplikacja .git) ]];then
    	echo -e "\e[32m$(basename $aplikacja .git) juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $(basename $aplikacja .git)\e[0m"
        echo -n -e " - \e[34mGo install $(basename $aplikacja .git)\e[0m"
	
        sh -c "(go get -u $aplikacja)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
    fi
done

gitInstallSetup="
                https://github.com/nahamsec/JSParser.git
                https://github.com/guelfoweb/knock.git
"

for aplikacja in $gitInstallSetup; do

    if [[ -d ~/tools/$(basename $aplikacja .git) ]];then
    	echo -e "\e[32m$(basename $aplikacja .git) juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $(basename $aplikacja .git)\e[0m"
        echo -n -e " - \e[34mGit clone $(basename $aplikacja .git)\e[0m"
        
        	git clone $aplikacja ~/tools/$(basename $aplikacja .git) >> /var/log/skryptgauszton.log 2>&1;
        	
        	if [[ -f ~/tools/$(basename $aplikacja .git)/requirements.txt ]];then
    			echo -n -e " - \e[34mInstalacja wymaganych plikow \e[0m"
    			
    			sh -c "(sudo python3 -m pip install -r ~/tools/$(basename $aplikacja .git)/requirements.txt)" >> /var/log/skryptgauszton.log 2>&1;
    			
    			echo -n -e " - \e[34mInstalacja setup.py \e[0m"
    			sh -c "(sudo python3 ~/tools/$(basename $aplikacja .git)/setup.py install)" >> /var/log/skryptgauszton.log 2>&1;
    			
    			
    			echo -e " - \e[32mGotowe\e[0m";
    		else
    			echo -e " - \e[32mGotowe\e[0m";
    		fi
        
    fi
done

gemInstall="
                https://github.com/wpscanteam/wpscan.git
"

for aplikacja in $gemInstall; do

    if [[ -d ~/tools/$(basename $aplikacja .git) ]];then
    	echo -e "\e[32m$(basename $aplikacja .git) juz zainstalowany\e[0m"
    else
        echo -e -n "\e[91mBrak $(basename $aplikacja .git)\e[0m"
        echo -n -e " - \e[34mGit clone $(basename $aplikacja .git)\e[0m"
        
        	git clone $aplikacja ~/tools/$(basename $aplikacja .git) >> /var/log/skryptgauszton.log 2>&1;
	
    		echo -n -e " - \e[34mInstalacja\e[0m"
    		cd ~/tools/$(basename $aplikacja .git)
    		sudo gem install bundler >> /var/log/skryptgauszton.log 2>&1;
            sudo bundle install --without test >> /var/log/skryptgauszton.log 2>&1;
    			
    		echo -e " - \e[32mGotowe\e[0m";
    		
    fi
done

#----------------------------------------------------------------------------------------------------------------------------------------------
#instalacja pakietw niestandardowych >3 takie przechodzi na pętle

if command python2 -m pip --version &>> /var/log/skryptgauszton.log 2>&1; then
        echo -e "\e[32mpython2-pip juz zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak python2-pip\e[0m"
        echo -n -e " - \e[34mInstalacja python2-pip\e[0m"
        
            curl https://bootstrap.pypa.io/get-pip.py --output ~/tools/other/get-pip.py >> /var/log/skryptgauszton.log 2>&1; 
            sudo python2 ~/tools/other/get-pip.py >> /var/log/skryptgauszton.log 2>&1; 
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if command python3 -m pip --version &>> /var/log/skryptgauszton.log 2>&1; then
        echo -e "\e[32mpython3-pip juz zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak python3-pip\e[0m"
        echo -n -e " - \e[34mInstalacja python-pip\e[0m"
        
        sudo apt install python3-pip -y >> /var/log/skryptgauszton.log 2>&1; 
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if command go version  &>> /var/log/skryptgauszton.log 2>&1; then
        echo -e "\e[32mgolang juz zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak golang\e[0m"
        echo -n -e " - \e[34mInstalacja golang\e[0m"
        
        sudo apt install golang -y >> /var/log/skryptgauszton.log 2>&1; 
        
        echo -e " - \e[32mGotowe\e[0m";
fi

#Make massdns
        echo -e -n "\e[34mMake massdns\e[0m"
        cd ~/tools/massdns
        sudo make >> /var/log/skryptgauszton.log 2>&1;
        echo -e " - \e[32mGotowe\e[0m";

#Dodanie ln vulscan
        
        if [[ -L /usr/share/nmap/scripts/vulscan ]];then
            echo -e "\e[32mln -s dla vulscan wystepuje\e[0m"
        else
            echo -e -n "\e[91mln -s dla vulscan\e[0m"
            sudo ln -s ~tools/vulscan /usr/share/nmap/scripts/vulscan    
            echo -e " - \e[32mGotowe\e[0m";
        fi

#Instalacja pip3 webscreenschot 
        echo -e -n "\e[34mpip3 install  webscreenshot\e[0m"
        pip3 install webscreenshot >> /var/log/skryptgauszton.log 2>&1; 
        echo -e " - \e[32mGotowe\e[0m";

#----------------------------------------------------------------------------------------------------------------------------------------------
#instalacja OhMyZSH
if [[ -d ~/.oh-my-zsh ]];then
        echo -e "\e[32mOhMyZSH zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak OhMyZSH\e[0m"
        echo -n -e " - \e[34mInstalacja OhMyZSH\e[0m"
    
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended >> /var/log/skryptgauszton.log 2>&1; 
    
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]];then
        echo -e "\e[32mzsh-autosuggestions zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak zsh-autosuggestions\e[0m"
        echo -n -e " - \e[34mInstalacja zsh-autosuggestions\e[0m"
        
            sh -c "(git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]];then
        echo -e "\e[32mzsh-syntax-highlighting zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak zsh-syntax-highlighting\e[0m"
        echo -n -e " - \e[34mInstalacja zsh-syntax-highlighting\e[0m"
        
            sh -c "(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]];then
        echo -e "\e[32mzsh-completions zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak zsh-completions\e[0m"
        echo -n -e " - \e[34mInstalacja zsh-completions\e[0m"
        
            sh -c "(git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/zsh-docker ]];then
        echo -e "\e[32mzsh-docker zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak zsh-docker\e[0m"
        echo -n -e " - \e[34mInstalacja zsh-docker\e[0m"
        
            sh -c "(git clone https://github.com/zsh-users/zsh-docker.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-docker)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -d ~/.oh-my-zsh/custom/plugins/auto-color-ls ]];then
        echo -e "\e[32mauto-color-ls zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak auto-color-ls\e[0m"
        echo -n -e " - \e[34mInstalacja auto-color-ls\e[0m"
   
            sh -c "(git clone https://github.com/gretzky/auto-color-ls.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/auto-color-ls)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi

if [[ -f ~/.oh-my-zsh/custom/themes/common.zsh-theme ]];then
        echo -e "\e[32mCommon zsh theme zainstalowany\e[0m"
else
        echo -e -n "\e[91mBrak Common zsh theme\e[0m"
        echo -n -e " - \e[34mCommon zsh theme zainstalowany\e[0m"
            
            sh -c "(wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme)" >> /var/log/skryptgauszton.log 2>&1;
        
        echo -e " - \e[32mGotowe\e[0m";
fi
#----------------------------------------------------------------------------------------------------------------------------------------------
#Dodanie mojego pliku zshrc
if [[ $(curl -sb -H "Accept: application/txt" "https://raw.githubusercontent.com/Gauszton/zsh/main/.zshrc" | head -n 1) == $(cat ~/.zshrc | head -n 1) ]];then
	    echo -e "\e[32mPlik .zshrc w aktualnej wersji zgodnej z Github.com/Gauszton/zsh\e[0m"
else
        echo -e -n "\e[91mBrak pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
	    echo -n -e " - \e[34mDodanie mojego pliku .zshrc z Github.com/Gauszton/zsh\e[0m"
            
            cd ~; mv .zshrc old.zshrc; git clone https://github.com/Gauszton/zsh >> /var/log/skryptgauszton.log 2>&1; mv zsh/.zshrc ~/.zshrc; rm -rf zsh; rm ~/old.zshrc;
        
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

            wget "https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip" -P ~/tools/other >> /var/log/skryptgauszton.log 2>&1;
            unzip ~/tools/other/chromedriver_linux64.zip -d ~/tools/other/ >> /var/log/skryptgauszton.log 2>&1;
            sudo mv ~/tools/other/chromedriver /usr/bin/chromedriver
            sudo chown root:root /usr/bin/chromedriver
            sudo chmod +x /usr/bin/chromedriver

        echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja httpx
if command -v httpx &>> /var/log/skryptgauszton.log 2>&1; then
        echo -e "\e[32mhttpx juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak httpx\e[0m"
        echo -e -n " - \e[34mInstalacja httpx\e[0m"
        echo -e -n " - \e[34mPobieranie\e[0m";

            sh -c "(wget https://github.com/projectdiscovery/httpx/releases/download/v1.0.2/httpx_1.0.2_linux_amd64.tar.gz -P ~/tools/httpx)" >> /var/log/skryptgauszton.log 2>&1;

        echo -e -n " - \e[34mInstalacja\e[0m";

            tar -xvf ~/tools/httpx/httpx_1.0.2_linux_amd64.tar.gz -C ~/tools/httpx/ >> /var/log/skryptgauszton.log 2>&1;
            sudo mv ~/tools/httpx/httpx /usr/local/bin/httpx

        echo -e " - \e[32mGotowe\e[0m";
fi

#Instalacja gau
if command -v gau &>> /var/log/skryptgauszton.log 2>&1; then
        echo -e "\e[32mgau juz zainstalowane\e[0m"
else
        echo -e -n "\e[91mBrak gau\e[0m"
        echo -e -n " - \e[34mInstalacja gau\e[0m"
        echo -e -n " - \e[34mPobieranie\e[0m";

            sh -c "(wget https://github.com/lc/gau/releases/download/v1.0.7/gau_1.0.7_linux_amd64.tar.gz -P ~/tools/gau)" >> /var/log/skryptgauszton.log 2>&1;

        echo -e -n " - \e[34mInstalacja\e[0m";

            tar -xvf ~/tools/gau/gau_1.0.7_linux_amd64.tar.gz -C ~/tools/gau/ >> /var/log/skryptgauszton.log 2>&1;
            sudo mv ~/tools/gau/gau /usr/bin/gau

        echo -e " - \e[32mGotowe\e[0m";
fi

echo "";
# SecLists
read -p "Czy dodać SecLists? y/n " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "";
    echo -e "\e[34mPobieranie SecList\e[0m";
        git clone https://github.com/danielmiessler/SecLists.git ~/tools/SecLists >> /var/log/skryptgauszton.log 2>&1;
    echo "";
    echo -e "\e[32mGotowe\e[0m";
fi
echo "";
#ustawienie ZSH jako natywny shell dla mojego usera
read -p "Ustawic ZSH natywnym shell? y/n " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "";
    echo -e "\e[34mUstawienie ZSH natywnym shell\e[0m"
        chsh -s $(which zsh);
    echo "";
    echo -e "\e[32mGotowe\e[0m";
fi
echo "";
# Reboot
read -p "Wykonanie restartu po wyczyszczeniu? y/n " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "";
    echo -e "\e[34mCzyszczenie\e[0m"
    sudo apt-get clean
    echo "";
    echo -e "\e[41mReboot\e[0m";
    sudo reboot;
else
    echo "";
    echo -e "\e[34mCzyszczenie\e[0m"
    sudo apt-get clean
    echo "";
    echo -e "\e[32mGotowe\e[0m";
    
fi
echo "";