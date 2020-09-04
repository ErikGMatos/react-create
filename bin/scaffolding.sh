#!/bin/bash
#
# Programa: scaffolding.sh
# Autor: Erik Matos
#
# Descrição:
# Este script será responsável pela criação
# de uma estrutura para novos projetos.
#
# Uso: chmod u+x scaffolding.sh && ./scaffolding.sh

# Iniciando a interação com o usuário
GREEN='\033[0;32m'
NC='\033[0m'
echo -n "→ Digite o nome do projeto sem espaços: "
read TEXT
PROJECT="$(echo -e "${TEXT}" | tr -d '[:space:]')"
mkdir -p $PROJECT
echo -e → Criando pastas...
git clone https://github.com/ErikGMatos/template-react-erik.git templatetemp &&  cp -r ./templatetemp/. ./$PROJECT  && rm -rf ./templatetemp && cd $PROJECT && yarn
NOW=$(date +"%d-%m-%Y")
USERNAME=$(whoami)
sed -i -e 's/##USERNAME##/'$USERNAME'/g' src/pages/Dashboard/index.js package.json
sed -i -e 's/##NOW##/'$NOW'/g' src/pages/Dashboard/index.js
sed -i -e 's/nameproject/'$PROJECT'/g' package.json
git add package.json src/pages/Dashboard/index.js && git commit -m 'feat(initial): Initial'
echo -e "✔ Processo finalizado!"
echo -e "✔ Projeto $PROJECT foi criado"
echo -e "✔ Rode o comando abaixo"
echo -e "${GREEN}✔ cd $PROJECT && yarn start${NC}"