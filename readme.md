## Prerequisites 

Install Docker on the machine
Jenkins set up on the machine to run the pipeline. Refer to "Appendix - Jenkins set up" for detailed instructions.

## Run and access the Pet-clinic application

1) The docker image generated is present in Dockerhub as well as the JFrog artifactory.

2) 
	a.	The docker image is present at 
			https://hub.docker.com/r/chaitanyakiranchitta/docker-spring-pet-clinic/

	b.	Run the pet-clinic application from the docker image present in the Dockerhub using the following command

			docker run -d -p 8085:8080  chaitanyakiranchitta/docker-spring-pet-clinic

	c.   The Pet-Clinic Application can be accessed using the below URL

			http://localhost:8085/

3)	a.  The docker image generated is also present in Jfrog artifactory. 
		Run the application from the docker image present in the JFrog Artifactory

			docker run -d -p 8086:8080  chaitanyakiranchitta-petclinic.jfrog.io/docker-spring-pet-clinic:latest

	b. The Pet-Clinic Application can be accessed using the below URL

		http://localhost:8086/

		
## 	Jenkinsfile

The following are the different stages in the pipeline.

1) Workspace Cleanup
2) Git Repo Checkout
3) Compile the code
4) Run Unit tests 
5) Package application
6) Build Docker image for spring-pet-clinic
7) Push image to docker hub
8) Push the docker image to Jfrog artifactory

	
## Appendix - Jenkins set up  

1) The Jenkins pipeline script can be run by setting up Jenkins and following the below steps. 

2) Jenkins can be run as a docker container locally. Execute the following commands 

	docker run -d --name JenkinsPOC -it -p 8080:8080 -p 50000:50000  -v jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock  --restart unless-stopped 4oh4/jenkins-docker
	
3) Wait till image to download and run. Jenkins url can be accessed here

		http://localhost:8080/

4) Run the command to login to running container 	
	
		docker exec -u root -it JenkinsPOC /bin/bash

5) The initial password is present at the following location for initial login.
	
		/var/jenkins_home/secrets/initialAdminPassword

6) Install select plugins

7) Create admin user

8) Click a new Pipeline job in Jenkins by clicking New Item, naming it, and selecting Pipeline.

9) Configure the pipeline to refer to GitHub.

10)Selecting Pipeline script from SCM. Set the repository URL to the fork of Spring PetClinic. The following URL can be used.

	https://github.com/chaitanyakiranch/spring-petclinic

	Script Path - Jenkinsfile

11) Save the Job.

12) Run the following command in the running container to provide necessary permissions.

		sudo chmod 666 /var/run/docker.sock

13) Goto Manage Jenkins --> Manage Credentials 

	Add necessary credentials (CredentialId, Username, Password) for Dockerhub and JFrog Artifactory
	
14) Run the build in Jenkins which should successfully finish all the stages and have the necessary artifacts available to run the 	 application.	












