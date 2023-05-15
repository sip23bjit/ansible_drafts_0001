
# To stop apache
sudo systemctl stop httpd

# Disable Apache
sudo systemctl disable httpd

# Remove Apache
sudo yum remove httpd -y

# Stop MySQL/MariaDB
sudo systemctl stop mariadb

# Disable MySQL/MariaDB
sudo systemctl disable mariadb

# Remove MySQL/MariaDB
sudo yum remove mariadb-server -y

# Remove PHP and its dependencies
sudo yum remove php php-mysql -y

# Clean up residual files and dependencies
sudo yum autoremove -y
sudo yum clean all
