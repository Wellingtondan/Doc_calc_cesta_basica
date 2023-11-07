# Conferência Calc Cesta Básica

## Módulo Fiscal

**ICMS Calculado – Impacto no Módulo Fiscal (Thiago)**

Utilizado para quando a Nota Fiscal de entrada/saída tem alíquota diferente da alíquota aplicada (efetiva) para o cálculo do crédito/débito de ICMS e para que a escrituração no livro fiscal seja de acordo com as regras legais quanto a permissão deste crédito/débito, como por exemplo nas aquisições de carnes por empresas optantes pelo Regime Especial de Carnes - SP (Decreto 62.647/2017) ou por aquisições interestaduais de produtos/mercadorias que contemplam os itens da cesta básica com redução na base de cálculo, conforme RICMS de cada UF. Além das tratativas na Tributação por UF, para que a Nota Fiscal integre no livro fiscal com a alíquota efetiva (redução na Base de Cálculo – Cesta Básica) ou sem o crédito de ICMS (aquisições de carnes no Estado de SP), o parâmetro ICMS Calculado deverá estar marcado.

### 1.Parâmetros

> Caminho: *Módulo Fiscal - Configuração - Parâmetros - Empresa - aba Registro Fiscal.*

> ***Exemplo 2 – Aquisição interestadual de produtos/mercadorias de cesta básica – Utilização Tipo Calc. 1***

O Anexo II (Reduções de Base de Cálculo), Artigo 3º do RICMS-SP traz os itens que estão comtemplados como Cesta Básica para o Estado de SP onde a carga tributária resultante da redução é a correspondente ao percentual de 7% (sete por cento). Para melhor visualização, verifique o anexo compartilhado pelo Thiago (ICMS_Calculado_Fiscal).

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/e854a5ca-56f4-4c21-8559-8403eda7c2d7)

`Exemplo (Nota fiscal)`

|***Produto***  |***Cortes Resfriados Frango*** | 
| ----------| --------------|
| Valor do produto | R$ 1.700,14 |
| Base de Cálculo ICMS | R$ 1.700,14 |
| Valor ICMS (Base de Cálculo ICMS x alíquota efetiva (12%)) | R$ 204,02 |
| Alíquota ICMS | 12% |
| CST (Situação tributária NF) | 000 |

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/a3c09bc2-c5ce-4e03-83ff-cba18b6cbaf5)

As entradas de mercadorias de operações interestaduais com alíquota de 12%, será vendida com alíquota de 7% na operação interna. Dessa forma, não será tomado crédito maior (12%) do que o débito (7%), visto que a carga tributária é menor. Na consulta de notas fiscais abaixo, detalha como será realizada a apropriação do ICMS Calc no valor de ICMS.

### 2.Consulta de Notas Fiscais

Aqui nesse caminho é apenas para identificar como são lançados os dados parametrizados para o ICMS Calc. Quando cliente opta para Emissão Livros “ICMS Calculado”, os dados sobem corretamente com os cálculos devidos.

Mas segue as observações que precisam estar configuradas quando for utilizadas para os produtos de Cesta básica:

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/2f951fd7-621f-4f9d-a9ce-d3ab7d74be45)

Note que a alíquota considerada para o ICMS é de 7%, o qual o valor de ICMS anterior de 204,02 equivalente a 12%, esta resultando a 119,01 com a carga tributária para 7%, conforme ICMS calculado.

### 3.Registro de Entradas (Livro)

É verificado o valor da operação (Total da entrada), Alíquota de 7% que é resultante da redução de Cesta, Imposto Creditado (valor de ICMS) e também o “COD” que para esse caso é o 1 (Operações com crédito de Imposto).

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/6bcaf707-d170-41af-ba06-91c295af5520)

**Observação:** Parâmetro ICMS Calculado no Módulo Fiscal atende aos outros tipos de Tipo Calc. tratados na Tributação por UF e não somente a estes dois, dados como exemplo.

## Grade de tributação por UF

### 1.TRIBUTAÇÃO POR UF

