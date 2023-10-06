#!groovy

pipeline {
	agent none
  stages {
  	stage('Docker Build') {
    	agent {
      	docker {
        	image 'docker:latest'
        }
      }
      steps {
      	sh 'docker build --help'
      }
    }
    stage('Docker Build') {
    	agent any
      steps {
      	sh 'docker build  . --file Dockerfile --no-cache --tag huezo/nginx:$(date +%s)'
      }
    }
  }
}

