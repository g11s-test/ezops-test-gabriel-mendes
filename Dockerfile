# base image
FROM node:12

# Copiando arquivos para container
COPY . /data/app/

# Criando um atalho para o node_modules ser utilizado outra pasta
RUN ln -s /data/app/package.json /data/.

# Voltando para pasta do node_modulels
WORKDIR /data

# Instalar e armazenar em cache dependências de aplicativos
RUN npm install

# Seta path do caminho do node_modules
ENV PATH /data/node_modules/.bin:$PATH

# Definir diretório de trabalho
WORKDIR /data/app/

# Gera build dos arquivos ts
RUN npm run build

EXPOSE 3000

# Inicia aplicação
CMD ["npm", "start"]
