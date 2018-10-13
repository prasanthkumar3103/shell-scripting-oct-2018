
#!/bin/bash
# testing nested ifs - use elif

testuser=$1

if grep $testuser /etc/passwd
then
    echo " $testuser exist on this system"
elif ls -R /home/$testuser
then
    echo "The user $testuser doesnt exist on this system"
fi
