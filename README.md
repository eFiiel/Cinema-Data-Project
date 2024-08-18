# Projeto Digital Cinema Booth

## Rastreamento de Leituras de QR Codes em Cinemas

### Descrição do Projeto

Este projeto visa criar uma solução completa para o rastreamento de leituras de QR Codes em cinemas. As câmeras instaladas nas entradas das salas capturam imagens dos ingressos, que são processadas para decodificação dos QR Codes. Os dados são então enviados para a nuvem AWS, onde são armazenados e analisados. A solução fornece insights como:

- Identificação dos clientes que mais consomem a solução.
- Detecção de horários de pico nas operações dos cinemas.
- Identificação de sazonalidade.
- Análise das cidades com as salas mais movimentadas.
- Verificação de fraudes ou QR Codes repetidos.

### Arquitetura da Solução

A solução é baseada em uma arquitetura modular e escalável, utilizando principalmente serviços da AWS, mas com a possibilidade de integrar ferramentas externas para otimizar diferentes aspectos. Abaixo está um esboço inicial com os principais componentes da arquitetura:

#### Visão Geral

![Arquitetura](https://github.com/user-attachments/assets/4276c905-09f0-4d65-87e1-e5e3abbfcfb4)

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

#### Serviços Externos (Opcional)

- **Apache Airflow**: Orquestração de pipelines de dados.
Apesar de a AWS possuir ferramentas de orquestração e ter uma alta capacidade de processamento e autossuficiência com relação a manipulação de dados, a utilização de um orquestrador com o Apache Airflow pode trazer mais flexibilidade e possibilitar a implementação de rotinas mais complexas, principalmente levando em consideração aplicações futuras relacionadas aos padrões de fraude encontrados ou até mesmo para processamentos mais específicos e complexos que os dados possam requerer.
- **Tableau/Power BI/Metabase**: Alternativas para visualização de dados.
