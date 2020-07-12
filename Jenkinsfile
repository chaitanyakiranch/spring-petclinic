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

	// Compile the code with Maven
			
			stage ('Compile Stage') {
				steps {
				
					sh "cd spring-petclinic && ./mvnw package"
				}
			}
			
			
			stage('Build Docker image for spring-pet-clinic') {
			  steps {
				sh 'cd spring-petclinic && docker build -t  docker-spring-pet-clinic .'
			  }
			}			
     
        }
 }