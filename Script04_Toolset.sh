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
