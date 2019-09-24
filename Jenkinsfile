node {
    def app
	
	stage('Clone Repository')
	{
	checkout scm
	}
	stage ('Build image')
	{
	app =docker.build('perpetuuiti/devopsupdates')
	}
	stage ('Run Application') {
    try {
      // Start database container here
       sh 'docker run -d --name Av3sample -p 8000:8000  perpetuuiti/devopsupdates:latest'

      // Run application using Docker image
    
      //sh "docker run -e DB_URI=$DB perpetuuiti/devopsupdates:${env.BUILD_NUMBER}"

      // Run tests using Maven
      //dir ('webapp') {
      //  sh 'mvn exec:java -DskipTests'
      //}
    } catch (error) {
    } finally {
      // Stop and remove database container here
      //sh 'docker-compose stop db'
      //sh 'docker-compose rm db'
    }
  }
	stage ('Push image')
	{
	docker.withRegistry('https://registry.hub.docker.com','docker-hub-createntials')
	{
	app.push("${env.BUILD_NUMBER}")
	app.push("latest")
	}
	}
	}

post {  
         always {  
             echo 'This will always run'  
         }  
         success {  
             echo 'This will run only if successful'  
         }  
         failure {  
             mail bcc: '', body: "<b>Example</b><br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", cc: '', charset: 'UTF-8', from: '', mimeType: 'text/html', replyTo: '', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "foo@foomail.com";  
         }  
         unstable {  
             echo 'This will run only if the run was marked as unstable'  
         }  
         changed {  
             echo 'This will run only if the state of the Pipeline has changed'  
             echo 'For example, if the Pipeline was previously failing but is now successful'  
         }  
     }  
