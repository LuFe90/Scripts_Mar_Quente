SELECT 
        A.ID AS IMG_ID
        ,C.COD_FILIAL AS IMG_FILIAL
		,A.PRODUTO AS IMG_PRODUTO
        ,A.SEQUENCIA_IMAGEM AS IMG_SEQUENCIA
        ,A.NOME_IMAGEM AS IMG_IMAGEM
FROM MQ_INTEGRACAO_ECATALOGOS_LOJA_IMAGENS AS A
INNER JOIN MQ_INTEGRACAO_eCATALOGOS_LOJAS_PRODUTOS AS B
    ON A.PRODUTO = B.PRODUTO
INNER JOIN FILIAIS AS C
    ON B.COD_FILIAL = C.COD_FILIAL
WHERE C.COD_FILIAL = '000003'
ORDER BY A.PRODUTO, A.NOME_IMAGEM,
        A.SEQUENCIA_IMAGEM

--SELECT * FROM MQ_INTEGRACAO_ECATALOGOS_LOJA_IMAGENS

--SELECT * FROM MQ_INTEGRACAO_eCATALOGOS_LOJAS_PRODUTOS
