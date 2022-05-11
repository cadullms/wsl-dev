sudo apt update
sudo apt install -y unzip
sudo apt install -y --fix-missing openjdk-11-jdk
wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.4.3.zip
unzip -o apache-jmeter-5.4.3.zip
rm apache-jmeter-5.4.3.zip
sudo mv -f apache-jmeter-5.4.3 /opt/jmeter

result=$( grep -e "/opt/jmeter/bin" ~/.bashrc )
if [ -z "$result" ]; then
  echo 'export PATH="$PATH:/opt/jmeter/bin"' >> ~/.bashrc
  # You might instead want to add the following lines manually to /opt/jmeter/bin/jmeter for proper scaling on big screens
  echo 'export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.controlFont=Dialog-20"' >> ~/.bashrc
  echo 'export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.systemFont=Dialog-20"' >> ~/.bashrc
  echo 'export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.userFont=Dialog-16"' >> ~/.bashrc
  echo 'export JVM_ARGS="$JVM_ARGS -Dswing.plaf.metal.smallFont=Dialog-16"' >> ~/.bashrc
fi

result=$( grep -e "# scaling settings" /opt/jmeter/bin/jmeter.properties )
if [ -z "$result" ]; then
    # You might instead want to add the following lines manually to /opt/jmeter/bin/jmeter.properties for proper scaling on big screens
    echo '# scaling settings' >> /opt/jmeter/bin/jmeter.properties
    echo 'jmeter.hidpi.mode=true' >> /opt/jmeter/bin/jmeter.properties
    echo 'jmeter.hidpi.scale.factor=2.0' >> /opt/jmeter/bin/jmeter.properties
    echo 'jmeter.toolbar.icons.size=32x32' >> /opt/jmeter/bin/jmeter.properties
    echo 'jmeter.tree.icons.size=24x24' >> /opt/jmeter/bin/jmeter.properties
    echo 'jsyntaxtextarea.font.family=Hack' >> /opt/jmeter/bin/jmeter.properties
    echo 'jsyntaxtextarea.font.size=28' >> /opt/jmeter/bin/jmeter.properties
fi