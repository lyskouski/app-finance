[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
Português Brasileiro (PTB) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- aplicativo de contabilidade financeira de plataforma cruzada de código aberto sem anúncios e limitações.
O objetivo da solução é criar um aplicativo de contabilidade financeira que seja intuitivo, eficiente e inclusivo.
Isso permite que os usuários gerenciem suas finanças sem esforço, garantindo que ninguém seja deixado para trás.

[![Assista ao vídeo](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funcionalidade
- Contabilidade (tipo de conta, moeda/criptomoeda)
  - Agrupamento simples por meio do símbolo `/` (no nome) para a página principal
  - Registro de transações
  - Congelamento do valor por data de atualização (para importar o histórico anterior)
- Categorias de orçamento
  - Agrupamento simples via símbolo `/` (no nome) para a página principal
  - Com limites atualizados:
    - Renovado no início de cada mês
    - Limites configuráveis por mês
    - Relativos (0,0 ... 1,0) à renda
  - Ou, sem limitações, mostrando um valor gasto
  - Cronograma diferente: semanal, mensal, anual
  - Dia de início da semana e mês personalizáveis
- Contas, transferências, receitas (faturas)
  - Pagamentos recorrentes (com um widget inicial)
  - Filtragem
  - Premissa/previsão da categoria orçamentária
- Definição de metas
- Taxas de câmbio, moeda padrão para resumo
- Métricas:
  - Orçamento:
    - Previsão (com simulação de Monte Carlo)
    - Limite orçamentário e despesas por mês
  - Conta:
    - Gráfico de velas (OHLC)
    - Radar de saúde da renda
    - Distribuição de moedas
  - Contas:
    - Despesas acumuladas no ano
    - Corrida de barras por categorias
  - Gráfico do indicador de metas
  - Gráfico histórico de moedas
- Sincronização entre dispositivos (P2P)
- Recuperação via WebDav ou um arquivo direto
- Importação de arquivos `CSV`, `QIF`, `OFX` para contas e faturas
- Exportar para arquivo Excel `XLSX`
- Criptografia de dados
- Localização
- Experiência do usuário
  - Página principal configurável (várias configurações por conjunto de “largura x altura”)
  - Design responsivo e adaptável
    - Painel de navegação adaptável (superior, inferior, direita) e guias (superior, esquerda)
  - Modo de tema (escuro, claro, sistema) com definição de paleta (sistema, personalizado, pessoal - seletor de cores)
  - Preservar a última escolha para conta, orçamento e moeda
  - Rolagem automática para o elemento focalizado no formulário
  - Expandir/recolher seções na página principal
  - Passe o dedo para acessar rapidamente as ações de Editar e Excluir
  - Ampliar/reduzir o zoom (de 60% a 200%) por meio de “Settings” (Configurações)
  - Atalhos

| Descrição                           | Atalho                         |
| ----------------------------------- | ------------------------------ |
| Abrir/fechar a gaveta de navegação  | `Shift` + `Enter`              |
| Navegar para cima                   | `para cima`                    |
| Navegar para baixo                  | `para baixo`                   |
| Abrir selecionado                   | `Enter`                        |
| Zoom In                             | `Ctrl` + `+`                   |
| Aumentar o zoom (com o mouse)       | `Ctrl` + `rolar para baixo`    |
| Zoom Out                            | `Ctrl` + `-`                   |
| Zoom Out (com o mouse)              | `Ctrl` + `rolar para cima`     |
| Resetar zoom                        | `Ctrl` + `0`                   |
| Adicionar nova transação            | `Ctrl` + `N`                   |
| Retornar para trás                  | `Ctrl` + `Backspace`           |
<!--
| Editar item selecionado             | `Ctrl` + `E`                   |
| Excluir item selecionado            | `Ctrl` + `D`                   |
-->
