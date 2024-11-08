version: '3.3' 
services: 
  db: 
    image: mysql:5.7 
    volumes: 
      - db_data:/var/lib/mysql 
    restart: always 
    environment: 
      MYSQL_ROOT_PASSWORD: somewordpress 
      MYSQL_DATABASE: wordpress 
      MYSQL_USER: wordpress 
      MYSQL_PASSWORD: wordpress 

  wordpress: 
    depends_on: 
      - db 
    image: wordpress:latest 
    ports: 
      - "8000:80" 
    restart: always 
    environment: 
      WORDPRESS_DB_HOST: db:3306 
      WORDPRESS_DB_USER: wordpress 
      WORDPRESS_DB_PASSWORD: wordpress 
      WORDPRESS_DB_NAME: wordpress 

  phpmyadmin: 
    image: phpmyadmin/phpmyadmin 
    ports: 
      - "8080:80" 
    environment: 
      PMA_HOST: db 
      PMA_USER: wordpress 
      PMA_PASSWORD: wordpress 
    depends_on: 
      - db 

volumes: 
  db_data: {}

