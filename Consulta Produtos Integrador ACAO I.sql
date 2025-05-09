                        SELECT B.DESC_PRODUTO,
                               B.PRODUTO,
                               B.GRIFFE,
                               B.GRUPO_PRODUTO,
                               D.COD_FILIAL,
                               B.TIPO_PRODUTO,
                               B.DESC_PRODUTO,
                               ''       AS COMPOSITION,
                               ''       AS TECHNICAL_INFO,
                               B.CLASSIF_FISCAL,
                               E.DESC_COLECAO,
                               F.PRECO1,
	                           G.CODIGO_BARRA,
	                           A.DISPONIVEL,
	                           H.QTDE
                        FROM   MQ_ESTOQUE_DISPONIVEL_PEDIDO_NEW AS A
                               INNER JOIN PRODUTOS AS B
                                       ON A.PRODUTO = B.PRODUTO
                               INNER JOIN PRODUTOS_PACKS_PERMITIDOS AS C
                                       ON A.PRODUTO = C.PRODUTO
									   AND A.COR_PRODUTO = C.COR_PRODUTO 
                               INNER JOIN FILIAIS AS D
                                       ON A.FILIAL = D.FILIAL
                                          AND D.ECATALOGOSLOJA = 1
                               INNER JOIN COLECOES AS E
                                       ON B.COLECAO = E.COLECAO
                               INNER JOIN PRODUTOS_PRECOS AS F
                                       ON B.PRODUTO = F.PRODUTO
                                          AND F.CODIGO_TAB_PRECO = '01'
                               INNER JOIN PRODUTOS_BARRA AS G
                                       ON B.PRODUTO = G.PRODUTO
                                          AND G.CODIGO_BARRA LIKE '7%'
										  AND A.COR_PRODUTO = G.COR_PRODUTO
										  AND G.CODIGO_BARRA_PADRAO = '1'
                        WHERE  B.PRODUTO IN (SELECT PRODUTO FROM MQ_INTEGRACAO_eCATALOGOS_LOJAS_PRODUTOS AS X 
                                                            WHERE X.PRODUTO = B.PRODUTO AND COD_FILIAL = D.COD_FILIAL)
                          AND  B.eCataLogosLoja = 1
						  AND  G.CODIGO_BARRA_PADRAO = 1
