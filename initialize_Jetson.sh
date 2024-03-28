#   Author: Yavuz Selim Ozkaya
# LinkedIn: https://www.linkedin.com/in/yavuzselimozkaya

# References: https://github.com/JetsonHacksNano/installSwapfile
# 	      https://gist.github.com/adujardin/c0ee25cfb343ea5b6d17ea88ec6634ac - If you want to remove GUI, visit the link

sudo apt update
sudo apt autoremove -y
sudo apt clean -y
sudo apt remove thunderbird libreoffice-* -y
sudo apt-get purge aisleriot gnome-sudoku gnome-mines gnome-mahjongg gnomine gbrainy -y
sudo apt-get autoremove -y
sudo apt clean -y
echo "[INFO] Some unnecessary stuff has been removed!"

