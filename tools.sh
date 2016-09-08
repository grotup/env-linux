
#use extract
extract () {
    if [ -f $1 ]
    then
        case $1 in
            (*.7z) 7z x $1 ;;
            (*.lzma) unlzma $1 ;;
            (*.rar) unrar x $1 ;;
            (*.tar) tar xvf $1 ;;
            (*.tar.bz2) tar xvjf $1 ;;
            (*.bz2) bunzip2 $1 ;;
            (*.tar.gz) tar xvzf $1 ;;
            (*.gz) gunzip $1 ;;
            (*.tar.xz) tar Jxvf $1 ;;
            (*.xz) xz -d $1 ;;
            (*.tbz2) tar xvjf $1 ;;
            (*.tgz) tar xvzf $1 ;;
            (*.zip) unzip $1 ;;
            (*.Z) uncompress ;;
            (*) echo "${Red}${Cara_failed} Don't know how to extract '$1'...${Color_Off}" ;;
        esac
    else
        echo "${Red}${Cara_failed} Error: '$1' is not a valid file!${Color_Off}"
    fi
}

#use bearer.back <tenantId>
bearer.back () {

    . $HOME/Applications/resty

    if [ $# -eq 1 ]
    then
        # Recuperation variable
        export TENANT=$1

        echo "Mot de passe : "
        read MDPBEARER

        # Init route resty
        resty http://$TENANT-back.commeunservice.com/session-management -d 'username=projet-j&password='$MDPBEARER
        if [ $? -eq 0 ]
        then
            # Get bearer
            RESULT=$(POST /tokens)

            if [ $? -eq 0 ]
            then
                echo
                BEARER=$RESULT
                echo "${Green}Bearer ${Cara_check}${Color_Off}"
                echo
                echo "${Green}$BEARER${Color_Off}"
            else
                echo "${Cara_failed} ERROR :"
                echo "$RESULT"
            fi
        fi
    else
        echo "${Cara_failed} ERROR \t:\tbad parameters !"
        echo "USAGE \t:\t$0 <teant>"
        echo "EXEMPLE :\t$0 crpldeva"
    fi
    unset TENANT
    unset MDPBEARER
    unset RESULT
}

#use request.rebuild.index <crpldeva>
request.rebuild.index () {
    . $HOME/Applications/resty

    if [ $# -eq 1 ]
    then
        # Recuperation variables
        export TENANT=$1

        if [[ "$BEARER" == "" ]]
        then
            echo "${Cara_failed} ERROR : Veuillez initialiser un BEARER !"
            echo "\tbearer.back <tenant>"
        else

            # Init route resty
            resty http://$TENANT-back.commeunservice.com/referentiel-dossiers-financement/$TENANT -H "Authorization: Bearer $BEARER"
            if [ $? -eq 0 ]
            then
                # Rebuild index request
                RESULTREBUILD=$(POST /initialize/request 2>&1)
                RETOURREBUILD=$?
                if [ $RETOURREBUILD -eq 0 ]
                then
                    echo
                    echo "${Green}SUCCESS :)${Color_Off}"
                else
                    echo "${Cara_failed} ERROR :"
                    echo "$RESULTREBUILD"
                fi
            fi
        fi
    else
        echo "${Cara_failed} ERROR \t:\tbad parameters !"
        echo "\tUSAGE \t:\t$0 <teant>"
        echo "\tEXEMPLE :\t$0 crpldeva"
    fi
    unset TENANT
    unset RESULTREBUILD
    unset RETOURREBUILD
}

#use node_modules.reload
node_modules.reload () {
    if [ -d node_modules ]
    then
        echo "${Yellow}rm -Rf node_modules${Color_Off}"
        rm -Rf node_modules
        echo "${Yellow}npm install${Color_Off}"
        npm install

    else
        echo "${IRed}Le répertoire node_modules n'a pas été trouvé !${Color_Off}"
    fi
}

#use bower_components.reload
bower_components.reload () {
    if [ -d bower_components ]
    then
        echo "${Yellow}rm -Rf bower_components${Color_Off}"
        rm -Rf bower_components
        echo "${Yellow}bower install${Color_Off}"
        bower install

    else
        echo "${IRed}Le répertoire bower_components n'a pas été trouvé !${Color_Off}"
    fi
}

#use node_modules.bower_components.reload
node_modules.bower_components.reload () {
    node_modules.reload && bower_components.reload
}

#use reload.env
reload.env () {
    PATHWORK="$HOME/env-linux"
    PWDSAVE=$(echo $PWD)
    cd $PATHWORK
    GITPULL=$(git pull)
    if [ $? -ne 0 ]
    then
        echo $GITPULL
        echo "${IRed}git pull env-linux failed !${Color_Off}"
        git st
    fi
    . $PATHWORK/load.sh
    cd $PWDSAVE
    unset GITPULL
    unset PWDSAVE
    unset PATHWORK
}

#use load.resty
load.resty () {
    cd $HOME/Applications
    . ./resty
    cd $OLDPWD
}

#use installer
installer () {
    PATHINSTALLER="$HOME/sources/Repository/intranet/installer"
    PATHINSTALLERTEMP="/tmp/installer2/127.0.0.1"
    cd $PATHINSTALLER
    git.pull --verbose
    if [ -d $PATHINSTALLERTEMP ]
    then
        echo "${Yellow}rm -Rf $PATHINSTALLERTEMP${Color_Off}"
        # En dur pour éviter les erreurs de path...
        rm -Rf "/tmp/installer2/127.0.0.1"
    fi
    node app.js
    unset PATHINSTALLER
    unset PATHINSTALLERTEMP
}

#use gulp
gulp () {
    if [ -e node_modules/gulp/bin/gulp.js ]
    then
        echo "${Yellow}gulp local ➔ node_modules/gulp/bin/gulp.js $*${Color_Off}"
        node_modules/gulp/bin/gulp.js $*
    else
        echo "${Purple}gulp global ➔ /usr/local/bin/gulp $*${Color_Off}"
        /usr/local/bin/gulp $*
    fi
}

#use git.pull [--noverbose --verbose]
git.pull () {
    if [ \( $# -eq 1 -a "$1" = "--verbose" \) ]
    then
        echo "${Yellow}git pull${Color_Off}"
    fi
    GITPULL=$(git pull)
    RETOUR=$(echo $?)
    if [ $RETOUR -eq 0 ]
    then
        if [ ! \( $# -eq 1 -a "$1" = "--noverbose" \) ]
        then
            if [ \( $# -eq 1 -a "$1" = "--verbose" \) ]
            then
                echo $GITPULL
            fi
            echo "${IGreen}git pull ${Cara_check}${Color_Off}"
        fi
    else
        echo $GITPULL
        echo "\t${IRed}git pull ${Cara_failed}${Color_Off}"
        if [ $RETOUR -eq 1 ]
        then
            echo "\t${Yellow}git status${Color_Off}"
            echo
            git status
        fi
        echo
        echo "${IBlue}Appuyer sur Entrée pour continuer...${Color_Off}"
        read nothing
    fi
    unset GITPULL
    unset RETOUR
}

cd.repository.param () {
if [ $# -eq 1 ]
    then
        cd.repository && cd $1 && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    else
        echo "${IRed}${Cara_failed} ERROR : fonction cd.repository.param :bad parameters !${Color_Off}"

    fi
}

#use git.pull.repo.param <nom du repo (ex: nodejs, angular, ...)>
git.pull.repo.param () {
    SAVEOLDPWD=$PWD
    if [ $# -eq 1 ]
    then
        cd.repository && cd $1 && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
        git.pull.repo
        cd $SAVEOLDPWD && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    else 
        echo "${IRed}${Cara_failed} ERROR : fonction git.pull.repo.param :bad parameters !${Color_Off}"
    fi    
    unset SAVEOLDPWD
}

#use pdda.pull.start
pdda.pull.start () {
    cd.angular && cd portail-depot-demande-aides && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    git.pull
    gulp
}

#use crpl.pdai.pull.start
crpl.pdai.pull.start () {
    cd.personnalisation-client && cd crpl-portaildemandeaide-integration && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    git.pull
    gulp server
}

#use pdda.pull.start
paa.pull.start () {
    cd.angular && cd portail-agent-aides && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    git.pull
    gulp server-build
}

#use dfux.pull.start
dfux.pull.start () {
    cd.angular && cd dossiers-financement-ux && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    git.pull
    gulp serverDist
}

#use crpl.paai.pull.start
crpl.paai.pull.start () {
    cd.personnalisation-client && cd crpl-portailagentaide-integration && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    git.pull
    gulp
}

#use git.pull.repo
git.pull.repo () {
    for dir in $(find . -maxdepth 1 -mindepth 1 -type d | cut -c3-)
    do
        echo "${BBlue}${Cara_puce} $dir${Color_Off}"
        if [[ "$dir" == *branches || "$dir" == *temp || "$dir" == *\.old ]]
        then
            echo "${BYellow}\t${Cara_trans}${BWhite} $dir exclude${Color_Off}"
        else
            cd $dir
            if [ -d ".git" ]
            then
                git.pull
            else
                echo "${IRed}\t${Cara_failed}${BPurple} '$dir' n'est pas un répo git${Color_Off}"
            fi
            cd $OLDPWD
        fi
    done
}

#use git.pull.all
git.pull.all () {
    PATHREPO="$HOME/sources/Repository"
    SAVEOLDPWD=$PWD
    cd $PATHREPO

    for dir in $(find . -maxdepth 1 -mindepth 1 -type d | cut -c3-)
    do
        echo ""
        echo "${BBlue}${Cara_slash}$dir${Color_Off}"
        if [[ "$dir" == *branches || "$dir" == *temp ]]
        then
            echo "${BYellow}\t${Cara_trans}${BWhite} $dir exclude${Color_Off}"
        else
            cd $PATHREPO/$dir
            git.pull.repo
        fi
    done
    cd $SAVEOLDPWD
}

#use presse-papier <chaîne à copier>
presse-papier () {
    if [ $# -eq 1 ]
    then
        echo -n "$1" | xsel --clipboard
        echo "${IGreen}Copied to clipboard ${Cara_check}${Color_Off}"
        echo "${IYellow}$(xsel --clipboard)${Color_Off}"
    else
        echo "${Cara_failed} ERROR \t:\tbad parameters !"
        echo "USAGE \t:\t$0 \"<string>\""
        echo "EXEMPLE :\t$0 \"My string to clipboard\""
    fi
}

#use iban.to.clipboard
iban.to.clipboard () {
    IBAN=$(sort -R $HOME/TRAVAIL/Technique/Bureau/0.\ IBAN_BIC_exemples.txt | head -n 1)
    presse-papier "$IBAN"
    unset IBAN
}

#use siret.to.clipboard
siret.to.clipboard () {
    SIRET=$(sort -R $HOME/TRAVAIL/Technique/Bureau/0.\ siret.txt| head -n 1)
    presse-papier "$SIRET"
    unset SIRET
}


 fonctiontest () {

    if [ $# -eq 1 ]
    then
        echo "cd.repository && cd $1"
        cd.repository && cd $1 && echo "${IGreen}cd $PWD ${Cara_check}${Color_Off}"
    else
        echo "${IRed}${Cara_failed} ERROR \t:\tbad parameters !${Color_Off}"    
    fi
#     echo "$@"
#     echo "$1"
#     echo "$#"

#     RESULT=$(ls -l)
#     RETOUR=$?
#     echo "RESULT = $RESULT"
#     echo "RETOUR = $RETOUR"
 }

#use tools
tools () {
    PATHTOOLS="$HOME/$REPOENV/tools.sh"
    HELPTOOLS=$(grep ^#use $PATHTOOLS | cut -c6-)
    echo ${IYellow}$HELPTOOLS${Color_Off}
    unset PATHTOOLS
    unset HELPTOOLS
}

# Chargement de resty
load.resty

#JIRA
JIRA_URL="http://jira.mgdis.fr/"
JIRA_NAME="LEBIDEAU-E@mgdis.fr"
JIRA_PREFIX="CRPLPDA-"
JIRA_RAPID_BOARD=true

echo "${Green}tools.sh load!${Color_Off}"