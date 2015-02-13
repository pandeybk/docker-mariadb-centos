# docker-mariadb-centos7
Base docker image to run a MariaDB database server in Centos 7, which can be linked to other containers.

Installation
------------

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future. These builds are performed by the **Docker Trusted Build** service.


		docker pull bkpandey/docker-mariadb-centos:latest


Alternately you can build the image yourself.
To create the image and tag is as latest `bkpandey/docker-mariadb-centos:latest`, execute the following command on the docker-mariadb-centos folder:

		git clone https://github.com/pandeybk/docker-mariadb-centos.git
		cd docker-mariadb-centos
		docker build -t bkpandey/docker-mariadb-centos:latest .

To run the image and bind to port 3306:

		docker run -d -p 3306:3306 bkpandey/docker-mariadb-centos

The first time that you run your container, a new user `admin` with all privileges 
will be created in MariaDB with a random password. To get the password, check the logs
of the container by running:

		docker logs <CONTAINER_ID>

You will see an output like the following:

		========================================================================
		You can now connect to Mariadb server using.

			mysql -uadmin -pDatuy0ej -h<host> -P<port>

		========================================================================


In this case, `Datuy0ej` is the password assigned to the `admin` user.

Please do not forget to change the above password as soon as possible! 

Note:By default MariaDB user 'root' has no password but only allows local connections.

