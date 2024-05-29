pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/LokendraDevOps/intro-component-with-signup-form.git']])
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t frontendapp ."
          sh "docker run -d -p 80:80 frontendapp"
        }

      }
    }

    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }

    stage('Push') {
      steps {
        sh 'docker push frontendappt:latest'
      }
    }

  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
}