### LAMP is short for Linux, Apache, MySQL, and PHP

#### Check IP - `ip addr show | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'`

#### Step 1 — Installing the Apache Web Server

```bash
sudo yum install httpd [done]
sudo systemctl status httpd [done]
sudo systemctl start httpd [done]
sudo systemctl status httpd [done]
sudo systemctl enable httpd.service [done]
```

#### Step 2 — Installing MySQL (MariaDB)

```bash
sudo yum install mariadb-server [done]
sudo systemctl start mariadb [done]
sudo systemctl enable mariadb.service [done]
sudo mysql_secure_installation [done]
sudo mysql [done]
```

#### Step 3 — Installing PHP

```bash
sudo yum install php php-mysql
sudo systemctl restart httpd.service
```

#### Step 4 — Testing PHP on your Apache Web Server

```bash
sudo chown -R sammy.sammy /var/www/html/
vi /var/www/html/info.php
```

```php
<?php phpinfo(); ?>
```

```bash
rm /var/www/html/info.php
```
```html
http://your_server_IP_address/info.php
```

#### Step 5 – Testing Database Connection with PHP (Optional)

```bash
mysql -u example_user -p
```

```db
CREATE TABLE example_database.todo_list (
	item_id INT AUTO_INCREMENT,
	content VARCHAR(255),
	PRIMARY KEY(item_id)
);
```

```bash
INSERT INTO example_database.todo_list (content) VALUES ("My first important item");
SELECT * FROM example_database.todo_list;
exit
```

```bash
vi /var/www/html/todo_list.php
```

```php
<?php
$user = "example_user";
$password = "password";
$database = "example_database";
$table = "todo_list";

try {
  $db = new PDO("mysql:host=localhost;dbname=$database", $user, $password);
  echo "<h2>TODO</h2><ol>"; 
  foreach($db->query("SELECT content FROM $table") as $row) {
    echo "<li>" . $row['content'] . "</li>";
  }
  echo "</ol>";
} catch (PDOException $e) {
    print "Error!: " . $e->getMessage() . "<br/>";
    die();
}
```

```bash
http://server_host_or_IP/todo_list.php
```

[Reference Link](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-centos-7#step-4-testing-php-on-your-apache-web-server)
