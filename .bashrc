
alias tree='\tree --dirsfirst -C'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
alias cputemp='sensors | grep Core'

#Git
alias pull = 'git pull origin master'
alias add = 'git add --all'
alias push = 'git push --all'
function commit() {
   add
   message=""
   for arg in "$@"
   do
      message += "$arg"
      message += " "
   done
   git commit -m "$message"
   push
}

# Show contents of dir after action
function cd () {
    builtin cd "$1"
    \tree --dirsfirst -C
}

# Create new directory, then move into that directory
function newdirectory () {
    mkdir -p $1
    cd $1
}

# Show some system information
function myinfo () {
  printf "CPU: "
  cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
  printf "\n"

  cat /etc/issue | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s | " , $1 }'
  kded4 --version | grep "KDE Development Platform" | awk '{ printf "KDE: %s", $4 }'
  printf "\n"
  uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
  printf "\n"
  cputemp | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
  cputemp | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
  #cputemp | awk '{ printf "%s %s", $1 $2 }'
}

# Will parse the output of the df command to only show disk space on /dev/sd* and /mnt/* mounted partitions
function ssd () {
  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | grep "/dev/sd"
  df -h | grep "/mnt/"
}

# Shows uptime using a shorter formula
function myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}



# Update/Upgrade/Autoremove alias
alias update='sudo apt-get update && echo "*------------------- Update Finished -------------------*" && sudo apt-get upgrade -y && echo "*------------------- Upgrade Finished -------------------*"'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

################################################################################
##  FUNCTIONS                                                                 ##
################################################################################

##
## ARRANGE $PWD AND STORE IT IN $NEW_PWD
## * The home directory (HOME) is replaced with a ~
## * The last pwdmaxlen characters of the PWD are displayed
## * Leading partial directory names are striped off
##  /home/me/stuff -> ~/stuff (if USER=me)
##  /usr/share/big_dir_name -> ../share/big_dir_name (if pwdmaxlen=20)
##
## Original source: WOLFMAN'S color bash promt
## https://wiki.chakralinux.org/index.php?title=Color_Bash_Prompt#Wolfman.27s
##
bash_prompt_command() {
 # How many characters of the $PWD should be kept
 local pwdmaxlen=25

 # Indicate that there has been dir truncation
 local trunc_symbol=".."

 # Store local dir
 local dir=${PWD##*/}

 # Which length to use
 pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))

 NEW_PWD=${PWD/#$HOME/\~}
 
 local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))

 # Generate name
 if [ ${pwdoffset} -gt "0" ]
 then
  NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
  NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
 fi
}




##
## GENERATE A FORMAT SEQUENCE
##
format_font()
{
 ## FIRST ARGUMENT TO RETURN FORMAT STRING
 local output=$1


 case $# in
 2)
  eval $output="'\[\033[0;${2}m\]'"
  ;;
 3)
  eval $output="'\[\033[0;${2};${3}m\]'"
  ;;
 4)
  eval $output="'\[\033[0;${2};${3};${4}m\]'"
  ;;
 *)
  eval $output="'\[\033[0m\]'"
  ;;
 esac
}



