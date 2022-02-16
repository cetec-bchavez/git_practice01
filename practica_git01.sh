#!/bin/bash

opcion=0
linea=""

# 1) Configuracion (git config)
usuario="bydan105"
mail="bydan@hotmail.com"

# 2) Clonar Proyecto (git clone)
https_url="https://github.com/cetec-bchavez/git_practice01.git"
ssh_url="git@github.com:cetec-bchavez/git_practice01.git"
proyecto="git_practice01"

# 3) .gitignore Archivo (echo secret.txt >> .gitignore)
file_ignore="secret.txt"

# 4) Nuevo Archivo (git add .)
carpeta_nuevo="practica_01"
archivo_nuevo="index.html"

# 5) Eliminar Archivo (git rm --cached)
archivo_eliminar=".gitignore"
carpeta_eliminar="practica_01"

# 6) Commit Mensaje (git commit)
mensaje_commit="Subir Local 1"

#---------- TOKENS PARA HTTPS ----------
#---- cetec-bchavez, Practicas ----
# 7-Dias,15/02/2022
# u: cetec-bchavez
# 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

#---------- KEYS PARA SSH --------------
# Detalle en get_clone_repository_ssh

get_menu_opciones() {
    clear
    echo
    echo -e "\t\t\tPRACTICA GIT 01-REMOTO\n"
    
	echo -e "\t1. Configuracion (NO OBLIGATORIO) (usuario,mail)"
    echo -e "\t2. Clonar Https (TOKEN) (git clone https:)"
    echo -e "\t3. Clonar SSH (Keys Public/Private) (git clone git:)"
    echo -e "\t4. Archivos Ignore (touch .gitignore)"
    echo -e "\t5. Add Archivos to Local Staged (git add -A)"
    echo -e "\t6. Commit Cambios Archivos to Local (git commit -m)"
    echo -e "\t7. Upload Archivos to Internet (git push origin main)"
    echo -e "\t8. Download Archivos from Internet (git push origin main)"
    echo -e "\t9. Eliminar Archivos (Staged / Cache) (git rm --cached .gitignore)"
    echo -e "\t10. Eliminar Carpeta (Staged / Remote) (git rm -r practica_01)"
    
    echo -e "\n\tINFO"
    echo -e "\t\t11. Git Status Local / Version (git status && git --version)"
    echo -e "\t\t12. Git Commit Local Log (git log && git --version)"
    echo -e "\t\t13. Git Diff Commit Local/Remote Log (git diff)"
    echo -e "\t\t14. Ver Archivos Actuales Local (ls -alh)"
    echo -e "\t\t15. Ver Configuracion Local (Usuario/Mail) (git config --list)"

    echo -e "\n\tAYUDA"
    echo -e "\t\t81. Ayuda Cd-ROM 1(Log,Eject)"
    echo -e "\t\t99. Testing"

    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion
}

set_configuracion_local() {
	clear	
    echo -e "-----------1. Configuracion (NO OBLIGATORIO) (usuario,mail)-------------"
    echo
    
    #------- DATA AUTO ---------
    #user.name=cetec-bchavez
    #user.email=cetec.bchavez@gmail.com
    #remote.origin.url=https://github.com/cetec-bchavez/git_practice01.git

    git config --global user.name $usuario
    git config --global user.email $mail
    git config --list
    
    ##for g1 in $(groups); do
	#	echo -e "-> $g1"
	#done
}  

get_clone_repository_https() {
	clear	
    echo -e "-----------2. Clonar Https (TOKEN) (git clone)-------------"
    echo
    
    git clone $https_url

    ls -alh
}

get_clone_repository_ssh() {
    clear   
    echo -e "-----------3. Clonar SSH (Keys Public/Private) (git clone git:)-------------"
    echo
    
    git clone $ssh_url

    ls -alh

    #---------- KEYS PARA SSH --------------
    # apt-get install openssh-server
    # systemctl enable ssh
    # ssh-keygen -t rsa -b 4096 -C "cetec.bchavez@gmail.com"
    # Password, Nombre Archivo = cetec_bchavez
    # Archivo Clave Publica x.pub copiar Codigo a github.com
    # Perfil ---> Settings ---> SSH and GPG Keys
    # Archivo Clave Privada (cetec_bchavez), copiar a /home/bydan_lnlt/.ssh/
    # Cambiar Nombre cetec_bchavez ---> id_rsa
    # Comprobar ssh -T git@github.com
    # Pregunta = yes (Aunque no hay conexion)
}

