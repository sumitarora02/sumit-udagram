ssh-keygen -t rsa -b 4096 -f ~/.ssh/udagramJumpboxKey -C "Udagram Jumpbox key" -P "Sumit" -N '' -q

aws ec2 import-key-pair --key-name "udagramJumpboxKey" --public-key-material fileb://~/.ssh/udagramJumpboxKey.pub
aws ssm put-parameter --name 'udagramJumpboxKeyPrivate' --value "$(cat ~/.ssh/udagramJumpboxKey)" --type SecureString --overwrite
aws ssm put-parameter --name 'udagramJumpboxKey' --value "$(cat ~/.ssh/udagramJumpboxKey.pub)" --type SecureString --overwrite