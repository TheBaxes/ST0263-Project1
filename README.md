# Proyect 1 ST0263
## By: Sebastian Patiño - spatino6@eafit.edu.co
## 2018-1

# Deploy in Ubuntu
0. Before launching the application in your local environment be sure to have installed Rails, Ruby and SQLite latest versions.

1. Start by downloading the gems used in the project
  
        bundle install

2. After that, do a database migration

        rails db:migrate

3. When that is done, start the server

        rails server
4. Finally, test the webpage going into localhost:3000


# Deploy in DCA and AWS

1. Download and install Docker and docker-compose latests versions for CentOS 7

2. Clone the repository into the work environment

        git clone https://github.com/TheBaxes/ST0263-Project1.git

3. Enter into the project folder and generate a self-signed certificates

        sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ssl/localhost.key -out ssl/localhost.crt
        
4. Open and edit the nginx.conf file to have the ssl_certificate and ssl_certificate_key assigned to their respective files

5. Build and run with docke-compose
        
        docker-compose build
        docker-compose up
