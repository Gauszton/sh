Power Gauszton skrypcik v.1.4
==========================

 Automatyczny skrypt do instalacji narzędzi i przygotowywania środowiska maszyn wirualnych pod BugBounty i CTF.

 Skypt został napisany od podstaw przy wykorzystaniu basha i narzędzi udostępnionych w ramach github oraz repozytorów linux.

 Poniżej znjadzie się lista narzędzi wykorzystanych w skrypcie oraz link do repozytornium github właściciela.

 **Nie ponoszę odpowiedzialności za problemy z maszynami po uruchomieniu skryptu oraz za nieumyślne lub niezgodne z prawem wykorzystanie narzędzi w nim zawartych.**

Wymagania: 
=======
  - Użytkownik z uprawnieniami sudo 
  - [Na ubuntu] adduser nazwa; usermod -aG sudo nazwa;

Instalacja:
=======
```
git clone https://github.com/Gauszton/sh
cd sh/
chmod +x skrypt.sh
./skrypt.sh
```
Testowane:
=======
  - Ubuntu 20.04 LTS 

ToDo:
=======
 - ~~Kolejne narzędzia ( wypełnienie mojej listy )~~
 - ~~optymalizacja skryptu~~
 - ~~logowanie do logu w /var/log~~
 - możliwość aktualizacji narzędzi z git repo za pomoca jednego skryptu 
 - wybranie poprzez argument skryptu czy będzie to wersja serwer ( tylko narzędzia CLI ) czy GUI dodatkowe narzędzia GUI, 
 - wykonywanie skryptu poprzez SSH, 
 - metoda przechowywanie argumentów w pliku ( klucz RSA, user i inne) 
 - relese v.2 - działa na Ubuntu, Debian, Kali, Parrot, CentOS, Fedora, MacOS