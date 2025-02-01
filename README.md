# CryptoTracker
CryptoTracker é uma gem Ruby que permite consultar o preço atual e o histórico de preços de qualquer criptomoeda suportada pela API CoinGecko. Os valores podem ser retornados em reais (BRL) ou dólares (USD). A gem também está disponível no [RubyGems](https://rubygems.org/gems/crypto_tracker).

## 📌 Funcionalidades
- Obtenha o preço atual de qualquer criptomoeda;
- Consulte o histórico de preços dos últimos 7, 30, 90 ou mais dias;
- Suporte para diferentes moedas (BRL e USD);
- Integração com a API da CoinGecko (Plano Gratuito).

## 🛠️ Stack
- Ruby 3.4.1;
- Faraday para requisições HTTP;
- CoinGecko API como fonte de dados.

## 📦 Instalação
Você pode instalá-la adicionando ao seu Gemfile:
```ruby
# Gemfile
gem 'crypto_tracker'
```

Depois, execute:
```bash
bundle install
```

Ou instale manualmente:
```bash
gem install crypto_tracker
```

## 🚀 Como Usar
Primeiro, carregue a gem no seu código:
```bash
require 'crypto_tracker'
```
### 🔹 Obter o preço atual
```bash
CryptoTracker.price("bitcoin", "brl")  # Preço atual do Bitcoin em BRL
CryptoTracker.price("ethereum", "usd") # Preço atual do Ethereum em USD
```

📌 Exemplo de resposta:
```json
{ "coin": "bitcoin", "price": 350000, "currency": "brl", "timestamp": "2025-01-30T14:00:00Z" }
```

### 🔹 Obter o histórico de preços
```bash
CryptoTracker.history("bitcoin", 7, "usd")   # Histórico do bitcoin nos últimos 7 dias em USD
CryptoTracker.history("ethereum", 30, "brl") # Histórico do ethereum nos últimos 30 dias em BRL
```

📌 Exemplo de resposta:
```json
[
  { "timestamp": "2025-01-23T14:00:00Z", "price": 34000 },
  { "timestamp": "2025-01-24T14:00:00Z", "price": 34500 },
  { "timestamp": "2025-01-25T14:00:00Z", "price": 35000 }
]
```

## ⏳ Rate Limit da API CoinGecko
A gem CryptoTracker está configurada para usar o plano gratuito da API CoinGecko. Isso significa que há um limite de:
- 30 chamadas por minuto;
- Máximo de 10.000 chamadas por mês.

Se você ultrapassar esses limites, a API pode bloquear temporariamente as requisições. Para um uso mais intensivo, considere um plano pago da CoinGecko ([mais detalhes aqui](https://www.coingecko.com/en/api/pricing?utm_source=chatgpt.com)).

## 🛠️ Desenvolvimento
Se quiser modificar a gem, clone o repositório e instale as dependências:
```bash
git clone git@github.com:davide-almeida/crypto_tracker.git
cd crypto_tracker
bundle install
```

### 🔹 Testar a gem localmente
Dentro do projeto, execute:
```bash
irb -I lib -r "crypto_tracker"
```

E teste os métodos:
```bash
CryptoTracker.price("bitcoin", "usd") # Preço atual do Bitcoin em USD
CryptoTracker.history("ethereum", 7, "brl") # Histórico do bitcoin nos últimos 7 dias em BRL
```

Você também pode usar alguns alias do `Makefile` para testes no IRB ou Rails Console:
| Comando | Descrição |
|-|-|
| make build | remove arquivos `.gem` (caso existam) e gera um novo `.gem` |
| make install | instala a gem localmente |
| make uninstall | desinstala a gem localmente |

## 🤝 Como Contribuir
Contribuições são bem-vindas! Para contribuir com a gem crypto_tracker, siga estas etapas:

### 1️⃣ Fork o Repositório
Primeiro, crie um fork do projeto e clone para a sua máquina:
```bash
git clone https://github.com/seu-usuario/crypto_tracker.git
cd crypto_tracker
bundle install
```

### 2️⃣ Criar uma Branch para sua Feature/Fix
Crie uma nova branch para sua contribuição:
```bash
git checkout -b minha-nova-feature
```

### 3️⃣ Faça as Modificações e Teste
1. Faça as alterações necessárias no código.
2. Teste as mudanças para garantir que tudo funciona:

```bash
bundle exec rspec
bundle exec rubocop
```

### 4️⃣ Envie um Pull Request
1. Faça o commit das mudanças:

```bash
git add .
git commit -m "feat: adds new feature X"
```

2. Envie para o seu fork:
```bash
git push origin minha-nova-feature
```

3. Abra um Pull Request (PR) no repositório oficial.

## 💎 Criando uma Nova Versão da Gem
Se você estiver publicando uma nova versão da gem, siga estes passos:

### 1️⃣ Atualizar a Versão
Edite o arquivo lib/crypto_tracker/version.rb e modifique a versão, por exemplo:
```ruby
module CryptoTracker
  VERSION = "0.2.1"
end
```

### 2️⃣ Criar a Tag e Publicar
```bash
git add lib/crypto_tracker/version.rb
git commit -m "Bump version to 0.2.1"
git tag -a v0.2.1 -m "v0.2.1"
git push origin v0.2.1
```
🚀 Isso acionará o GitHub Actions para publicar automaticamente a nova versão no [RubyGems](https://rubygems.org/gems/crypto_tracker)! 🎉

Se você encontrar bugs ou quiser sugerir melhorias, sinta-se à vontade para abrir um Issue ou enviar um Pull Request. 😊

## 📜 Licença
Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](https://github.com/davide-almeida/crypto_tracker/blob/main/LICENSE.txt) para mais detalhes.