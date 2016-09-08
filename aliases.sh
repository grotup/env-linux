# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# docker
alias docker.ps='docker ps -a'
alias docker.images='docker images'
#alias docker-compose='sudo docker-compose'
# docker app
alias docker.dockerui.start='docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui'
alias docker.atom.start='cd $HOME && docker run -d -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/shm:/dev/shm -v ${PWD}/.atom:/.atom -e DISPLAY=${DISPLAY} jamesnetherton/docker-atom-editor && cd $OLDPWD'

# Applications
alias opencmis='/home/elb/Applications/opencmis/workbench.sh &'
alias eclipse='eclipse 2>/dev/null &'
alias sts='sts 2>/dev/null &'
alias VSCode='code 2>/dev/null &'
alias ungit='ungit 2>/dev/null  &'

# some more ls aliases
alias la='ls -lha'
alias ll='ls -alrth'
alias lt='ls -lrth'
alias p="pwd"
alias l='ls -lh'
alias dir='ls -ahl | grep ^d'
alias cd..='cd ..'
alias cd....='cd ../..'
alias cd.env-linux='cd ~/$REPOENV'
# bashrc
alias subl.bashrc='subl ~/.bashrc'
alias subl.zshrc='subl ~/.zshrc'
alias subl.gitconfig='subl ~/.gitconfig'

# Autres
alias h.50='history 50'
alias ps.grep='ps aux | grep -v grep | grep '

# search
alias du.here='du -hsc'
alias search.backup='sudo find -regex "^.*~$"'
alias search.backup.and.delete='sudo find -regex "^.*~$" -exec sudo rm -i {} \;'

#kill
alias chrome.kill='kill -SIGSTOP $(pidof chrome)'

alias explorer='nautilus'

# Système (de server-pc)
#alias temp='sudo hddtemp /dev/sda* ; echo "————————–" ; sensors'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# system
alias system.version='cat /etc/lsb-release'
alias system.list.service='service --status-all'
alias system.list.program='dpkg -l'
alias system.ip.public='curl ifconfig.me'
alias system.ip.local='ifconfig eth0 | grep "inet adr:" | cut -d: -f2 | awk "{ print $1}"'
alias system.ps.cpu.max='ps -eo pmem,pcpu,pid,args | tail -n +2 | sort -rnk 2 | head'
alias system.maj='sudo apt-get -y update ; sudo apt-get -y upgrade ; sudo apt-get -y dist-upgrade'
alias system.list.partitions='sudo fdisk -l ; echo "————————–" ; sudo parted -l ; echo "————————–" ; df -aTh ; echo "————————–" ; free -m ; echo "————————–" ; ls -l /dev/disk/by-label/'
alias system.heure='watch -n1 "banner \$(date +"%H:%M:%S")"'
alias system.encodage.terminal='echo $LC_CTYPE'
# alias system.reload.env.elb='. ~/env-linux/load.sh' ==> fonction bash tools.sh
alias system.reload.shell='exec $SHELL -l'

# reboot / halt / poweroff
alias power.reboot='sudo /sbin/reboot'
alias power.poweroff='sudo /sbin/poweroff'
alias power.halt='sudo /sbin/halt'
alias power.shutdown='sudo /sbin/shutdown'

# tips, tools...
#alias tips='cat ~/$REPOENV/tips.txt'
alias tips='gnome-open "http://gitlab.mgdis.fr/lebideau-e/env-linux/blob/master/tips.md" 2>/dev/null &'
alias git.cheat='gnome-open "https://training.github.com/kit/downloads/fr/github-git-cheat-sheet.pdf" 2>/dev/null &'
alias todo='. ~/$REPOENV/TODO.sh'
alias bash.cheat='gnome-open $TOOLS/bash_cheat_sheet.pdf 2>/dev/null &'
alias alias.list='cat $HOME/$REPOENV/aliases.sh | grep -i "^alias" | cut -c7- | cut -d"=" -f1'
alias meteo='curl wttr.in/Auray'
alias tools.count.file='find */ | cut -d/ -f1 | uniq -c | sort -rn'

alias color.cara="grep ^Cara $HOME/$REPOENV/colors.sh"

# mountss
#alias mount.music='sudo mount -t cifs //172.16.10.92/Musique/ /media/lebideau-e/Musique -o uid=lebideau-e,gid=lebideau-e,username=lebideau-e,password=Mgdis19,domain=OCEANIE'
#alias mount.travail='sudo mount -t cifs //172.16.10.92/TRAVAIL/ /media/lebideau-e/Travail -o uid=lebideau-e,gid=lebideau-e,username=lebideau-e,password=Mgdis19,domain=OCEANIE'
#alias mount.tomcat7='sudo mount -t cifs //172.16.10.92/tomcat7/ /media/lebideau-e/Tomcat7 -o uid=lebideau-e,gid=lebideau-e,username=lebideau-e,password=Mgdis19,domain=OCEANIE'
#alias mount.lebideau-e='mount.music && mount.travail && mount.tomcat7'
#alias umount.music='sudo umount /media/lebideau-e/Musique'
#alias umount.travail='sudo umount /media/lebideau-e/Travail'
#alias umount.tomcat7='sudo umount /media/lebideau-e/Tomcat7'
#alias umount.lebideau-e='umount.music && umount.travail && umount.tomcat7'

####################### DEVELOPPEMENT #######################

