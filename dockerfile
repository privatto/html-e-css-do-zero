# Use a imagem oficial do Nginx
FROM nginx:stable-alpine

# Copie os arquivos da página para o diretório padrão do Nginx

# Copie a configuração customizada do Nginx para escutar na porta 8080
COPY default.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html


# Exponha a porta 8080
EXPOSE 8080

# Comando padrão do Nginx (já definido na imagem base)
CMD ["nginx", "-g", "daemon off;"]
