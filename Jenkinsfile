pipeline {
    agent any

    stages{
        stage ('vcs') {
        steps {
            git url :'https://github.com/nagendra4aa5/terraform.git'
            branch : 'main' 

            
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init') 
            }
        }
        }
    }
}