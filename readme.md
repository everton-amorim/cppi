Criar a base:

\. database\pirates_SQL.sql

Dados de 2015
\. 2015-data.sql

iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 3000 -j ACCEPT
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3000

Dados de 2016
\. dump2016.sql


-- Fazer dump no mysql
mysqldump pirates -u root -p  > dump.sql

--conectar ao server
ssh -i ~/Downloads/cppi.pem ec2-user@54.69.101.108

-- Download de arquivos do servidor
scp -i ~/Downloads/cppi.pem ec2-user@54.69.101.108:~/dump.sql .


O que falta fazer:

Sorteio da prova de pesca Manual
    - Criar uma tela para parametrizar a ordem das raias
    - Gerar as etiquetas dos atletas x número do atleta
    - Gerar as etiquetas da pesca.
    - Gerar etiquetas do lançamento.
    - Sorteio aleatorio dos restantes das raias (lançamento e pesca)
    
Planilhas para preenchimento
    - Planilha para preenchimento dos dados de lançamento (faltou as linhas impressas!)
    - Planilha para preechimento dos dados das pescas (foi impresso o HTML aí fica sem cabeçalho, mas fora isto está bom!)

Planilhas de conferência:
    - Raias da 1a etapa (melhorar a existente)
    - Listagem de atletas (igual a lista do sorteio!)
    - Listagem da classificação de cada modalidade - lançamento, pesca variada, pesca específica, e total.
    - Cabeçalhos com nome da prova, ano e logo piratas.
    - Sistema de acesso, deixar liberado só as listagens finais.

Finalizar
    - Planilha de resultados finais mais fancy (tabela editável: https://editor.datatables.net/examples/styling/bootstrap)
    - Geração do Relatório do Ministério
    
Sonhos
    - Leitura das planilhas via OCR
    - Compartilhamento direto para o facebook
    

SQL do total de peixes:
    SELECT SUM(total_pecas_variada + total_pecas_especifica) TOTAL_PECAS
         , SUM(peso_total_variada + peso_total_especifica) TOTAL_PESO
         FROM Participantes;
