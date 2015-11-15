#!/bin/sh
mkdir -p /vagrant/binaries/
rm -rf /vagrant/binaries/* 2> /dev/null || echo > /dev/null
echo "Compiling the source"
javac /vagrant/source/*.java -cp /vagrant/libraries/* -d /vagrant/binaries/
echo "#!/bin/bash\njava -cp /vagrant/binaries/:/vagrant/libraries/* MyFirstApp" >> /vagrant/binaries/execute.sh
