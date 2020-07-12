pipeline {
    agent any

    stages {
	
	// Cleanup the workspace before the build
	
			stage('Workspace Cleanup'){
			
				steps{
				 
				 cleanWs()
				
				}
			}

	// Clone git repo for spring boot app spring-petclinic			
        
			stage('SCM Checkout'){
			
				steps{
				 
				 sh "git clone https://github.com/chaitanyakiranch/spring-petclinic.git"
				
				}
	   
			} 
			
	// Compile the code  for spring boot app spring-petclinic				
			
			stage ('Compile the code ') {
				steps {
				
					sh "cd spring-petclinic && ./mvnw compile"
				}
			}
			
	// Run the Unit tests for the application.			

			stage ('Run Unit tests ') {
				steps {
				
					sh "cd spring-petclinic && ./mvnw test"
				}
			}			

	// Package the code 
			
			stage ('Package Stage') {
				steps {
				
					sh "cd spring-petclinic && ./mvnw clean package"
				}
			}
			
	// Build the docker image 			
			
			stage('Build Docker image for spring-pet-clinic') {
			  steps {
				sh 'cd spring-petclinic && docker build -t  chaitanyakiranchitta/docker-spring-pet-clinic .'
				sh 'cd spring-petclinic && docker build -t  chaitanyakiranchitta-petclinic.jfrog.io/docker-spring-pet-clinic .'
			  }
			}			
     
		
	// Push the docker image to dockerhub		
	
		stage('Docker Push to docker hub') {
		  steps {
				withCredentials([usernamePassword(credentialsId: 'chaitanyakiranchitta', passwordVariable: 'dockerhubpwd', usernameVariable: 'dockerhubusername')]) {
					sh "docker login -u ${env.dockerhubusername} -p ${env.dockerhubpwd}"
					sh 'docker push chaitanyakiranchitta/docker-spring-pet-clinic:latest'
				}
			}
		}

	// Push the docker image to Jfrog artifactory		
	
		stage('Docker Push to Jfrog artifactory') {
		  steps {
				withCredentials([usernamePassword(credentialsId: 'chaitanyakiranchitta', passwordVariable: 'jfrogartpwd', usernameVariable: 'jfrogartusername')]) {
					sh "docker login chaitanyakiranchitta-petclinic.jfrog.io -u ${env.jfrogartusername} -p ${env.jfrogartpwd}"
					sh "docker tag chaitanyakiranchitta/docker-spring-pet-clinic chaitanyakiranchitta-petclinic.jfrog.io/docker-spring-pet-clinic"
					sh 'docker push chaitanyakiranchitta-petclinic.jfrog.io/docker-spring-pet-clinic'
				}
			}
		}		

	}
 }