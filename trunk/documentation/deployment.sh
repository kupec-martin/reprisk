#/bin/bash

#INITDIR=${1:-"/tmp"}
#cd $INITDIR
cd /tmp
#if [ -d "genesis_load" ]; then
#    echo "The directory already exits. Deleting."
#    rm -r genesis_load
#fi

# Pull of Genesis and xenesis files, Babak's dropbox ####    
mkdir genesis_load
cd genesis_load
sudo wget -O deployment.tar.gz https://www.dropbox.com/s/quro6x6sa2aptbe/deployment.tar.gz?dl=0
tar -xzf deployment.tar.gz
tar -xzf deployment/genesis_trunk.sql.tar.gz
tar -xzf deployment/xenesis.tar.gz
mkdir ~/projects
cp -r genesis_trunk.sql xenesis/ ~/projects/

# Deployment of Genesis contains and instalation
sudo docker run -d --name genesis -p 5432:5432 chriskalmar/pg-plv8-compiled:latest
sudo apt-get install postgresql-client
dropdb -h 127.0.0.1 -p 5432 -U postgres genesis
createdb -h 127.0.0.1 -p 5432 -U postgres genesis
createuser -h 127.0.0.1 -p 5432 -U postgres genesis
createuser -h 127.0.0.1 -p 5432 -U postgres _postgres
psql -h 127.0.0.1 -p 5432 -f genesis_trunk.sql -U postgres genesis

# Pull of project folder generator/template
wget -O init.tar.gz https://www.dropbox.com/s/ru8jd951e0hc7mi/init.tar.gz?dl=0
tar -xzf init.tar.gz
bash init.sh HotBooS . ~/projects/
cd ~/projects/

PROJECTS=~/projects

#Pull of anubis underlying files, christian repository
cd $PROJECTS &&
mkdir anubis-files &&
chown -R 1000 anubis-files &&
mkdir anubis-log &&
chown -R 1000 anubis-log &&
git clone https://deployment:deployment@git.ninelemon.com/chris/anubis.git &&
cd $PROJECTS/anubis &&
git checkout -b develop --track origin/develop &&
chown -R 1000 . &&
# cp config.template.js config.js


cd $PROJECTS

# Pull of redis and anubis
sudo docker run -d --name redis -p 6379:6379 chriskalmar/redis:latest

sudo docker run -d -p 3000:3000 --name anubis_tmp -v $PROJECTS/anubis:/app -v $PROJECTS/anubis-files:/files -v $PROJECTS/anubis-log:/log chriskalmar/node-compiled:latest npm install
# !!!!!   copy your development key ##################
curl -sSL https://glm.genesis.wf/scripts/genesis-activation.sh | bash -s genesis postgres 127.0.0.1   

# !!!!!   prepare init file ################
sudo docker run -d -p 3000:3000 --name anubis -v $PROJECTS/anubis:/app -v $PROJECTS/anubis-files:/files -v $PROJECTS/anubis-log:/log chriskalmar/node-compiled:latest grunt

# sudo docker run -it -p 3000:3000 --name anubis -v $PROJECTS/anubis:/app -v $PROJECTS/anubis-files:/files -v $PROJECTS/anubis-log:/log chriskalmar/node-compiled:latest bash

# curl -sSL https://glm.genesis.wf/scripts/genesis-activation.sh | bash -s hotboos postgres localhost

#init file
echo 'module.exports = {
  minJS: false,
  compress: false,

  connectionString: 'postgres://postgres@172.17.0.1:5432/genesis',

  serverPort: 3000,
  logSql : false,

  sessionStore: {
    host: '172.17.0.1',
    port: 6379
  },
  sessionTTL: 30 * 60, // 30 minutes session timeout

  cacheStore: {
    host: '172.17.0.1',
    port: 6379,
    prefix: ''
  },


  pluginConfig: {
    hideRawReporting: true
  },


  logger: [
    {
      level: 'debug',           // levels: fatal, error, info, debug
      type: 'rotating-file',
      path: '/tmp/anubis.log',
      period: '1d',             // daily rotation
      count: 3                  // keep 3 back copies
    }
  ]
}'



#sudo docker rm anubis_tmp
#sudo docker run  --name api -v $PROJECTS/anubis:/app -v $PROJECTS/anubis-files:/files -v $PROJECTS/anubis-log:/log -p 3000:3000 chriskalmar/node-compiled:latest grunt
