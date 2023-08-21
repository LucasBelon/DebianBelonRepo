sudo apt install adb \
                 x11vnc;
x11vnc --storepasswd
#Password written to: /home/user/.vnc/passwd
echo -e "\n\nSerão geradas opções pra tela 1240x768 a 30hz:\n\n"

gtf 1240 768 30

echo -e "\n\nCopie essas informações para alterar o extend_screen.sh\n\n"

xrandr
echo -e "\n\nEssas são as resoluções disponíveis. Ao fim temos um dispositivo não usado que pode ser utilizado para a extensão.\n\n"
