SELECT A.PRODUTO,
        C.COD_FILIAL,
        A.NOME_IMAGEM,
        A.SEQUENCIA_IMAGEM,
        A.ID
FROM MQ_INTEGRACAO_ECATALOGOS_LOJA_IMAGENS AS A
INNER JOIN MQ_INTEGRACAO_eCATALOGOS_LOJAS_PRODUTOS AS B
    ON A.PRODUTO = B.PRODUTO
INNER JOIN FILIAIS AS C
    ON B.COD_FILIAL = C.COD_FILIAL

SELECT * FROM MQ_INTEGRACAO_ECATALOGOS_LOJA_IMAGENS

SELECT * FROM MQ_INTEGRACAO_eCATALOGOS_LOJAS_PRODUTOS
