-- TRIBUTAÇÕES RED.NA ST (CESTA BÁSICA/ COM ALÍQUOTA INTERNA DE 12%) - CALC


SELECT 
    MAX(a.NROTRIBUTACAO) AS NROTRIBUTACAO, -- ou MIN(a.nrotributacao)
    c.UFCLIENTEFORNEC,
    SUBSTRING_INDEX(SUBSTRING_INDEX(TRIBUTACAO, 'NCM ', -1), ' CEST', 1) AS NCM_Code,
    SUBSTRING_INDEX(SUBSTRING_INDEX(TRIBUTACAO, ' CEST ', -1), ' ', 1) AS CEST,
    a.TRIBUTACAO, 
    a.DESCAPLICACAO,
    b.DESCRICAO,
    b.COD_SEGMENTO,
    b.SEGMENTO,  
    c.PERTRIBUTADO, 
    c.PERISENTO, 
    c.PEROUTRO,
    c.PERALIQUOTA,
    c.PERACRESCST,
    c.PERALIQUOTAST,
    c.PERTRIBUTST,
    c.PERTRIBUTADOCALC, 
    c.PERISENTOCALC, 
    c.PEROUTROCALC, 
    c.PERALIQICMSCALCPRECO,
    c.INDREDUZBASEST,
    
    CASE 
        WHEN c.INDREDUZBASEST = 'N' THEN 'Não reduz'
        WHEN c.INDREDUZBASEST = 'S' THEN 'Reduz base'
        ELSE c.INDREDUZBASEST
    END AS 'REDUZ_CALC_ST',
	     c.TIPCALCICMSSELO,
    
    CASE 
        WHEN c.TIPCALCICMSSELO = 'C' THEN 'Reduz ICMS calculado'
        WHEN c.TIPCALCICMSSELO = 'P' THEN 'Reduz ICMS Próprio'
        ELSE c.TIPCALCICMSSELO
    END AS 'ALIQ_BASE_ICMS_CALC_ST',
             c.TIPREDUCICMSCALCST,	
    
    CASE 
        WHEN c.TIPREDUCICMSCALCST = 'S' THEN '% Tributado ST'
        WHEN c.TIPREDUCICMSCALCST = 'T' THEN '% Tributado'
        ELSE c.TIPREDUCICMSCALCST
    END AS 'REDUZ_BASE_ICMS_CALC_ST'
    
FROM
    db_trib_rev.tb_capas_fonseca_sp a
INNER JOIN db_trib_rev.tb_convenio_atual b ON SUBSTRING_INDEX(SUBSTRING_INDEX(TRIBUTACAO, ' CEST ', -1), ' ', 1) = b.CODCEST
INNER JOIN db_trib_rev.tb_grade_fonseca_sp c ON a.nrotributacao = c.nrotributacao
WHERE c.tiptributacao = 'EI' -- Entrada Indústria
AND c.PERALIQICMSCALCPRECO is NOT NULL
AND c.PERTRIBUTST BETWEEN 58.33 AND 99
GROUP BY 
    c.UFCLIENTEFORNEC,
    a.TRIBUTACAO, 
    a.DESCAPLICACAO,
    b.DESCRICAO,
    b.COD_SEGMENTO,
    b.SEGMENTO,  
    c.PERTRIBUTADO, 
    c.PERISENTO, 
    c.PEROUTRO,
    c.PERALIQUOTA,
    c.PERACRESCST,
    c.PERALIQUOTAST,
    c.PERTRIBUTST,
    c.PERTRIBUTADOCALC, 
    c.PERISENTOCALC, 
    c.PEROUTROCALC, 
    c.PERALIQICMSCALCPRECO,
    c.INDREDUZBASEST,
    c.TIPCALCICMSSELO,
    c.TIPREDUCICMSCALCST
ORDER BY 1, 2;