# netdata
alias netdata='sudo /usr/sbin/netdata -p 2020 && gnome-open "http://127.0.0.1:2020/" 2>/dev/null &'
alias netdata.kill='sudo pkill netdata'

# change directories
alias cd.repository='cd $HOME/sources/Repository'

alias cd.nodejs='cd.repository && cd nodejs'
alias cd.intranet='cd.repository && cd intranet'
alias cd.contract='cd.repository && cd contract'
alias cd.ansible='cd.repository && cd ansible'
alias cd.java='cd.repository && cd java'
alias cd.seed='cd.repository && cd seed'
alias cd.angular='cd.repository && cd angular'
alias cd.personnalisation-client='cd.repository && cd personnalisation-client'
alias cd.referentielpresentation='cd.nodejs && cd referentiel-presentation'

# npm
alias npm.install.update='npm install && npm update'
alias bower.install.update='bower install && bower update'
alias npm.bower.install.update='npm.install.update && bower.install.update'

# MAJ projets
alias dossiers-financement-ux.maj='cd.angular && cd dossiers-financement-ux && git pull && '


# gulp
#alias gulp4='node_modules/gulp/bin/gulp.js'
alias gulp.tasks.simple='gulp --tasks-simple'

#ssh
alias sshcopy='ssh-copy-id -i ~/.ssh/id_rsa.pub'
# X for X11
alias ssh.server-pc='ssh erwan@78.221.72.68 -p 2483 -X'
# crpldeva
alias ssh.crpldeva.front.exposervice='ssh root@92.222.20.203 -p 22'
alias ssh.crpldeva.front.serveurannexe='ssh root@37.59.123.1 -p 22'
alias ssh.crpldeva.back.exposervice='ssh root@37.59.123.15 -p 22'
alias ssh.crpldeva.back.serveurannexe='ssh root@37.187.238.194 -p 22'
# crpldevb
alias ssh.crpldevb.front.exposervice='ssh root@5.196.17.7 -p 22'
alias ssh.crpldevb.front.serveurannexe='ssh root@151.80.141.32 -p 22'
alias ssh.crpldevb.back.exposervice='ssh root@92.222.38.121 -p 22'
alias ssh.crpldevb.back.serveurannexe='ssh root@92.222.47.210 -p 22'
# crpltest
alias ssh.crpltest.front.exposervice='ssh root@92.222.2.44 -p 22'
alias ssh.crpltest.front.serveurannexe='ssh root@92.222.2.54 -p 22'
alias ssh.crpltest.back.exposervice='ssh root@37.59.123.10 -p 22'
alias ssh.crpltest.back.serveurannexe='ssh root@37.59.123.21 -p 22'
# crpldevn
alias ssh.crpldevn.front.exposervice='ssh root@151.80.141.63 -p 22'
alias ssh.crpldevn.front.serveurannexe='ssh root@151.80.141.62 -p 22'
alias ssh.crpldevn.back.exposervice='ssh root@151.80.141.54 -p 22'
alias ssh.crpldevn.back.serveurannexe='ssh root@151.80.141.55 -p 22'

# mongo
alias mongo.start='sudo service mongodb start'
alias mongo.stop='sudo service mongodb stop'
alias mongo.restart='sudo service mongodb restart'
alias mongo.log='cat /var/log/mongodb/mongodb.log'

# git
alias git.count='git shortlog -sn'
alias git.alias='git config --get-regexp alias'
alias git.clone.develop='git clone --branch develop'
alias git.conventions='cat ~/$REPOENV/git-conventions.txt'
alias git.conventions.browser='gnome-open "http://gitlab.mgdis.fr/qa/git-conventions#type" 2>/dev/null &'
alias git.pull.push='git pull && git push'
alias git.info='git remote show origin'
alias git.url.origin='git config --get remote.origin.url'

# cd.repository && ls -l | grep -E  ^d | awk -F' ' '{print "alias git.pull." $9 "=\x27git.pull.repo.param " $9 "\x27" }'
# cd.repository && ls -1d */ | cut -d'/' -f1
alias git.pull.angular='git.pull.repo.param angular'
alias git.pull.ansible='git.pull.repo.param ansible'
alias git.pull.contract='git.pull.repo.param contract'
alias git.pull.dotnet='git.pull.repo.param dotnet'
alias git.pull.externe='git.pull.repo.param externe'
alias git.pull.intranet='git.pull.repo.param intranet'
alias git.pull.java='git.pull.repo.param java'
alias git.pull.nodejs='git.pull.repo.param nodejs'
alias git.pull.personnalisation-client='git.pull.repo.param personnalisation-client'
alias git.pull.seed='git.pull.repo.param seed'
alias git.pull.temp='git.pull.repo.param temp'
alias git.pull.web-session='git.pull.repo.param web-session'

### tomcat7 ###
# service
alias tomcat7.status='sudo service tomcat7 status'
alias tomcat7.start='sudo service tomcat7 start'
alias tomcat7.stop='sudo service tomcat7 stop'
alias tomcat7.restart='sudo service tomcat7 restart'
alias tomcat7.cd.log='cd /var/log/tomcat7'
alias tomcat7.cd.webapps='cd ~/TRAVAIL/webapps'

# JIRA
alias jira.assigned='jira assigned'
alias jira.dashboard='jira dashboard'

echo "${Green}aliases.sh load!${Color_off}"
