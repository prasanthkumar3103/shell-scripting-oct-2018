#Create a shell script called setupapachevhost.sh as follows:

#!/bin/bash
# setupapachevhost.sh - Apache webhosting automation demo script
file=/etc/passwd

# set the Internal Field Separator to |
IFS='\ '
while read -r domain ip webroot ftpusername
do
        printf "*** Adding %s to httpd.conf...\n" $domain
        printf "Setting virtual host using %s ip...\n" $ip
        printf "DocumentRoot is set to %s\n" $webroot
        printf "Adding ftp access for %s using %s ftp account...\n\n" $domain $ftpusername
	
done < "$file"
