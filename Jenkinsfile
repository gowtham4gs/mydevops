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
	stage('Run') {
            steps {
                echo "Run docker image"
                script {
                    pipelineContext.dockerContainer = pipelineContext.app.run()
                }
            }
        }
        stage('Test') {
            steps {
                echo "Testing the app"
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
