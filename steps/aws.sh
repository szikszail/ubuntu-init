# AWS-CLI Download
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

# AWS-CLI Install
sudo ./aws/install

# AWS-CLI Clean
rm -fr ./aws
rm -f awscliv2.zip

# AWS-CLI Check
aws --version

# AWS-SAM CLI Download
curl -GL "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "awssamcli.zip"
sha256sum awssamcli.zip
unzip awssamcli.zip -d awssamcli

# AWS-SAM CLI Install
sudo ./awssamcli/install

# AWS-SAM CLI Clean
rm -fr ./awssamcli
rm -f ./awssamcli.zip

# AWS-SAM CLI Check
sam --version