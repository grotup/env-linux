#
# env ELB
#
REPOENV="env-linux"
TOOLS="$HOME/TRAVAIL/tools"

echo
#screenfetch

if [ -f ~/$REPOENV/colors.sh ]; then
    . ~/$REPOENV/colors.sh
fi

if [ -f ~/$REPOENV/aliases.sh ]; then
    . ~/$REPOENV/aliases.sh
fi

if [ -f ~/$REPOENV/tools.sh ]; then
    . ~/$REPOENV/tools.sh
fi

if [ -f ~/$REPOENV/dockerfunc.sh ]; then
    . ~/$REPOENV/dockerfunc.sh
fi