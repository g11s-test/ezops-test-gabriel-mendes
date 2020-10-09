# base image
FROM node:12

ARG USER_ID=1000

# Substitui usuário node que já vem por padrão pelo usuário "admin"
# que utiliza o USER_ID da máquina host do desenvolvedor para que não
# haja problemas de permissão durante o desenvolvimento
RUN deluser --remove-home node; \
  useradd -u ${USER_ID} -g www-data --shell /bin/bash --create-home admin

# Configuração necessária para evitar problemas de permissionamento
# ao executar pacotes globais pelo NPM com um usuário sem privilégios
RUN mkdir /home/admin/.npm-global ; \
  chown -R admin /home/admin/.npm-global
ENV PATH=/home/admin/.npm-global/bin:$PATH
ENV NPM_CONFIG_PREFIX=/home/admin/.npm-global

RUN mkdir /data
RUN chown -R admin:www-data /data

# Os comandos a partir daqui, como também os que forem executados dentro do
# container irão utilizar este usuário
USER admin

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

EXPOSE 3000

# Inicia aplicação
CMD ["npm", "start"]
