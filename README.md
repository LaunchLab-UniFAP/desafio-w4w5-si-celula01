# 🚀 LaunchLab UniFAP — Semanas 4 e 5 (Unificadas)
## 🏢 Persistência de Dados, Transparência e Auditoria Pública

Este é um repositório corporativo e pedagógico de alto desempenho. 
A sua célula deve seguir rigorosamente as diretrizes contidas neste documento para validar as competências e conquistar a certificação do bloco de recuperação de cronograma.

---

## 🛠️ 1. Instruções Iniciais de Configuração (Proibido dar FORK)

O ecossistema do LaunchLab simula o ambiente de engenharia de software do mercado real. Por questões de governança de TI e compliance corporativo, o fluxo de clonagem do projeto deve seguir regras estritas:

1. **NÃO DEIXE UM FORK:** É terminantemente proibido utilizar o botão *Fork* do GitHub neste repositório. O fork vincula seu código publicamente ao perfil do professor, quebrando o isolamento das Squads.
2. **USE O TEMPLATE:** O integrante líder da célula deve clicar exclusivamente no botão verde **"Use this template"** ➔ **"Create a new repository"**.
3. **ALTERE O OWNER:** Na tela de criação do novo repositório, mude obrigatoriamente o campo **Owner** (Dono) do seu perfil pessoal para a organização oficial do programa: `launchlab-unifap-2026`.
4. **NOMENCLATURA PADRÃO:** Nomeie o repositório utilizando estritamente a tag da sua bancada:
   * Para ADS: `desafio-w4w5-ads-celula[NUMERO]`
   * Para SI: `desafio-w4w5-si-celula[NUMERO]`
5. **CONVITE AO PARCEIRO E MONITOR:** Vá em *Settings ➔ Collaborators ➔ Add people* e convide o outro membro da sua dupla e o usuário do GitHub do seu Aluno Embaixador.

---

## 👥 2. Matriz de Papéis e Responsabilidades na Célula

As células operam como equipes autônomas focadas na identidade e no orgulho de cada curso. Ninguém trabalha isolado.

### 💼 O Papel do Desenvolvedor de SI (Arquitetura e Controle)
* **Missão:** Desenvolver a arquitetura estrutural de dados, governança de TI e segurança de acesso do projeto fiscal (`src/arquitetura_si.sql`).
* **Responsabilidade:** Implementar comandos DDL estruturados com chaves primárias e estrangeiras, configurar os níveis de permissão e perfis de acesso a dados públicos via comandos DCL (`GRANT`/`REVOKE`) e redigir a seção de compliance legal da LAI.

### 🚀 O Papel do Desenvolvedor de ADS (Manipulação e Otimização)
* **Missão:** Construir o motor de dados, realizar a carga em lote e desenvolver as consultas analíticas de cruzamento de dados (`src/manipulacao_ads.sql`).
* **Responsabilidade:** Implementar scripts DML estáveis para simulação de carga, tratar entradas nulas em campos monetários críticos e construir queries estruturadas (DQL) com junções e agrupamentos estatísticos para a Controladoria-Geral.

### 🛡️ O Papel do Aluno Embaixador
* **Missão:** Atuar como Líder Técnico (*Tech Lead*) e monitor preventivo de ritmo ao longo das duas semanas.
* **Responsabilidade:** Auditar os gráficos de commits, remover impedimentos de script e responder às *Issues* abertas pelas células utilizando exclusivamente o método socrático (fazer pensar, sem dar respostas ou queries prontas).

---

## ⚠️ 3. Compliance e Uso de Inteligência Artificial (IA)

O uso de ferramentas de IA (como ChatGPT, GitHub Copilot ou Claude) no LaunchLab UniFAP é regulado por normas estritas de ética profissional:

