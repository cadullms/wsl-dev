sudo apt update
sudo apt install -y python3-pip
result=$( grep -e "alias python" ~/.bashrc )
if [ -z "$result" ]; then
  echo 'alias python="python3"' >> ~/.bashrc
  source  ~/.bashrc
fi