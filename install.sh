#!/bin/bash
function display {
    echo -e "\033c"
    echo "
    ==========================================================================
$(tput setaf 5)██╗   ██╗███████╗██╗      ██████╗  ██████╗██╗████████╗██╗   ██╗███╗   ██╗ ██████╗ ██████╗ ███████╗
$(tput setaf 5)██║   ██║██╔════╝██║     ██╔═══██╗██╔════╝██║╚══██╔══╝╚██╗ ██╔╝████╗  ██║██╔═══██╗██╔══██╗██╔════╝
$(tput setaf 5)██║   ██║█████╗  ██║     ██║   ██║██║     ██║   ██║    ╚████╔╝ ██╔██╗ ██║██║   ██║██║  ██║█████╗
$(tput setaf 5)╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██║     ██║   ██║     ╚██╔╝  ██║╚██╗██║██║   ██║██║  ██║██╔══╝
$(tput setaf 5) ╚████╔╝ ███████╗███████╗╚██████╔╝╚██████╗██║   ██║      ██║   ██║ ╚████║╚██████╔╝██████╔╝███████╗
$(tput setaf 5)  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝  ╚═════╝╚═╝   ╚═╝      ╚═╝   ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝
    ==========================================================================
    "  
}
function forceStuffs {
    curl -O https://images.vistacloud.org/1/server-icon.png
    echo "motd=Powered by VelocityNode | Change this motd in server.properties" >> server.properties
}

function launchJavaServer {
    java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar server.jar
}

function optimizeJavaServer {
    echo "view-distance=6" >> server.properties
}

FILE=eula.txt

if [ ! -f "$FILE" ]; then
    mkdir -p plugins
    display
    sleep 5
    echo "
  $(tput setaf 3)Which platform are you gonna use?
  1) Paper              2)Vanilla

  "
    read -r n

    case $n in
        1) 
            display
            sleep 2
                echo "
 $(tput setaf 3)Which platform are you gonna use? (If you do not see the version you want listed. Please create a ticket and contact stxrlite to add it)
 1) Paper 1.8.8       6)  1.18.2 
 2) Paper 1.12.2      7)  1.19.2
 3) Paper 1.15.2
 4) Paper 1.16.5
 5) Paper 1.17.1 
                    "
                    read -r n
                    case $n in
                            1)
                                sleep 1
                                echo "$(tput setaf 3)Starting the download for 1.8.8 please wait"
                                sleep 4
                                forceStuffs
                                curl -O https://api.papermc.io/v2/projects/paper/versions/1.8.8/builds/445/downloads/paper-1.8.8-445.jar
                                display
                                mv paper-1.8.8-445.jar server.jar
                                echo "eula=true" >> eula.txt
                                echo "If you have not changed your Java Version to 8 Please do so"
                                sleep 10
                                optimizeJavaServer
                                launchJavaServer
                                ;;
                            2) 
                                sleep 1
                                echo "$(tput setaf 3)Starting the download for 1.12.2 please wait"
                                sleep 4
                                forceStuffs
                                curl -O https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
                                display
                                mv paper-1.12.2-1620.jar server.jar
                                echo "eula=true" >> eula.txt
                                echo "If you have not changed your Java Version to 11 Please do so"
                                sleep 10
                                optimizeJavaServer
                                launchJavaServer
                                ;;
                            *) 
                                echo "Invalid Choice"
                                exit
                                ;;
                            esac  
;;
        2) 
            display
            sleep 2
                echo "
 $(tput setaf 3)Which version you would like to use?
1) 1.21
2) 1.20.6
3) 1.19.2
                    "
                    read -r n
                    case $n in
                            1)
                                sleep 1
                                echo "$(tput setaf 3)Starting the download for 1.21 please wait"
                                sleep 4
                                forceStuffs
                                curl -O https://piston-data.mojang.com/v1/objects/450698d1863ab5180c25d7c804ef0fe6369dd1ba/server.jar
                                display
                                echo "eula=true" >> eula.txt
                                echo "If you have not changed your Java Version to 21 Please do so"
                                sleep 10
                                optimizeJavaServer
                                launchJavaServer
                                ;;
                            2) 
                                sleep 1
                                echo "$(tput setaf 3)Starting the download for 1.20.6 please wait"
                                sleep 4
                                forceStuffs
                                curl -O https://api.papermc.io/v2/projects/paper/versions/1.12.2/builds/1620/downloads/paper-1.12.2-1620.jar
                                display
                                mv paper-1.12.2-1620.jar server.jar
                                echo "eula=true" >> eula.txt
                                echo "If you have not changed your Java Version to 11 Please do so"
                                sleep 10
                                optimizeJavaServer
                                launchJavaServer
                                ;;
                            *) 
                                echo "Error 404"
                                exit
                                ;;
                            esac  
;;
        3) 
            sleep 1
            echo "$(tput setaf 3)Starting the download for 1.15.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.15.2/builds/393/downloads/paper-1.15.2-393.jar
            display
            echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
            sleep 10
            optimizeJavaServer
            launchJavaServer
            ;;
        4)
            sleep 1
            echo "$(tput setaf 3)Starting the download for 1.16.5 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.16.5/builds/794/downloads/paper-1.16.5-794.jar
            display
            echo "$(tput setaf 1)Invalid docker image. Change it to java 16"
            sleep 10
            optimizeJavaServer
            launchJavaServer
            ;;
        5) 
            sleep 1
            echo "$(tput setaf 3)Starting the download for 1.17.1 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.17.1/builds/411/downloads/paper-1.17.1-411.jar
            display
            sleep 10
            optimizeJavaServer
            launchJavaServer
            ;;
        6)
            sleep 1
            echo "$(tput setaf 3)Starting the download for 1.18.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.18.2/builds/388/downloads/paper-1.18.2-388.jar
            display
            sleep 10
            optimizeJavaServer
            launchJavaServer
            ;;
        7)
            sleep 1
            echo "$(tput setaf 3)Starting the download for 1.19.2 please wait"
            sleep 4
            forceStuffs
            curl -O https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/190/downloads/paper-1.19.2-190.jar
            display
            sleep 10
            optimizeJavaServer
            launchJavaServer
            ;;
        8)
            echo "$(tput setaf 3)Starting Download please wait"
            curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
            display 
            java -Xms512M -Xmx512M -jar BungeeCord.jar
            ;;
        *) 
            echo "Error 404"
            exit
            ;;
    esac  
else
    if [ ! -d plugins ]; then
        mkdir plugins
    fi
    if [ -f BungeeCord.jar ]; then
        display
        java -Xms512M -Xmx512M -jar BungeeCord.jar
    else
        display   
        launchJavaServer
    fi
fi
