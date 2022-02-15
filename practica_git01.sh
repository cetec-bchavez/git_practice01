#!/bin/bash

opcion=0
linea=""

https_url = "https://github.com/cetec-bchavez/git_practice01.git"
#file_ignore = "secret.txt"

get_menu_opciones() {
    clear
    echo
    echo -e "\t\t\tPRACTICA GIT 01-REMOTO\n"
    
	echo -e "\t1. Configuracion (usuario,mail)"
    echo -e "\t2. Clonar (git clone)"
    echo -e "\t3. Archivos Ignore (touch .gitignore)"
    echo -e "\t4. Add Archivos to Local Staged (git add -A)"
    echo -e "\t5. Eliminar Cache Archivos Ignore (git rm --cached .gitignore)"
    echo -e "\t6. Commit Cambios Archivos to Local (git commit -m)"
    echo -e "\t7. Upload Archivos to Internet (git push origin main)"
    echo -e "\t8. Download Archivos from Internet (git push origin main)"

    echo -e "\n\tINFO"
    echo -e "\t\t11. Git Version (git --version)"

    echo -e "\n\tAYUDA"
    echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion
}

set_configuracion() {
	clear	
    echo -e "-----------1. Configuracion (usuario,mail)-------------"
    echo
    
    git config --global user.name "bydan105"
    git config --global user.email "bydan@hotmail.com"
    git config --list
    
    ##for g1 in $(groups); do
	#	echo -e "-> $g1"
	#done
}  

get_clone_repository() {
	clear	
    echo -e "-----------2. Clonar (git clone)-------------"
    echo
    
    git clone $https_url    
    ls -alh
}

set_archivos_ignore_config() {
	clear	
    echo -e "-----------3. Archivo Ignore con Ejemplo (touch .gitignore)-------------"
    echo
    
    touch secret.txt
    echo "Datos Ejemplo" > secret.txt

    touch .gitignore
    echo "#Archivo Prueba" > .gitignore
    echo "secret.txt" >> .gitignore

    #touch "${file_ignore}_texto.txt"    
}

add_staged_files() {
	clear	
    echo -e "-----------4. Archivos Ignore (touch .gitignore)-------------"
    echo
    
    mkdir practica_01
    touch ./practica_01/index.html
    
    #echo "<html><head></head><body><h1>Datos de Ejemplo</h1></body></html>" >> ./practica_01/index.html

    echo "<html>" > ./practica_01/index.html
    echo "  <head>" >> ./practica_01/index.html
    echo "  </head>" >> ./practica_01/index.html
    echo "  <body>" >> ./practica_01/index.html
    echo "      <h1>" >> ./practica_01/index.html
    echo "          Datos de Ejemplo" >> ./practica_01/index.html
    echo "      </h1>" >> ./practica_01/index.html
    echo "  </body>" >> ./practica_01/index.html
    echo "</html>" >> ./practica_01/index.html
    
    git add -A
    git status
}

set_cached_staged_files() {
	clear	
    echo -e "-----------5. Eliminar Cache Archivos Ignore (git rm --cached .gitignore)-------------"
    echo
    
    git rm --cached .gitignore
}

set_commit_staged_files() {
	clear	
    echo -e "-----------6. Commit Cambios Archivos to Local (git commit -m)-------------"
    echo
    
    git commit -m "Subir Local 1"
    git status
    git log
}

upload_commited_staged_files() {
	clear	
    echo -e "-----------7. Upload Archivos to Internet (git push origin main)-------------"
    echo
    
    git push origin main
}

download_commited_staged_files() {
	clear	
    echo -e "-----------8. Download Archivos from Internet (git push origin main)-------------"
    echo
    
    git pull origin main
}

get_ayuda_cdrom1() {
    feh "./imagen/02_intermedio/07_cdrom.jpg"
}

get_info_global() {
    clear	
    echo -e "-----------11. Git Version (git --version)-------------"
    echo

    git --version

    git status
}

while [ 1 ]
do
    get_menu_opciones

    case $opcion in
        0)
            clear;
            echo -e "Proceso terminado correctamente..."
            break ;;          
        1)
			 set_configuracion ;;            
        2)
             get_clone_repository;;          
        3)
             set_archivos_ignore_config;;
        4)
			 add_staged_files ;;
        5)
			 set_cached_staged_files ;;
        6)
			 set_commit_staged_files ;;
        7)
			 upload_commited_staged_files ;;
        8)
			 download_commited_staged_files ;;        
        11)
             get_info_global;;
        81)
             get_ayuda_cdrom1;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac

echo -e "Presione la tecla Enter para continuar"
read linea

done