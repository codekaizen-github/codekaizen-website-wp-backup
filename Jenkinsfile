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
                    // args "-e MAILGUN_API_KEY=${env.MAILGUN_API_KEY} -e EMAIL_THRESHOLD=${env.EMAIL_THRESHOLD} -v ${WORKSPACE}/data:/data"
                    reuseNode true
                }
            }
            steps {
                script {
                    sh '/usr/bin/env bash /workspace/entrypoint.sh'
                }
                archiveArtifacts artifacts: '/tmp/docker_volume_backup.tar.gz', allowEmptyArchive: true
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
