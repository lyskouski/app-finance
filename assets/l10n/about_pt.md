[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Nederlandse (NL)](./about_nl.md) |
[Čeština (CS)](./about_cs.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
[Polski (PL)](./about_pl.md) |
Português Europeu (PT) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- aplicação de contabilidade financeira multiplataforma de código aberto sem anúncios e limitações.
O objetivo da solução é criar uma aplicação de contabilidade financeira que seja intuitiva, eficiente e inclusiva.
Isto permite aos utilizadores gerir as suas finanças sem esforço, garantindo que ninguém é deixado para trás.

[![Ver o vídeo](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funcionalidade
- Contabilidade (tipo de conta, moeda/criptomoeda)
  - Agrupamento simples através do símbolo `/` (no nome) para a página principal
  - Registo de transacções
  - Congelamento do montante por data de atualização (para importar o histórico anterior)
- Categorias de orçamento
  - Agrupamento simples através do símbolo `/` (no nome) para a página principal
  - Com limites renovados:
    - Renovado no início de cada mês
    - Limites configuráveis por mês
    - Relativos (0.0 ... 1.0) ao Rendimento
  - Ou, sem limites, mostrando um montante gasto
  - Horário diferente: semanal, mensal, anual
  - Dia de início da semana e mês personalizável
- Contas, Transferências, Rendimentos (Facturas)
  - Pagamentos recorrentes (com um widget de início)
  - Filtragem
  - Pressuposto/previsão da categoria orçamental
- Definição de objectivos
- Taxas de câmbio, Moeda por defeito para o Resumo
- Métricas:
  - Orçamento:
    - Previsão (com simulação de Monte Carlo)
    - Limite orçamental e despesas por mês
  - Conta:
    - Gráfico de velas (OHLC)
    - Radar de saúde dos rendimentos
    - Distribuição da moeda
  - Contas:
    - Despesas acumuladas
    - Corrida de barras por categorias
  - Gráfico do indicador de objectivos
  - Gráfico histórico da moeda
- Sincronização entre dispositivos (P2P)
- Recuperação via WebDav ou ficheiro direto
- Importação a partir de ficheiros `CSV`, `QIF`, `OFX` para facturas e notas fiscais
- Exportar para ficheiro Excel `XLSX`
- Encriptação de dados
- Localização
- Experiência do utilizador
  - Página principal configurável (múltiplas configurações por conjunto `largura x altura`)
  - Design responsivo e adaptável
    - Painel de navegação adaptável (topo, fundo, direita) e separadores (topo, esquerda)
  - Modo de tema (escuro, claro, sistema) com definição de paleta (sistema, personalizado, pessoal -- seletor de cores)
  - Preservar a última escolha para Conta, Orçamento e Moeda
  - Deslocação automática para o elemento focado no formulário
  - Expandir / Recolher secções na página principal
  - Deslize para um acesso rápido às acções Editar e Eliminar
  - Aumentar/reduzir o zoom (de 60% a 200%) através de “Definições”
  - Atalhos

| Descrição                            | Atalho                         |
| ------------------------------------ | ------------------------------ |
| Abrir / fechar a gaveta de navegação | `Shift` + `Enter`              |
| Navegar para cima                    | `para cima`                    |
| Navegar para baixo                   | `para baixo`                   |
| Abrir selecionado                    | `Enter`                        |
| Zoom In                              | `Ctrl` + `+`                   |
| Aumentar zoom (com o rato)           | `Ctrl` + `deslocar para baixo` |
| Zoom Out                             | `Ctrl` + `-`                   |
| Zoom Out (com o rato)                | `Ctrl` + `deslocar para cima`  |
| Reiniciar o zoom                     | `Ctrl` + `0`                   |
| Adicionar nova transação             | `Ctrl` + `N`                   |
| Voltar para trás                     | `Ctrl` + `Backspace`           |
<!--
| Editar item selecionado              | `Ctrl` + `E`                   |
| Excluir item selecionado             | `Ctrl` + `D`                   |
-->
