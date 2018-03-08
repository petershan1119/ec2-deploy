# docker build -t ec2-deploy -f Dockerfile ~/projects/deploy/ec2-deploy
FROM        ec2-deploy.base

COPY        . /srv/project

RUN         cp -f /srv/project/.config/nginx.conf /etc/nginx/nginx.conf
RUN         cp -f /srv/project/.config/nginx-app.conf /etc/nginx/sites-available/
RUN         rm -f /etc/nginx/sites-enabled/*
RUN         ln -sf /etc/nginx/sites-available/nginx-app.conf /etc/nginx/sites-enabled/

RUN         cp /srv/project/.config/supervisord.conf /etc/supervisor/conf.d/

CMD         pkkill nginx; supervisord -n