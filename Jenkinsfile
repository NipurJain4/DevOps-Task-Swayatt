@Library("sharedlib") _ 
pipeline {
    agent any
    environment {
    AWS_REGION = 'ap-south-1'
    AWS_ACCOUNT_ID = '905302884938'
    ECR_REPO_NAME = 'sawattaya'
    ECR_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}"
    EC2_HOST = "ec2-3-111-245-91.ap-south-1.compute.amazonaws.com"
    EC2_USER = "ubuntu"
}
     stages{
        stage('Docker Build') {
            steps {
                script{
                    build("sawattaya")
                }
            }
        }
        stage('Tag image') {
            steps {
                script{
                    tag_image("sawattaya", ECR_URI)
                }   
            }
        }
        stage('Login to ecr') {
            steps {
                script{
                    ecr_login(AWS_REGION, AWS_ACCOUNT_ID)
                }    
            }
        }

        stage('push image to ecr') {
            steps {
               script{
                push_image(ECR_URI)
               }
            }
        }
    }
    stage('Update Helm Chart') {
            steps {
                script {
                    helm_deploy(
                        helmRepoUrl: 'https://github.com/NipurJain4/DevOps-Task-Swayatt-helm_chart.git'
                    )
                }
            }
        }
    post {
        success {
            echo "✅ Image is pushed to ECR Successfully"
        }
        failure {
            echo "❌ Image is pushed to ECR failed!."
        }
    }
}

