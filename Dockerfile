# docker build -t ec2-deploy -f Dockerfile ~/projects/deploy/ec2-deploy
FROM        ec2-deploy.base

COPY        . /srv/project