
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
git  push origin <branch>

git  pull origin <branch>

git add *.png

git commit -m "Shifu building test1 and lab-projects"

git  push origin <branch>


#1. fazer o clone do projecto.
git  \
       clone --branch demoXXX \
       https://mohitek.net/gitlab/app-development/grupo-x/_25/training25XXsample-portal-grupo-x-lab.git

#2. copy labs projects do here
cp ... ...

#4. criar uma referencia para o repositorio do git
git  pull origin test1-ceXXXXednilcematola --force