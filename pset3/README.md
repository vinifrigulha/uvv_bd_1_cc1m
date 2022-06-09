# PSet 3
## Query Hierárquica (Recursiva) - PostgreSQL

### Aluno: Vinícius Frigulha Ribeiro
### Professor: Abrantes Araújo Silva Filho
### Monitora: Suellen Miranda Amorim

##

### Introdução:

Este PSet teve o objetivo de recuperar os dados da tabela deste [script](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset3/pset3.sql "Script da Tabela 'classificacoes'") de forma que os itens estejam apresentados de forma hierárquica - Recursive Queries (Pai >>> Filho >>> Neto >>> ...).

Para utilizar esse script, foi necessário incluí-lo neste [outro](https://github.com/vinifrigulha/uvv_bd_1_cc1m/blob/main/pset1/script_elmasri_corrigido_psql.sql "Script PSQL Elmasri"), que é o script do Projeto do Elmasri (do PSet 1), logo utilizei o terminal do Linux para executar os comandos.

Também tive a ideia de classificar os níveis da hierarquia: Pai - nível 0; Filho - nível 1; Neto - nível 2; e assim por diante.

##

### Código:

~~~SQL
WITH RECURSIVE Pai_Filho AS (
SELECT 	codigo
,	nome
,	codigo_pai
,	0 AS nível
,	CAST(nome AS TEXT) AS hierarquia
FROM classificacao
WHERE codigo_pai IS NULL 

UNION ALL

SELECT 	c.codigo
,	pf.nome
,	c.codigo_pai
,	pf.nível + 1 AS nível
,	CAST(pf.hierarquia || ' >>> ' || c.nome AS TEXT) AS hierarquia
FROM classificacao c
INNER JOIN Pai_Filho pf ON c.codigo_pai = pf.codigo)
SELECT 	nível AS "Nível"
,	hierarquia AS "Hierarquia"
,	codigo_pai AS "Código do Pai"
FROM Pai_Filho
ORDER BY hierarquia;
~~~

##

### Resultado:

| Nível |                                       Hierarquia                                       | Código do Pai |
|-------|----------------------------------------------------------------------------------------|---------------|
|     0 | Enteral                                                                                |               |
|     1 | Enteral >>> A Classificar Enteral                                                      |          1    |
|     2 | Enteral >>> A Classificar Enteral >>> A Classificar Enteral                            |         94    |
|     1 | Enteral >>> Complementos em Pó                                                         |          1    |
|     2 | Enteral >>> Complementos em Pó >>> Complemento em Pó Padrão                            |         57    |
|     1 | Enteral >>> Complementos Líquidos                                                      |          1    |
|     2 | Enteral >>> Complementos Líquidos >>> Complemento Líquido Padrão                       |         56    |
|     1 | Enteral >>> Descartáveis/Material Auxiliar                                             |          1    |
|     2 | Enteral >>> Descartáveis/Material Auxiliar >>> Equipo                                  |          2    |
|     2 | Enteral >>> Descartáveis/Material Auxiliar >>> Material Auxiliar                       |          2    |
|     2 | Enteral >>> Descartáveis/Material Auxiliar >>> Sonda                                   |          2    |
|     1 | Enteral >>> Dietas em Pó                                                               |          1    |
|     2 | Enteral >>> Dietas em Pó >>> Dieta Enteral/Oral Especializa                            |          6    |
|     2 | Enteral >>> Dietas em Pó >>> Dieta Enteral/Oral Padrão                                 |          6    |
|     2 | Enteral >>> Dietas em Pó >>> Dieta Enteral/Oral Pediátrica                             |          6    |
|     1 | Enteral >>> Dietas Líquidas                                                            |          1    |
|     2 | Enteral >>> Dietas Líquidas >>> Especializada                                          |         10    |
|     2 | Enteral >>> Dietas Líquidas >>> Padrão                                                 |         10    |
|     2 | Enteral >>> Dietas Líquidas >>> Pediátrica                                             |         10    |
|     1 | Enteral >>> Módulos                                                                    |          1    |
|     2 | Enteral >>> Módulos >>> Módulos De Fibra                                               |         14    |
|     2 | Enteral >>> Módulos >>> Módulos Espessantes                                            |         14    |
|     2 | Enteral >>> Módulos >>> Módulos Protéicos                                              |         14    |
|     2 | Enteral >>> Módulos >>> Módulos Sacarídeos                                             |         14    |
|     2 | Enteral >>> Módulos >>> Módulos Vitamínicos                                            |         14    |
|     1 | Enteral >>> Suplementos                                                                |          1    |
|     2 | Enteral >>> Suplementos >>> Suplementos Cremosos                                       |         99    |
|     3 | Enteral >>> Suplementos >>> Suplementos Cremosos >>> Suplemento Cremoso Padrão         |         19    |
|     2 | Enteral >>> Suplementos >>> Suplementos Líquidos                                       |         99    |
|     3 | Enteral >>> Suplementos >>> Suplementos Líquidos >>> Suplemento Liquido Padrão         |         21    |
|     3 | Enteral >>> Suplementos >>> Suplementos Líquidos >>> Suplemento Líquido Pediátrico     |         21    |
|     3 | Enteral >>> Suplementos >>> Suplementos Líquidos >>> Suplementos Liquido Especializado |         21    |
|     2 | Enteral >>> Suplementos >>> Suplementos Pó                                             |         99    |
|     3 | Enteral >>> Suplementos >>> Suplementos Pó >>> Suplemento Pó Padrão                    |         25    |
|     0 | Frete                                                                                  |               |
|     1 | Frete >>> Servicos de Frete                                                            |         50    |
|     2 | Frete >>> Servicos de Frete >>> Frete em Geral                                         |         51    |
|     0 | Parenteral                                                                             |               |
|     1 | Parenteral >>> A Classificar Parenteral                                                |         27    |
|     2 | Parenteral >>> A Classificar Parenteral >>> A Classificar Parenteral                   |         96    |
|     1 | Parenteral >>> Descartáveis/Material da Produção                                       |         27    |
|     2 | Parenteral >>> Descartáveis/Material da Produção >>> Bolsas                            |         28    |
|     2 | Parenteral >>> Descartáveis/Material da Produção >>> Equipos da Produção               |         28    |
|     2 | Parenteral >>> Descartáveis/Material da Produção >>> Material Produção                 |         28    |
|     2 | Parenteral >>> Descartáveis/Material da Produção >>> Ribbon e Etiquetas                |         28    |
|     1 | Parenteral >>> Insumos                                                                 |         27    |
|     2 | Parenteral >>> Insumos >>> Água para Injeção                                           |         32    |
|     2 | Parenteral >>> Insumos >>> Aminoácidos                                                 |         32    |
|     2 | Parenteral >>> Insumos >>> Eletrólitos                                                 |         32    |
|     2 | Parenteral >>> Insumos >>> Glicoses                                                    |         32    |
|     2 | Parenteral >>> Insumos >>> Lipídios                                                    |         32    |
|     2 | Parenteral >>> Insumos >>> Oligoelementos                                              |         32    |
|     2 | Parenteral >>> Insumos >>> Soluções Fisiológicas                                       |         32    |
|     2 | Parenteral >>> Insumos >>> Vitaminas                                                   |         32    |
|     1 | Parenteral >>> Limpeza e Higienização                                                  |         27    |
|     2 | Parenteral >>> Limpeza e Higienização >>> Coletores                                    |         71    |
|     2 | Parenteral >>> Limpeza e Higienização >>> Saneantes/Desinfetantes Diversos             |         71    |
|     1 | Parenteral >>> Material de Transporte                                                  |         27    |
|     2 | Parenteral >>> Material de Transporte >>> Caixas/Sacos/etc. para Transporte            |         77    |
|     2 | Parenteral >>> Material de Transporte >>> Manutenção de Temperatura                    |         77    |
|     1 | Parenteral >>> Outros                                                                  |         27    |
|     2 | Parenteral >>> Outros >>> Outros Materiais                                             |         84    |
|     0 | Patrimônio                                                                             |               |
|     1 | Patrimônio >>> Bens Imóveis                                                            |         63    |
|     2 | Patrimônio >>> Bens Imóveis >>> Outros Bens Imóveis                                    |         87    |
|     1 | Patrimônio >>> Bens Móveis                                                             |         63    |
|     2 | Patrimônio >>> Bens Móveis >>> Automóveis em Geral                                     |         64    |
|     2 | Patrimônio >>> Bens Móveis >>> Eletrodomésticos                                        |         64    |
|     2 | Patrimônio >>> Bens Móveis >>> Máquinas e Equipamentos                                 |         64    |
|     2 | Patrimônio >>> Bens Móveis >>> Material de Informática em Geral                        |         64    |
|     0 | Produtos Hospitalres                                                                   |               |
|     1 | Produtos Hospitalres >>> Materiais Especiais de Cosumo                                 |         92    |
|     0 | Uso e Consumo                                                                          |               |
|     1 | Uso e Consumo >>> Em Geral                                                             |         47    |
|     2 | Uso e Consumo >>> Em Geral >>> Impressos em Geral                                      |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Infraestrutura e Manutenção                             |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Livros/Guias/Referências                                |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Material de Copa e Cozinha                              |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Material de Expediente/Escritório                       |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Material de Informática                                 |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Material de Limpeza e Higiene                           |         48    |
|     2 | Uso e Consumo >>> Em Geral >>> Uniformes/Roupas/Outros                                 |         48    |
|     1 | Uso e Consumo >>> Utilidades                                                           |         47    |
|     2 | Uso e Consumo >>> Utilidades >>> Energia Elétrica                                      |         79    |
|     2 | Uso e Consumo >>> Utilidades >>> Internet                                              |         79    |
|     2 | Uso e Consumo >>> Utilidades >>> Telefonia                                             |         79    |
|     0 | Vendas Parenterais                                                                     |               |
|     1 | Vendas Parenterais >>> Adultos                                                         |         43    |
|     1 | Vendas Parenterais >>> Bolsas/Kit                                                      |         43    |
|     2 | Vendas Parenterais >>> Bolsas/Kit >>> Adulto                                           |         66    |
|     2 | Vendas Parenterais >>> Bolsas/Kit >>> Infantil                                         |         66    |
|     2 | Vendas Parenterais >>> Bolsas/Kit >>> Veterinária                                      |         66    |
|     1 | Vendas Parenterais >>> Infantil                                                        |         43    |
|     1 | Vendas Parenterais >>> Veterinária                                                     |         43    |

##

### Considerações Finais:

Foi uma tarefa interessante, uma vez que tive que usar comandos novos como o WITH RECURSIVE para criar uma tabela momentaneamente e a função CAST( ) para definir determinado dado no formato texto (com o uso do AS TEXT).

Aprecio a dedicação do Professor Abrantes por criar tais Problems Sets para que nós, alunos, possamos explorar ao máximo os comandos SQL.
