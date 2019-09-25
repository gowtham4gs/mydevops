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
	stage ('Test image')
	{
	app.inside
	{
	sh 'echo "Test passed"'	}
	}
	stage ('Push image'){
	docker.withRegistry('https://registry.hub.docker.com','docker-hub-createntials')
	{
	app.push("${env.BUILD_NUMBER}")
	app.push("latest")
	}
	}
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
	