Conforme exemplo no Módulo Fiscal  a CST destacada em nota, estava considerando a “000” que representa a aba “Situação Tributária NF”. Para esse caso há aproveitamento de crédito para os itens contemplados como Cesta Básica para o Estado de SP, a CST considerada na Grade UF é a destacada em nota a “000”, como na imagem abaixo:

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/359fdba0-5bd2-4df5-ac04-7301e09b9fb1)

Nesse caso não é necessário parametrizar a “Situação tributária NF de ICMS Calculado”, pois é utilizada para informar nas entradas de mercadorias de carne quando não é tomado crédito na entrada o lançamento deve ser considerado como “Outras” no Livro Registro de Entradas com a CST x90.

> Tipo Calc.ICMS *(Observação: 01 - Termo Acordo ICMS Calculado)*

Utilizado para quando a nota fiscal de entrada/saída tem alíquota de ICMS diferente da alíquota aplicada no cálculo do crédito/débito do ICMS.

> ![image](https://github.com/Wellingtondan/Doc_calc_cesta_basica/assets/119419112/cd742bdf-83bf-4c39-a4fd-70aa54cec574)

`Exemplo do cálculo sistema:`

|***Descrição***  |***Valor*** | 
| ----------| --------------| 
| Alíquota do Fornecedor |  12% | 
| Alíquota do Acordo |  7% | 
| Nota 100 - Valor da mercadoria | R$ 100,00 | 
| ICMS da operação: R$ 100,00 x 12% |  R$ 12,00 | 
| ICMS calculado conforme acordo R$ 100,00 x 7% | R$ 7,00 | 

`No custo do produto e na apuração de ICMS será considerado o valor de R$ 7,00 e não R$ 12,00.`


`-- ICMS Calc (ICMS Calculado)` - Precisa estar configurado no módulo Fiscal na aba Registro Fiscal em “Emissão Livros” como ICMS calculado para que o lançamento no livro seja informado o crédito de 7% corretamente sem a necessidade de estorno do ICMS. No custo do produto e na apuração de ICMS será considerado o calculo referente a 7%.

`-- ICMS Calc (ICMS Normal)` - Para esse caso quando o módulo Fiscal estiver no parâmetro na aba Registro Fiscal em “Emissão Livros” como ICMS Normal, precisa ser realizado o estorno do ICMS, para que o valor na saída seja considerado 7%, como o sistema não realiza o cálculo automático para as saídas dos produtos como Cesta básica, no custo do produto e na apuração de ICMS será considerado o cálculo referente a 12%, por isso, cabe realizar o estorno para que o custo do produto fique corrigido para 7%. Essa operação é/ou(era) realizada no sistema C5 anterior no qual existem alguns clientes mais antigos que se utilizam desse modelo, já para as novas implantações TOTVS a “Emissão Livros” é realizada pelo ICMS calculado.

## Scripts

- Calc para tributações ST com redução de 18% para 7%.
- Calc para tributações ST com redução de 12% para 7%.
- Calc para tributações Tributadas com alíquota interestadual de 12%, mas com Calc de 7%, para que possa ser utilizado na saída do livro fiscal.
- Calc para tributações de carne, aplicado zero para não tomar crédito na saída.

> [Conferência Calc Trib.tribut_7](https://github.com/Wellingtondan/Doc_calc_cesta_basica/blob/main/6.3%20Confer%C3%AAncia%20Trib_Tribut_Calc_Cesta_7.sql)


> [Conferência Calc Trib.st_12](https://github.com/Wellingtondan/Doc_calc_cesta_basica/blob/main/6.1%20Confer%C3%AAncia%20Trib_red_Calc_Cesta_12.sql)


> [Conferência Calc Trib.st_18](https://github.com/Wellingtondan/Doc_calc_cesta_basica/blob/main/6.2%20Confer%C3%AAncia%20Trib_red_Calc_Cesta_18.sql)

## Considerações

As informações contidas neste documento são baseadas nos materiais compartilhados pelo coordenador Thiago, referentes ao `"Módulo Fiscal"`. Para as questões relacionadas à `"Grade UF"`, recebi material compartilhado por Mariana e orientações adicionais da Analista Bruna.
