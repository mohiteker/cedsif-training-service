
#0. cria uma branch
git checkout -b demoXXX

# define o padrao do utilizador
git config --local user.name  "demoXXX"
git config --local user.email "grupo-x@gmail.com"

# adiciona um ficheiro
git add *.png

# envia as informacoes de versionamento para o repositorio local
git commit -m "Shifu building lab-projects" <file>

# envia as informacoes de versionamento para o repositorio remoto
git -c http.sslVerify=false push origin <branch>

git -c http.sslVerify=false pull origin <branch>
--
git add *.png
--
git commit -m "Shifu building test1 and lab-projects"
--
git -c http.sslVerify=false push origin <branch>


#1. fazer o clone do projecto.
git -c http.sslVerify=false \
       clone --branch demoXXX \
       https://mohitek.net/gitlab/app-development/grupo-x/_25/training25XXsample-portal-grupo-x-lab.git

#2. copy labs projects do here
cp ... ...

#3.

#4. criar uma referencia para o repositorio do git
git -c http.sslVerify=false pull origin test1-ceXXXXednilcematola --force

#5. database configuration

 
git -c http.sslVerify=false pull origin <branch>

-- 