##
## COLORIZE BASH PROMT
##
bash_prompt() {

 ############################################################################
 ## COLOR CODES                                                            ##
 ## These can be used in the configuration below                           ##
 ############################################################################
 
 ## FONT EFFECT
 local      NONE='0'
 local      BOLD='1'
 local       DIM='2'
 local UNDERLINE='4'
 local     BLINK='5'
 local    INVERT='7'
 local    HIDDEN='8'
 
 
 ## COLORS
 local   DEFAULT='9'
 local     BLACK='0'
 local       RED='1'
 local     GREEN='2'
 local    YELLOW='3'
 local      BLUE='4'
 local   MAGENTA='5'
 local      CYAN='6'
 local    L_GRAY='7'
 local    D_GRAY='60'
 local     L_RED='61'
 local   L_GREEN='62'
 local  L_YELLOW='63'
 local    L_BLUE='64'
 local L_MAGENTA='65'
 local    L_CYAN='66'
 local     WHITE='67'
 
 
 ## TYPE
 local     RESET='0'
 local    EFFECT='0'
 local     COLOR='30'
 local        BG='40'
 
 
 ## 256 COLOR CODES
 local NO_FORMAT="\[\033[0m\]"
 local ORANGE_BOLD="\[\033[1;38;5;208m\]"
 local TOXIC_GREEN_BOLD="\[\033[1;38;5;118m\]"
 local RED_BOLD="\[\033[1;38;5;1m\]"
 local CYAN_BOLD="\[\033[1;38;5;87m\]"
 local BLACK_BOLD="\[\033[1;38;5;0m\]"
 local WHITE_BOLD="\[\033[1;38;5;15m\]"
 local GRAY_BOLD="\[\033[1;90m\]"
 local BLUE_BOLD="\[\033[1;38;5;74m\]"
 
 
 
 
 
 ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  
   ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##
 ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ## 

 
 
 ##                          CONFIGURE HERE                                ##

 
 
 ############################################################################
 ## CONFIGURATION                                                          ##
 ## Choose your color combination here                                     ##
 ############################################################################
 local FONT_COLOR_1=$WHITE
 local BACKGROUND_1=$BLUE
 local TEXTEFFECT_1=$BOLD
 
 local FONT_COLOR_2=$WHITE
 local BACKGROUND_2=$L_BLUE
 local TEXTEFFECT_2=$BOLD
 
 local FONT_COLOR_3=$D_GRAY
 local BACKGROUND_3=$WHITE
 local TEXTEFFECT_3=$BOLD
 
 local PROMT_FORMAT=$BLUE_BOLD

 
 ############################################################################
 ## EXAMPLE CONFIGURATIONS                                                 ##
 ## I use them for different hosts. Test them out ;)                       ##
 ############################################################################
 
 ## CONFIGURATION: BLUE-WHITE
 if [ "$HOSTNAME" = dell ]; then
  FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLUE; TEXTEFFECT_1=$BOLD
  FONT_COLOR_2=$WHITE; BACKGROUND_2=$L_BLUE; TEXTEFFECT_2=$BOLD 
  FONT_COLOR_3=$D_GRAY; BACKGROUND_3=$WHITE; TEXTEFFECT_3=$BOLD 
  PROMT_FORMAT=$CYAN_BOLD
 fi
 
 ## CONFIGURATION: BLACK-RED
 if [ "$HOSTNAME" = giraff6 ]; then
  FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD
  FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD
  FONT_COLOR_3=$WHITE; BACKGROUND_3=$RED; TEXTEFFECT_3=$BOLD
  PROMT_FORMAT=$RED_BOLD
 fi
 
 ## CONFIGURATION: RED-BLACK
 #FONT_COLOR_1=$WHITE; BACKGROUND_1=$RED; TEXTEFFECT_1=$BOLD
 #FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD
 #FONT_COLOR_3=$WHITE; BACKGROUND_3=$BLACK; TEXTEFFECT_3=$BOLD
 #PROMT_FORMAT=$RED_BOLD

 ## CONFIGURATION: CYAN-BLUE
 if [ "$HOSTNAME" = sharkoon ]; then
  FONT_COLOR_1=$BLACK; BACKGROUND_1=$L_CYAN; TEXTEFFECT_1=$BOLD
  FONT_COLOR_2=$WHITE; BACKGROUND_2=$L_BLUE; TEXTEFFECT_2=$BOLD
  FONT_COLOR_3=$WHITE; BACKGROUND_3=$BLUE; TEXTEFFECT_3=$BOLD
  PROMT_FORMAT=$CYAN_BOLD
 fi
 
## CONFIGURATION: GRAY-SCALE
 if [ "$HOSTNAME" = pop-os ]; then
  FONT_COLOR_1=$BLACK; BACKGROUND_1=$WHITE; TEXTEFFECT_1=$BOLD
  FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD
  FONT_COLOR_3=$BLACK; BACKGROUND_3=$L_CYAN; TEXTEFFECT_3=$BOLD
 PROMT_FORMAT=$WHITE_BOLD
 fi
 
 ## CONFIGURATION: GRAY-CYAN
 if [ "$HOSTNAME" = light ]; then
  FONT_COLOR_1=$WHITE; BACKGROUND_1=$BLACK; TEXTEFFECT_1=$BOLD
  FONT_COLOR_2=$WHITE; BACKGROUND_2=$D_GRAY; TEXTEFFECT_2=$BOLD
  FONT_COLOR_3=$BLACK; BACKGROUND_3=$L_CYAN; TEXTEFFECT_3=$BOLD
  PROMT_FORMAT=$CYAN_BOLD
 fi
 
 
 ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  
   ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##
 ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  ##  

 
 
 
 ############################################################################
 ## TEXT FORMATING                                                         ##
 ## Generate the text formating according to configuration                 ##
 ############################################################################
 
 ## CONVERT CODES: add offset
 FC1=$(($FONT_COLOR_1+$COLOR))
 BG1=$(($BACKGROUND_1+$BG))
 FE1=$(($TEXTEFFECT_1+$EFFECT))
 
 FC2=$(($FONT_COLOR_2+$COLOR))
 BG2=$(($BACKGROUND_2+$BG))
 FE2=$(($TEXTEFFECT_2+$EFFECT))
 
 FC3=$(($FONT_COLOR_3+$COLOR))
 BG3=$(($BACKGROUND_3+$BG))
 FE3=$(($TEXTEFFECT_3+$EFFECT))
 
 FC4=$(($FONT_COLOR_4+$COLOR))
 BG4=$(($BACKGROUND_4+$BG))
 FE4=$(($TEXTEFFECT_4+$EFFECT))
 

 ## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
 local TEXT_FORMAT_1
 local TEXT_FORMAT_2
 local TEXT_FORMAT_3
 local TEXT_FORMAT_4 
 format_font TEXT_FORMAT_1 $FE1 $FC1 $BG1
 format_font TEXT_FORMAT_2 $FE2 $FC2 $BG2
 format_font TEXT_FORMAT_3 $FC3 $FE3 $BG3
 format_font TEXT_FORMAT_4 $FC4 $FE4 $BG4
 
 
 # GENERATE PROMT SECTIONS
 local PROMT_USER=$"$TEXT_FORMAT_1 \u "
 local PROMT_HOST=$"$TEXT_FORMAT_2 \h "
 local PROMT_PWD=$"$TEXT_FORMAT_3 \${NEW_PWD} "
 local PROMT_INPUT=$"$PROMT_FORMAT "


 ############################################################################
 ## SEPARATOR FORMATING                                                    ##
 ## Generate the separators between sections                               ##
 ## Uses background colors of the sections                                 ##
 ############################################################################
 
 ## CONVERT CODES
 TSFC1=$(($BACKGROUND_1+$COLOR))
 TSBG1=$(($BACKGROUND_2+$BG))
 
 TSFC2=$(($BACKGROUND_2+$COLOR))
 TSBG2=$(($BACKGROUND_3+$BG))
 
 TSFC3=$(($BACKGROUND_3+$COLOR))
 TSBG3=$(($DEFAULT+$BG))
 

 ## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
 local SEPARATOR_FORMAT_1
 local SEPARATOR_FORMAT_2
 local SEPARATOR_FORMAT_3
 format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
 format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
 format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3
 

 # GENERATE SEPARATORS WITH FANCY TRIANGLE
 local TRIANGLE=$'\uE0B0' 
 local SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE
 local SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE
 local SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE



 ############################################################################
 ## WINDOW TITLE                                                           ##
 ## Prevent messed up terminal-window titles                               ##
 ############################################################################
 case $TERM in
 xterm*|rxvt*)
  local TITLEBAR='\[\033]0;\u:${NEW_PWD}\007\]'
  ;;
 *)
  local TITLEBAR=""
  ;;
 esac



 ############################################################################
 ## BASH PROMT                                                             ##
 ## Generate promt and remove format from the rest                         ##
 ############################################################################
 PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"

 

 ## For terminal line coloring, leaving the rest standard
 none="$(tput sgr0)"
 trap 'echo -ne "${none}"' DEBUG
}




################################################################################
##  MAIN                                                                      ##
################################################################################

## Bash provides an environment variable called PROMPT_COMMAND. 
## The contents of this variable are executed as a regular Bash command 
## just before Bash displays a prompt. 
## We want it to call our own command to truncate PWD and store it in NEW_PWD
PROMPT_COMMAND=bash_prompt_command

## Call bash_promnt only once, then unset it (not needed any more)
## It will set $PS1 with colors and relative to $NEW_PWD, 
## which gets updated by $PROMT_COMMAND on behalf of the terminal
bash_prompt
unset bash_prompt




# EOF
