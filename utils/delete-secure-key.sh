aws ec2 delete-key-pair --key-name "udagramJumpboxKey"
aws ssm delete-parameter --name 'udagramJumpboxKey'
aws ssm delete-parameter --name 'udagramJumpboxKeyPrivate'
rm ~/.ssh/udagramJumpboxKey*