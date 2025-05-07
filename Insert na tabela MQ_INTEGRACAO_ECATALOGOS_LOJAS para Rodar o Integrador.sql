--Insert na tabela MQ_INTEGRACAO_ECATALOGOS_LOJAS para Rodar o Integrador

SELECT B.PRODUTO,
                               D.COD_FILIAL,
                               A.DISPONIVEL,                               
                               F.PRECO1
                        FROM   MQ_ESTOQUE_DISPONIVEL_PEDIDO_NEW AS A
                               INNER JOIN PRODUTOS AS B
                                       ON A.PRODUTO = B.PRODUTO
                               INNER JOIN PRODUTOS_PACKS_PERMITIDOS AS C
                                       ON A.PRODUTO = C.PRODUTO
                               INNER JOIN FILIAIS AS D
                                       ON A.FILIAL = D.FILIAL
                                          AND D.ECATALOGOSLOJA = 1
                               --INNER JOIN COLECOES AS E
                               --        ON B.COLECAO = E.COLECAO
                               INNER JOIN PRODUTOS_PRECOS AS F
                                       ON B.PRODUTO = F.PRODUTO
                                          AND F.CODIGO_TAB_PRECO = '01'
                            --   INNER JOIN PRODUTOS_BARRA AS G
                            --           ON B.PRODUTO = G.PRODUTO
                            --              AND G.CODIGO_BARRA LIKE '7%'
	                           --INNER JOIN PRODUTOS_PACKS_PERMITIDOS AS H
			                         --  ON B.PRODUTO = H.PRODUTO
							   INNER JOIN MQ_INTEGRACAO_ECATALOGOS_LOJAS AS I
									   ON B.PRODUTO = I.CHAVE
                        WHERE  B.eCataLogosLoja = 1
						  AND  I.MODULO = 'PRODUTOS'

select * from MQ_INTEGRACAO_ECATALOGOS_LOJAS

/*
INSERT INTO MQ_INTEGRACAO_ECATALOGOS_LOJAS (DATA, MODULO, CHAVE, ACAO) VALUES (GETDATE(),'PRODUTOS','87.10.0141','A')
*/
