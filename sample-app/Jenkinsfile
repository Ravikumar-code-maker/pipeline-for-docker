pipeline {
  agent any

  // Automatic trigger: Jenkins scans for changes. 
  // For "Push to Dev" trigger, use the "GitHub hook trigger" in Job UI.
  triggers {
    githubPush()
  }
   environment {
     APP_NAME      ="sample-app"
     NEXUS_URL     = credntilas('nexus-url')
     GCP_PROJECT   = credentials('gcp-project-id')
     GCP_REGION    = crednetilas('gcp-region')
     IMAGE_NAME    = "${GCR_REGION}/{GCP_PROJECT}/${APP_NAME}"
     VERSION       = "1.0.${BUILD_NUMBER}"

    // Securely fetch server IPs from Global Jenkins Variables
    DEV_URL        = "${env.DEV_SERVER_URL}"
    TEST_URL       = "${env.TEST_SERVER_URL}"
    PROD_URL       = "${env.PROD_SERVER_URL}"

    SSH_USER       = "raviakira9"
    SSH_CRED_ID    = "my-ssh-key-id"
   }
  stages {
    stage(checlout) {
      steps {
        checkout scmGit(branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ravikumar-code-maker/pipeline-for-docker']])
      }
    }
    stage('BUILD & TEST') {
      // Only run automatically on 'dev' branch changes
      when { branch 'dev' }
      steps {
        dir('sample-app')
           sh 'mvn clean package -DskipTests'
      }
    }
    stage ('Publish To Nexus'){
      // Only run automatically on 'dev' branch changes
      when { branch 'dev' }
      steps {
        dir() 
      }
      
    }
  }
}
