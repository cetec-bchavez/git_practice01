#!/bin/bash

opcion=0
linea=""

#"-----------1. INICIO PROYECTO -------------"
proyecto="git_practice01"
https_url="https://github.com/cetec-bchavez/git_practice01.git"
ssh_url="git@github.com:cetec-bchavez/git_practice01.git"

#"-----------2. CONFIGURACION (NO OBLIGATORIO)-------------"
usuario="bydan105"
mail="bydan@hotmail.com"

#"-----------3. ARCHIVOS-------------"
file_ignore="secret.txt"

carpeta_nuevo="practica_01"
archivo_nuevo="index.html"

archivo_eliminar=".gitignore"
carpeta_eliminar="practica_01"

#"-----------4. CAMBIOS ARCHIVOS-------------"
comentario="Confirmar Local 1"

#"-----------5. REMOTO-------------"
rama="funcionalidad1"

#"-----------6. RAMA-------------"

#"-----------7. RESUMEN DIARIO-------------"


get_menu_opciones() {
    clear
    echo
    echo -e "\t\t\tGIT\n"
	
	echo -e "\n\t------------------- GENERAL -------------------------"
    echo -e "\t\t1. Inicio Repositorio"
    echo -e "\t\t2. Configuracion Repositorio"
    echo -e "\t\t3. Archivos Agregar/Eliminar"
    echo -e "\t\t4. Confirmar Cambios Archivos"
    echo -e "\t\t5. Ramas Repositorio"
    echo -e "\t\t6. Acciones Remoto Web"
    echo -e "\t\t7. Proceso Resumen Diario"

    echo -e "\n\t------------------- INFORMACION -------------------------"    
    echo -e "\t\t21. Informacion"
    echo -e "\t\t22. Resumen Informacion Diario"
    
    #echo -e "\n\tAYUDA"
    #echo -e "\t\t81. Ayuda Discos 1(Df,Mount)"
   
    echo -e "\n\t0. Salir\n\n"
    
    read -p "Escoja una Opcion: " opcion

    #echo -e "\t\tEscoja una Opcion: "    
    #read opcion
}

get_basico() {
	clear
	
    echo -e "-----------1. INICIO PROYECTO -------------"
   	
    echo -e "\t\t1. Crear Carpeta Proyecto (mkdir)"
    echo -e "\t\t2. Crear Git Actual (git init)"
    echo -e "\t\t3. Clonar Repositorio Https (TOKEN) (git clone)"
    echo -e "\t\t4. Clonar SSH (Keys Public/Private) (git clone git:)"
    echo -e "--- Informacion ---"
    echo -e "\t\t11. Ver Version Git (git --version)"
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
            mkdir $proyecto
            ls -alh ;;
        2)
            git init 
            ls -alh ;;
        3)
            git clone $https_url
            ls -alh ;;
        4)
            git clone $ssh_url 
            ls -alh ;;
        11)
		    git --version ;;                   
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}

get_configuracion_git() {
	clear
	
    echo -e "-----------2. CONFIGURACION (NO OBLIGATORIO)-------------"
   
	echo -e "\t\t1. Usuario y Mail (git config user.name,git config user.mail)"

    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;       
        1)
            git config --global user.name $usuario                    
            git config --global user.email $mail ;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}       

get_archivos() {
    clear
    
    echo -e "-----------3. ARCHIVOS-------------"
   
    echo -e "\t\t1. Archivo Ignore con Ejemplo (touch .gitignore)"
    echo -e "\t\t2. Archivo Html"
    echo -e "\t\t3. Eliminar Cache Archivos Ignore (git rm --cached .gitignore)"
    echo -e "\t\t4. Eliminar Carpeta (Staged-Local / Remote) (git rm -r practica_01)"
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
            # 1) Crear Archivo Ejemplo
            touch $file_ignore
            echo "Datos Ejemplo" > $file_ignore

            # 2) Crear Archivo Control .gitignore
            #  - Adicionar Archivo Ejemplo
            touch ".gitignore"
            echo "#Archivo Prueba" > ".gitignore"
            echo $file_ignore >> ".gitignore"  

            echo "$file_ignore y .gitignore Generated..." ;;

        2)
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
            
            echo "./$carpeta_nuevo/$archivo_nuevo Created...";;

        3)
            git rm $archivo_eliminar
            echo "$archivo_eliminar Deleted..." ;;
        4)
            git rm -r $carpeta_eliminar
            echo "$carpeta_eliminar Deleted..." ;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}   

get_cambios_archivos() {
	clear
	
    echo -e "-----------4. CAMBIOS ARCHIVOS-------------"
   
	echo -e "\t\t1. Agregar Staged (git add -A)"
	echo -e "\t\t2. Commit Archivo (git commit -m)"
    #echo -e "\t\t3. Eliminar Archivo (git rm --cached)"
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
		    git add -A 
            git status ;;

        2)
            read -p "Ingrese un Comentario: " comentario
            git commit -m "$comentario"
            echo "Commited..." ;;        
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}   

