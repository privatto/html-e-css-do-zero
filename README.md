# Projeto HTML & CSS e Container

Este projeto consiste em um conjunto de páginas HTML e CSS que formam um website. O website parece ser de uma empresa de tecnologia, oferecendo serviços em nuvem e outras soluções.

## Estrutura do Projeto

O projeto contém as seguintes páginas principais:

- `index.html`: Página principal do site.
- `quem-somos.html`: Página "Quem Somos" com informações sobre a empresa.
- `clientes.html`: Página que exibe os clientes da empresa.
- `equipe.html`: Página que apresenta a equipe da empresa.
- `contato.html`: Página de contato com um formulário para enviar mensagens.
- `produto.html`: Página de produto com informações sobre um aplicativo e suas funcionalidades.

## Tecnologias Utilizadas

- HTML5
- CSS3
- Nginx (para configuração de proxy e balanceamento de carga)
- Docker (para conteinerização)

## Como executar com Docker

Para executar o projeto em um contêiner Docker, siga os seguintes passos:

1.  Certifique-se de ter o Docker instalado em sua máquina.
2.  Navegue até o diretório raiz do projeto no terminal.
3.  Execute o comando: `docker build -t lab-web-page .`
4.  Após a construção da imagem, execute o contêiner com: `docker run -d -p 8080:80 lab-web-page`
5.  Acesse o site em seu navegador através do endereço `http://localhost:8080`.


## Como Enviar para o Docker Hub

Para compartilhar sua imagem ou usá-la em outros ambientes, você pode enviá-la para o Docker Hub.

1.  **Faça login no Docker Hub:**
    ```bash
    docker login
    ```
2.  **Tagueie sua imagem local:** Antes de enviar, você precisa taguear a imagem com seu nome de usuário do Docker Hub. 
    ```bash
    docker tag lab-web-page privatto/lab-web-page:latest
    ```
3.  **Envie a imagem (push):**
    ```bash
    docker push privatto/lab-web-page:latest
    ```

    ```bash
    docker push privatto/lab-web-page:latest
    ```

## Como Fazer o Deploy no Google Cloud Run

Após enviar a imagem para o Docker Hub, você pode implantá-la como um serviço no Google Cloud Run, que é uma plataforma serverless.

**Pré-requisitos:**

*   Ter o [Google Cloud SDK (gcloud CLI)](https://cloud.google.com/sdk/docs/install) instalado e configurado.
*   Ter um projeto no Google Cloud com a [API do Cloud Run](https://console.cloud.google.com/apis/library/run.googleapis.com) ativada.
*   Autenticar-se na sua conta Google: `gcloud auth login`
*   Configurar o projeto a ser usado: `gcloud config set project SEU_PROJECT_ID` (substitua `SEU_PROJECT_ID` pelo ID do seu projeto).

**Comando para Deploy:**

Execute o comando abaixo para implantar a imagem `privatto/lab-web-page:latest` diretamente do Docker Hub.

```bash
gcloud run deploy lab-web-page \
  --image docker.io/privatto/lab-web-page:latest \
  --platform managed \
  --region us-central1 \
  --allow-unauthenticated
```

*   **`lab-web-page`**: É o nome que você dará ao seu serviço no Cloud Run.
*   **`--image`**: Aponta para a imagem no Docker Hub. O prefixo `docker.io/` é importante.
*   **`--region`**: Especifique a região do Google Cloud onde você quer hospedar o serviço (ex: `us-central1`, `southamerica-east1`).
*   **`--allow-unauthenticated`**: Permite que o serviço seja acessado publicamente pela internet, sem necessidade de login.

Após a execução, o gcloud CLI fornecerá a URL do serviço implantado.

