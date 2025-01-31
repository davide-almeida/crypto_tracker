# CryptoTracker
CryptoTracker é uma gem Ruby que permite consultar o preço atual e o histórico de preços de qualquer criptomoeda suportada pela API CoinGecko. Os valores podem ser retornados em reais (BRL) ou dólares (USD).

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
Adicione a seguinte linha ao seu `Gemfile`:
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
CryptoTracker.price("bitcoin", "usd")
CryptoTracker.history("ethereum", 7, "brl")
```

Você também pode usar alguns alias do `Makefile` para testes no IRB ou Rails Console:
| Comando | Descrição |
|-|-|
| make build | remove arquivos `.gem` (caso existam) e gera um novo `.gem` |
| make install | instala a gem localmente |
| make uninstall | desinstala a gem localmente |

## 📜 Licença
Este projeto está licenciado sob a MIT License - veja o arquivo [LICENSE](https://github.com/davide-almeida/crypto_tracker/blob/main/LICENSE.txt) para mais detalhes.

## 🤝 Contribuição
Se você encontrar bugs ou quiser sugerir melhorias, sinta-se à vontade para abrir um Issue ou enviar um Pull Request. 😊