* 🟢 **O que é PERMITIDO (Uso como Assistente):** Utilizar a IA para explicar mensagens de erro de sintaxe retornadas pelo console do banco de dados, sugerir conceitos de álgebra relacional ou auxiliar na formatação deste arquivo.
* 🔴 **O que é PROIBIDO (Sujeito a Retenção de Medalha - ND):** Gerar o script SQL por completo via prompts, copiar e colar blocos inteiros de DDL/DQL sem compreender as amarras de integridade referencial, ou utilizar robôs para redigir as análises textuais do relatório.
* **A Auditoria Docente:** O professor e os embaixadores realizam inspeções e arguições orais surpresa. Se um aluno for questionado em sala e não souber explicar as chaves relacionais ou as permissões de acesso assinadas por ele, a competência será marcada imediatamente como **Não Desenvolvida (ND)** para toda a célula.

---

## 📑 4. Relatório de Entrega da Célula (Preenchimento Obrigatório)

*Instrução: Edite as seções abaixo preenchendo as evidências críticas da dupla até o fim do ciclo unificado.*

### 📂 Identificação da Squad
* **Curso Dominante:** Sistemas de Informação
* **Membro 1 (Nome & GitHub):** @Chroanz - Hans Christian Oliveira de Alencar
* **Membro 2 (Nome & GitHub):** @caiotomaza - Caio Tomaz Araújo Silva
* **Aluno Embaixador Vinculado:** @luisz19 - Luis Henrique Sanches Alencar

### 🌍 Seção de Análise Crítica (Formação Geral ENADE)
> *Com base no cenário proposto no briefing e na carga conceitual do AVA sobre a Lei de Acesso à Informação (LAI), descreva como a persistência de dados estruturados e normalizados atua diretamente no combate à corrupção e viabiliza o controle social pela sociedade civil. Por que relatórios de dados previamente agregados ou mascarados ferem os preceitos da transparência democrática?*
> 💬 **RESPOSTA DA CÉLULA:** A persistência de dados estruturados e normalizados permite organizar as informações públicas de forma clara, evitando dados duplicados, incompletos ou sem relação. Com isso, é possível acompanhar a origem das verbas, identificar quem recebeu o dinheiro e verificar como ele foi gasto. Isso ajuda no combate à corrupção e permite que a sociedade fiscalize o uso dos recursos públicos. Relatórios muito resumidos ou com informações escondidas dificultam essa fiscalização, pois não mostram os dados necessários para encontrar erros ou gastos suspeitos. Dessa forma, eles ferem a transparência defendida pela LAI e limitam o controle da população sobre o governo.

### 💻 Seção de Engenharia e Governança de TI
> *Justifique a decisão de arquitetura técnica adotada pela célula nesta entrega. SI: Como os comandos DCL implementados blindam a base contra sabotagens e vazamentos internos? ADS: De que forma o uso de chaves estrangeiras (`FOREIGN KEY`) e a tipagem exata impedem a ocorrência de dados órfãos e inconsistências financeiras nos relatórios gerados?*
💬 **RESPOSTA DA CÉLULA:** Fazer com que os dados sejam auditáveis está diretamente alinhado com a LAI, trazendo transparência para a população a respeito das informações públicas. Ao não permitir que os dados sejam fisicamente deletados é permitido que seja possível auditar e manter registros de inserções e atualizações erradas, além de preservar a integridade e disponibilidade de dados. Com um controle de permissões é possível garantir que apenas pessoas autorizadas possam realizar comandos de escrita, garantindo integridade de dados.

### 🛠️ Diário de Bordo da Bancada
* **Maior travamento técnico de banco de dados superado pela dupla durante o bloco unificado:** Não houve travamento técnico.
* **Como a intervenção ou a Issue aberta para o Embaixador ajudou a dupla a compreender os conceitos de integridade relacional:** [Relate aqui]

---
*⚠️ Lembrete de Fechamento: Garanta que todo o projeto esteja commitado na branch principal ('main') e responda ao Micro Simulado individual no AVA antes do prazo limite.*
