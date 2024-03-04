#! /bin/bash

# Instalar umas ferramentas de engenharia pode ser útil.
# Vou deixar pelo menos listadas algumas.

# Software de mapas:
sudo apt install -y qgis;

# Software de programação estilo MAT-LAB
sudo apt install -y \
    octave \
    octave-control \
    octave-image \
    octave-io \
    octave-optim \
    octave-signal \
    octave-statistics;

# Software para criar pdf em matemática:
sudo apt install -y \
    texlive \
    texmaker \
    pdflatex;

# AndroidStudio e VSCode precisam ser baixados pela internet.
# Não vale a pena colocar em linha de comando.

# Software de backup, útil se sistema de arquivos for o timeshift.
sudo apt install -y timeshift;

# NumLock desligado na inicialização:
#sudo apt install numlockx
# Esse passo precisa ser manual (por enquanto)
# Ir para opção no menu "login window", em settings, acionar o numlock no login

# Procurar o Oh My Bash e usar o tema
# OSH_THEME="nwinkler"

# Baixar o opera beta e ver se funciona a netflix

# Problemas com dpkg linux firmware, image-generic e assim em diante:
# sudo rm -rf /var/lib/dpkg/info/*.*
# sudo apt-get clean
# sudo apt-get install -f
# sudo apt-get update

