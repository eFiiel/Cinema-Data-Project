# Projeto Digital Cinema Booth

## Rastreamento de Leituras de QR Codes em Cinemas

### Descrição do Projeto

Este projeto visa criar uma solução completa para o rastreamento de leituras de QR Codes em cinemas. As câmeras instaladas nas entradas das salas capturam imagens dos ingressos, que são processadas para decodificação dos QR Codes. Os dados são então enviados para a nuvem AWS, onde são armazenados e analisados. A solução fornece insights como:

1. **Clientes que mais consomem a solução**  
   A partir das leituras de QR Codes processadas, a solução conta quantas vezes cada cliente (cinema) envia dados para o sistema. Esse volume é armazenado no Redshift e pode ser visualizado em relatórios no QuickSight.

2. **Horários de pico nas operações das salas de cinema**  
   As leituras são registradas com timestamps que permitem analisar o volume de operação por hora e dia. Com o Glue, os dados são processados e armazenados no Redshift, onde gráficos no QuickSight mostram picos de atividade.

3. **Sazonalidade na operação**  
   Com séries temporais baseadas em dados históricos processados pelo Glue e armazenados no Redshift, a solução identifica padrões sazonais. Relatórios no QuickSight ou análises no SageMaker ajudam a visualizar esses ciclos.

4. **Cidades com as salas mais movimentadas**  
   Associando as leituras a informações de localização dos clientes, a solução usa o Redshift para agrupar os dados por cidade e gerar visualizações geográficas no QuickSight.

5. **Detecção de fraudes com QR Codes repetidos**  
   Os dados são armazenados no RDS e Redshift para detecção de padrões suspeitos e alertas, que podem ser encontrados utilizando modelos de machine learning no Sagemaker ou com consultas realizadas no Redshift. Essas análises históricas podem auxiliar na prevenção dessas fraudes. Utilizando o Kinesis para processar eventos em tempo real, a solução pode verificar a existência de leituras duplicadas ou em locais e horários diferentes e notificar ou realizar outras ações que podem ser definidas pelo cliente.


### Arquitetura da Solução

A solução é baseada em uma arquitetura modular e escalável, utilizando principalmente serviços da AWS, mas com a possibilidade de integrar ferramentas externas para otimizar diferentes aspectos. Abaixo está um esboço inicial com os principais componentes da arquitetura:

#### Visão Geral

![Arquitetura](https://github.com/user-attachments/assets/2d664f1d-360e-4b72-86b8-58a045b065f3)

#### Tecnologias Utilizadas

- **AWS Lambda**
- **Amazon S3**
- **Amazon Kinesis Data Streams**
- **Amazon DynamoDB**
- **Amazon RDS**
- **Amazon Redshift**
- **AWS Glue**
- **Amazon QuickSight**
- **Amazon Athena**
- **Amazon SageMaker**
- **Amazon EMR**

#### Serviços Externos (Opcionais)

- **Apache Airflow**: Orquestração de pipelines de dados.
  
Apesar de a AWS possuir ferramentas de orquestração e ter uma alta capacidade de processamento e autossuficiência com relação a manipulação de dados, a utilização de um orquestrador com o Apache Airflow pode trazer mais flexibilidade e possibilitar a implementação de rotinas mais complexas, principalmente levando em consideração aplicações futuras relacionadas aos padrões de fraude encontrados ou até mesmo para processamentos mais específicos e complexos que os dados possam requerer.
- **Tableau/Power BI/Metabase/Apache Superset**: Alternativas para visualização de dados.

O Amazon QuickSight é uma ferramenta bem completa, porém existem outras ferramentas proprietárias que ocupam o topo do mercado, como Power BI e Tableau, as quais, dependendo da demanda, também são opções a serem utilizadas na construção de dashboards e relatórios. Além destas, também existem opções open source que podem atender às necessidades de visualização existentes para este projeto, como Metabase e Apache Superset, ferramentas de visualização bem completas, que podem ser hospedadas dentro da infraestrutura da AWS e se conectam facilmente a inúmeros bancos de dados. Essas ferramentas possuem uma alta variedade de customizações que podem atender às necessidades do projeto com um baixo custo.

### Consideraçãoes Finais

Levando em consideração a ideia de arquitetura proposta, foi desenvolvido um esboço da configuração do ambiente com terraform e gerado uma estimativa de custo aproximada que se encontra neste [link](https://calculator.aws/#/estimate?id=daf173301fa379469b649405918284e259860691).

Diversos aspectos da estimativa foram empíricamente definidos, podendo variar a depender do volume de clientes e também da infraestrutura já existente.

Os arquivos de terraform foram validados, mas não aplicados, podendo haver detalhes passíveis de correção.

Grato pela oportunidade.