get_remoto() {
    clear
    
    echo -e "-----------5. REMOTO-------------"
    
    echo -e "\t\t1. Subir/Actualizar Proyecto Internet"
    echo -e "\t\t2. Bajar Ultima Version"
    echo -e "\t\t3. Connect Local Repository to Internet (git remote add origin)"
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;                           
        1)
            read -p "Ingrese la Rama a Actualizar(git push -u origin): " rama
            git push -u origin $rama;;
        2)
            read -p "Ingrese la Rama a Descargar(git pull origin): " rama
            git pull origin $rama;;
        3)
            read -p "Ingrese Https Repositorio a Conectar(git remote add origin): " https_url
            git remote add origin $https_url;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}

get_rama() {
	clear
	
    echo -e "-----------6. RAMA-------------"
   
    echo -e "\t\t1. Crear Rama/Branch (git branch funcionalidad1)"
	echo -e "\t\t2. Cambiar Rama/Branch Actual (git checkout funcionalidad1/main)"
    echo -e "\t\t3. Merge/Unir a Rama Principal Local a Main Local from Internet (git merge funcionalidad1)"
    #echo -e "\t\t4. Enlace Rama Local/Remoto (git push -u origin)"
    echo -e "\t\t4. Eliminar Rama/Branch Local (git branch -d funcionalidad1)"
    echo -e "\t\t5. Eliminar Rama/Branch Remoto (git push origin --delete funcionalidad1)"

    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion

    
    case $opcion in
        0)  
            ;;        
        1)
            read -p "Ingrese el Nombre de Rama: " rama
            git branch $rama ;;
        2)
            read -p "Ingrese el Nombre de Rama: " rama
            git checkout $rama ;;
        3)
            read -p "Ingrese el Nombre de Rama: " rama
            git merge $rama ;;
        #4)
        #    read -p "Ingrese el Nombre de Rama: " rama
        #    git push -u origin $rama ;;

        4)
            read -p "Ingrese el Nombre de Rama: " rama
            git branch -d $rama ;;
        5)
            read -p "Ingrese el Nombre de Rama: " rama
            git push origin --delete $rama ;;
        *)  
            echo -e "Seleccion Incorrecta" ;;
    esac
}   

get_resumen_diario() {
	clear
	
    echo -e "-----------7. RESUMEN DIARIO-------------"
   
    echo -e "\t\t1. Actualizar todos los cambios"
	echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
            read -p "Ingrese un Comentario: " comentario
            read -p "Ingrese la Rama a Actualizar(master,main): " rama

            git add -A
		    git commit -m "$comentario"
            git push origin $rama
            ;;           
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}

get_informacion_resumen_diario() {
    clear
    
    echo -e "-----------22. INFORMACION RESUMEN DIARIO-------------"
   
    echo -e "\n\t\t1. Informacion para todos los cambios"
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
            echo -e "\n------------ ESTADO Y RAMAS-----------------"
            git status

            echo -e "\n------------ RAMAS -----------------"
            git branch -a
            ;;        
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}

get_informacion() {
    clear
    
    echo -e "-----------21. INFORMACION-------------"
   
    echo -e "\t\t1. Listar Configuracion Git (Usuario,Mail)"
    echo -e "\t\t2. Listar Archivos Proyecto"
    echo -e "\t\t3. Ver Git Estado Global Commit (git status)"
    echo -e "\t\t4. Ver Git Commit Log Local (git log)"
    echo -e "\t\t5. Ver Git Diferencias Commit Local/Remote Log (git diff)"
    echo -e "\t\t6. Ver Ramas Proyecto"
    echo -e "\t\t7. Listar Ramas"
    echo -e "\t\t8. Listar Ramas Merged"    
    echo -e "\n\t\t0. Salir\n\n"

    read -p "Escoja una Opcion: " opcion


    case $opcion in
        0)  
            ;;
        1)
            git config --list ;;           
        2)
            ls -alh ;;
        3)
            git status ;;
        4)
            git log ;;
        5)
            git diff ;;
        6)
            git branch -a ;;
        7)
            git branch ;;           
        8)
            git branch --merged;;
        *)  
            echo -e "Seleccion Incorrecta";;
    esac
}

get_ayuda_discos1() {
    feh "./imagen/03_avanzado/02_administracion/024_particiones.jpg"
}

get_ayuda_discos2() {
    feh "./imagen/03_avanzado/02_administracion/026_software_tamanio.jpg"
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
	        get_basico ;;           
        2)
            get_configuracion_git ;; 
        3)
            get_archivos ;;       
        4)
            get_cambios_archivos ;;
        5)
            get_remoto ;;
        6)
            get_rama ;;        
        7)
            get_resumen_diario ;;
        21)
            get_informacion ;;
        22)
            get_informacion_resumen_diario ;;
        81)
            get_ayuda_discos1 ;;       
        82)
            get_ayuda_discos1 ;;

        *)  
            echo -e "Seleccion Incorrecta";;
    esac

echo -e "\nPresione la tecla Enter para continuar"
read linea

done

