#################################################################################
# For a full list of active aliases, run `alias`.
# Fun Aliases
alias weather="curl wttr.in/Orlando"		# Prints graphic for weather
alias hacker="cmatrix"		# Not an alias but looks cool

# Git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gb="git branch"
alias gl="git log --oneline"
alias gp="git push"
alias gsw="git switch"
alias gd="git diff head"

# Vim aliases
alias vim="nvim"
alias v="nvim ."
alias e="exit"
alias q="exit"

# Edit config aliases
alias editaliases="nvim ~/.config/zsh/aliases.zsh"
alias editnvim="nvim ~/.config/nvim"
alias reloadsh="source ~/.zshrc"

# Quick SSH Aliases
alias large="ssh root@137.184.138.139"
alias rlarge="ssh root@typecode.app 'bash /root/services/script.sh &'"
alias newton="echo 'passphrase = newton 863'; ssh cap5415.student25@newton.ist.ucf.edu" # passphrase = "newton 863"
alias cruise="ssh ubuntu@54.86.138.46"
alias personal="ssh root@104.131.176.242"
alias personaldb="ssh root@104.131.179.3"

# Temporary Aliases
alias cc-restart="cd ~/Downloads/Web/cruise-connect/frontend && npm run build && cd ../ && rm -rf backend/frontendDist &&  mkdir backend/frontendDist && cp -r frontend/dist/* backend/frontendDist && cd backend && tsc && node dist/index.js"
alias tom-restart="/opt/homebrew/Cellar/tomcat/11.0.6/libexec/bin/shutdown.sh && \
                    rm -r /opt/homebrew/Cellar/tomcat/11.0.6/libexec/webapps/Project-4/* && \
                    cp -r ~/Downloads/CNT4714/proj4/proj4/* /opt/homebrew/Cellar/tomcat/11.0.6/libexec/webapps/Project-4/ && \
                    cd ~/Downloads/CNT4714/proj4/src/proj4/ && \
                    mvn compile && \
                    cd - && \
                    cp -r ~/Downloads/CNT4714/proj4/src/proj4/target/classes /opt/homebrew/Cellar/tomcat/11.0.6/libexec/webapps/Project-4/WEB-INF && \
                    /opt/homebrew/Cellar/tomcat/11.0.6/libexec/bin/startup.sh"
