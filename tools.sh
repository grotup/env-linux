
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

#use TODO A revoir iban.to.clipboard
iban.to.clipboard () {
    IBAN=$(sort -R $HOME/TRAVAIL/Technique/Bureau/0.\ IBAN_BIC_exemples.txt | head -n 1)
    presse-papier "$IBAN"
    unset IBAN
}

#use TODO A revoir siret.to.clipboard
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

echo "${Green}tools.sh load!${Color_Off}"