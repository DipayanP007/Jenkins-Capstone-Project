pipeline
{
    agent {
        label 'Production'
    }
    tools
    {
        maven 'mvn'
        jdk 'Java'
    }
    options
    {
        timestamps()
        buildDiscarder(logRotator(numToKeepStr: '5', daysToKeepStr: '5'))
    }
    stages
    {
        stage("Cleanup")
        {
            steps
            {
                sh 'mvn clean'
            }
        }
        
        stage("Test")
        {
            steps
            {
                sh 'mvn test'
            }
        }
        stage("Package")
        {
            steps
            {
                sh 'mvn package'
            }
        }
    }
    post
    {
        always
        {
            emailext (attachLog: true, body: '''$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS: 
            
            Check console output at $BUILD_URL to view the results.''', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'dipayan.pramanik@knoldus.com')
            
        }
        success{
            sh 'echo "--------------------------Deploying------------------------------'
            sshPublisher(publishers: [sshPublisherDesc(configName: 'Production-Server', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd Hello-Spring
java -jar *.jar &''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'Hello-Spring', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*.jar')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
        
            cleanWs()
        }
    }
}