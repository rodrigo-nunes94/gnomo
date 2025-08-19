# GNOMO — IA Offline 

GNOMO é uma plataforma de IA local, totalmente offline, focado em anonimização.
Funciona com Docker e integra-se ao Ollama, permitindo escolher e executar modelos de IA localmente.  
Não utiliza banco de dados — todo o armazenamento é feito em arquivos JSON simples.

O sistema possui suporte para upload de documentos em formato `.md` (Markdown), que são indexados e utilizados para consultas direcionadas pela IA. E também suporte a alteração do system prompt.


## 1. Pré-requisitos

- Docker instalado  
  https://docs.docker.com/get-docker/

## 2. Clone o projeto

```bash
git clone https://github.com/gustafonso/gnomo
cd gnomo
```

---

## 3. Build e execução do GNOMO

Execute os comandos:

```bash
docker-compose up -d
```

Isso irá subir:
- Ollama (porta 11434)
- Backend (porta 4000)
- Frontend (porta 3000)

---

## 4. Importação das IA

Execute os comandos:

```bash
docker exec -it ollama ollama pull <IA>
```

Isso irá adicionar as IAs ao container do Ollama, sugerimos o seguinte:
### Modelos mais leves (recomendados para 8GB a 16GB RAM e SEM placa de video):
- `llama3:8b`
- `mistral:7b`
- `phi3:mini`
- `codellama:7b`

### Modelos mais pesados (Necessário placa de vídeo):
- `deepseek:67b`
- `llama3:70b`
- `dolphin-mixtral`

Consulte todos os modelos disponíveis em:  
https://ollama.com/library


---

## 5. Acesso ao sistema

Acesse pelo navegador:

```
http://localhost:3000
```

Abaixo estão capturas de tela demonstrando a interface do GNOMO:

Tela de Login:

Login padrão:  
**Usuário:** admin  
**Senha:** admin

![Login](./images/Login.png)

---

Interação Inicial com a IA:

![Interação Inicial](./images/Interação-Inicial.png)

---

Prompt Direcionado por Modelo:

![Prompt Direcionado](./images/Prompt-Direcionado.png)

---

Alteração de System Prompt:

![Alteração de System Prompt](./images/Alteração-de-System-Prompt.png)


*No painel do admin (Acesso no canto inferior esquerdo), podemos criar usuários, mudar senhas e adicionar prompts personalizados que ficarão registrados para uso.


---

## 6. Como parar os containers

```bash
docker-compose down
```

---

## 7. Notas importantes

- Cada máquina deve ter o Ollama rodando localmente, não incluso no Docker.
- O GNOMO se conecta automaticamente ao Ollama no Windows e macOS.  
No Linux, é necessário definir a variável `OLLAMA_URL` apontando para o IP local **e rodar o Ollama com** `OLLAMA_HOST=0.0.0.0 nohup ollama serve > ollama.log 2>&1 &`.

---

## 8. Funcionalidades

- IA local e offline (via Ollama)
- Suporte a múltiplos modelos IA
- Upload de documentos Markdown (.md) para aprendizado e consulta
- Gerenciamento de usuários
- Histórico de chats persistente
- Criação de system prompt
- Logs completos de ações

---

## 9. Melhorias em andamento

- Implementação de banco de dados
- Suporte a múltiplos modelos de documentos (Não somente .md)
- Análise de imagem e vídeo
- Integração com visão computacional

---

## 10. Licença

Este projeto está licenciado sob os termos da [MIT License](./LICENSE).

Este projeto utiliza o [Ollama](https://ollama.com), licenciado sob MIT.
