// Jenkinsfile
pipeline {
    agent any

    stages {
        stage('Backup') {
            agent {
                docker {
                    alwaysPull true
                    registryUrl "${params.REGISTRY_URL}"
                    registryCredentialsId "${params.REGISTRY_CREDENTIALS_ID}"
                    image "${params.IMAGE}"
                    args "-u root --entrypoint '' -v ${WORKSPACE}:/tmp"
                    // args "-e MAILGUN_API_KEY=${env.MAILGUN_API_KEY} -e EMAIL_THRESHOLD=${env.EMAIL_THRESHOLD} -v ${WORKSPACE}/data:/data"
                    reuseNode true
                }
            }
            steps {
                script {
                    withCredentials(bindings: [ \
                        sshUserPrivateKey( \
                            credentialsId: "${params.SSH_KEY_CREDENTIALS_ID}", \
                            keyFileVariable: 'JENKINS_CREDENTIAL_APPLICATION_DEPLOYMENT_PREVIOUSLY_AUTHORIZED_SSH_KEY_PRIVATE', \
                            // usernameVariable: 'JENKINS_CREDENTIAL_APPLICATION_DEPLOYMENT_PREVIOUSLY_AUTHORIZED_SSH_USERNAME' \
                        )
                    ]) {
                        sh '''
                        echo "Setting up SSH credentials inside Docker container..."
                        mkdir -p $HOME/.ssh
                        cp ${JENKINS_CREDENTIAL_APPLICATION_DEPLOYMENT_PREVIOUSLY_AUTHORIZED_SSH_KEY_PRIVATE} $HOME/.ssh/id_rsa
                        chmod 600 $HOME/.ssh/id_rsa
                        /usr/bin/env bash /workspace/entrypoint.sh
                        '''
                    }
                }
                archiveArtifacts artifacts: 'docker_volume_backup.tar.gz', allowEmptyArchive: true
            }
            // post {
            //     success {
            //         //archiveArtifacts
            //         archiveArtifacts artifacts: 'email-stats.csv', allowEmptyArchive: true
            //     }
            // }
        }
    }
}
