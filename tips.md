
# TIPS

###### System

```bash
!! # run the last command executed
sudo !! # run the last command as root
!<word> # run the last command starting with a specific word
!<word> # ^list, but don't run that last command
<space>command # execute a command without saving in history
echo "ls -l" | at midnight # execute command at given time
ls -lhS # sort files by size in a directory
```

###### [Bash cheat sheet](http://cli.learncodethehardway.org/bash_cheat_sheet.pdf)

###### STS 

Keyword : ctrl + maj + L

###### resty 
```bash
resty http://localhost:3101/gestion-depot-demandes/crpldeva -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwcm9qZXQtaiIsImlkIjoicHJvamV0LWoiLCJncm91cHMiOlsiR1MtUGRaLUVxdWlwZVByb2pldCJdLCJ1c2VyTmFtZSI6InByb2pldC1qIiwib3JnYW5pemF0aW9uIjoiY3JwbGRldmEiLCJpYXQiOjE0NDQ5MTY3MTIsImV4cCI6MTQ4MTIwOTIwNiwiaXNzIjoic2Vzc2lvbi1tYW5hZ2VtZW50LWJhY2sifQ.H8Uxd5PVQWMOe1C224Ai9Q4ohcCb0RCFpeVtb2vjI0I"
GET /teleservices | json_pp
POST /teleservices '{"libelle":"lib", "workflow":"work", "kind":"kind"}' | head -n +1 | json_pp
```
###### ln-s pour application
sudo ln -s /home/elb/Applications/VSCode-linux-x64/Code /usr/local/bin/code

###### log
```bash
# Fichiers de log
tail -f /var/log/syslog
tail -f /var/log/auth.log
```

###### sauvegarder sa liste de programme en cas de crash et de réinstallation de son système GNU/Linux
```bash
dpkg --get-selections > liste-programmes.txt
# Restauration:
sudo dpkg --set-selections < liste-programmes.txt
sudo apt-get dselect-upgrade
```

###### Lister fichiers ouverts
```bash
lsof # fichier ouvert 
fuser # fichier ouvert
```

###### redémarer serveur graphique
```bash
sudo restart lightdm
```

###### tips vi

```
:w !sudo tee %
```

###### Redémarrage dans 7 heures
```bash
sudo rtcwake -m disk -s 25200
```

###### failed2ban
```bash
sudo fail2ban-client reload
sudo fail2ban-client status
sudo fail2ban-client status ssh
# TODO Ajouter le script
sudo /home/erwan/developpement/scripts/shell/checklist_ban.sh
```
###### PM2 tools

```bash
# start
$ nohup pm2-gui start > /dev/null 2>&1 & echo $! > /tmp/pm2-gui.pid
# stop
$ kill -9 `cat /tmp/pm2-gui.pid`
```

###### Applications

* basique
  * [pm2](http://pm2.keymetrics.io/docs/usage/quick-start/#cheat-sheet) $ pm2 start <apps.js> --name my-api
  * [pm2-gui](https://www.npmjs.com/package/pm2-gui)
  * [at](http://home.gna.org/unix-initiation/website/node86.html)
  * resty
  * [tldr](http://tldr-pages.github.io/)
  * VSCode
  * failed2ban
  * banner
  * iron-node
  * xsel (pour xsel --clipboard : copie dans le presse papier)
  * toilet & figlet http://www.cyberciti.biz/faq/create-large-colorful-text-banner-on-screen/
  * [screen](http://www.it-connect.fr/attacher-et-detacher-un-terminal-avec-la-commande-screen/)


* dev
  * mocha
  * maildev
  * docker
  * sts
  * ungit
  * git
  * bower
  * npm
  * node (nvm)
  * jscs
  * netdata (github)