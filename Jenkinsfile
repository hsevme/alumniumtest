pipeline {
    agent {
        docker {
            image 'python:3.11-slim'
            args '-u root' // for installing dependencies
        }
    }

    environment {
        PYTHONPATH = '.'
        ALLURE_RESULTS_DIR = 'allure-results'
        ALLURE_REPORT_DIR = 'allure-report'
    }

    stages {
        stage('Install dependencies') {
            steps {
                sh '''
                    apt-get update && apt-get install -y wget curl unzip git ffmpeg
                    pip install --upgrade pip
                    pip install -r requirements.txt
                    playwright install --with-deps
                '''
            }
        }

        stage('Run Tests') {
            steps {
                sh '''
                    rm -rf ${ALLURE_RESULTS_DIR} ${ALLURE_REPORT_DIR}
                    behave -f allure_behave.formatter:AllureFormatter -o ${ALLURE_RESULTS_DIR} tests/
                '''
            }
        }

        stage('Generate Allure Report') {
            steps {
                sh '''
                    allure generate ${ALLURE_RESULTS_DIR} -o ${ALLURE_REPORT_DIR} --clean
                '''
            }
        }

        stage('Publish Allure Report') {
            steps {
                allure includeProperties: false, jdk: '', results: [[path: "${ALLURE_RESULTS_DIR}"]]
            }
        }
    }

    post {
        always {
            archiveArtifacts artifacts: 'artifacts/**/*', allowEmptyArchive: true
            junit testResults: '**/TESTS-*.xml', allowEmptyResults: true
        }
    }
}
