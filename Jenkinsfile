node {
    def version
    stage('Preparation') {
        checkout scm
        version = sh(script: 'git rev-list --all --count', returnStdout: true).trim()
        echo "Building version ${version}"
        sh 'docker pull fluent/fluentd:latest-onbuild'
    }
    stage('Build') {
        echo "Building version ${version}"
        sh "docker build -t taimos/fluentd-sumologic:${version} ."
    }
    stage('Publish') {
        sh "docker tag taimos/fluentd-sumologic:${version} taimos/fluentd-sumologic:latest"
        sh "docker push taimos/fluentd-sumologic:${version}"
        sh "docker push taimos/fluentd-sumologic:latest"
    }
}