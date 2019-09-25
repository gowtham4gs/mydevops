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
	
}
	pipeline {
		agent any
	stages {

        stage ('success'){
            steps {
                script {
                    currentBuild.result = 'SUCCESS'
                }
            }
        }
    }
    post {
        failure {
            script {
                currentBuild.result = 'FAILURE'
            }
        }
        always {
            step([$class: 'Mailer',
                notifyEveryUnstableBuild: true,
                recipients: "gowthaman.s@ptechnosoft.com",
                sendToIndividuals: true])
        }
    }
	
	}