create_set_archivos_ignore_config() {
	clear	
    echo -e "-----------4. Archivo Ignore con Ejemplo (touch .gitignore)-------------"
    echo
    
    # 1) Crear Archivo Ejemplo
    touch $file_ignore
    echo "Datos Ejemplo" > $file_ignore


    # 2) Crear Archivo Control .gitignore
    #  - Adicionar Archivo Ejemplo
    touch ".gitignore"
    echo "#Archivo Prueba" > ".gitignore"
    echo $file_ignore >> ".gitignore"  

    echo "$file_ignore y .gitignore Generated..."
}

add_staged_files() {
	clear	
    echo -e "-----------5. Archivos Ignore (touch .gitignore)-------------"
    echo
    
    # 1) Crear Archivo Ejemplo: ./practica_01/index.html
    mkdir $carpeta_nuevo
    touch "./$carpeta_nuevo/$archivo_nuevo"
    
    echo "<html>" > "./$carpeta_nuevo/$archivo_nuevo"
    echo "  <head>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  </head>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  <body>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "      <h1>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "          Datos de Ejemplo" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "      </h1>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "  </body>" >> "./$carpeta_nuevo/$archivo_nuevo"
    echo "</html>" >> "./$carpeta_nuevo/$archivo_nuevo"
    
    # Add Archivo Ejemplo al Local Stage
    git add -A

    git status

    echo "./$carpeta_nuevo/$archivo_nuevo Added..."
}

set_commit_staged_files() {
	clear	
    echo -e "-----------6. Commit Cambios Archivos to Local (git commit -m)-------------"
    echo
    
    git commit -m "$mensaje_commit"

    echo "Commited..."
}

upload_commited_staged_files() {
	clear	
    echo -e "-----------7. Upload Archivos to Internet (git push origin main)-------------"
    echo
    
    git push origin main

    echo "Uploaded..."
}

download_commited_staged_files() {
	clear	
    echo -e "-----------8. Download Archivos from Internet (git push origin main)-------------"
    echo
    
    git pull origin main

    echo "Downloaded..."
}

delete_staged_file() {
    clear   
    echo -e "-----------9. Eliminar Cache Archivos Ignore (git rm --cached .gitignore)-------------"
    echo    

    git rm $archivo_eliminar

    echo "$archivo_eliminar Deleted..."

    # Luego Ejecutar 5), 6) , 7) osea Commit, Upload, Download
    # Eliminacion Local/Remoto
    #git rm $archivo_eliminar

    # Eliminacion Local
    #git rm --cached $archivo_eliminar
}

delete_staged_folder() {
    clear   
    echo -e "-----------10. Eliminar Carpeta (Staged-Local / Remote) (git rm -r practica_01)-------------"
    echo    

    git rm -r $carpeta_eliminar

    echo "$carpeta_eliminar Deleted..."
    
    # Eliminacion Local/Remoto
    #git rm --cached $carpeta_eliminar
}

get_info_local_status() {
    clear	
    echo -e "-----------11. Git Status Local / Version (git status && git --version)-------------"
    echo

    git --version

    git status
}

get_info_local_commit_log() {
    clear   
    echo -e "-----------12. Git Commit Log Local (git log && git --version)-------------"
    echo

    git --version

    git log
}


get_info_local_remote_commit_diff() {
    clear   
    echo -e "-----------13. Git Diff Commit Local/Remote Log (git diff)-------------"
    echo

    git diff
}

get_info_archivos_actuales() {
    clear   
    echo -e "-----------14. Ver Archivos Actuales Local (git config --list)-------------"
    echo

    ls -alh
}

get_info_configuracion_local() {
    clear   
    echo -e "-----------15. Ver Configuracion Local (Usuario/Mail) (git config --list)-------------"
    echo

    git config --list
}

get_ayuda_cdrom1() {
    feh "./imagen/02_intermedio/07_cdrom.jpg"
}

exec_testing() {
    echo $proyecto
    echo ${proyecto}

    cd $proyecto
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
			 set_configuracion_local ;;            
        2)
             get_clone_repository_https;;          
        3)
             get_clone_repository_ssh;;
        4)
             create_set_archivos_ignore_config;;
        5)
			 add_staged_files ;;        
        6)
			 set_commit_staged_files ;;
        7)
			 upload_commited_staged_files ;;
        8)
			 download_commited_staged_files ;;        
        9)
             delete_staged_file ;;
        10)
             delete_staged_folder ;;
        11)
             get_info_local_status;;
        12)
             get_info_local_commit_log;;
        13)
             get_info_local_remote_commit_diff;;
        14)
             get_info_archivos_actuales;;
        15)
             get_info_configuracion_local;;
        81)
             get_ayuda_cdrom1;;
        99)
             exec_testing;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac

echo -e "Presione la tecla Enter para continuar"
read linea

done