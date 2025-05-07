--Essa consulta os clientes que estão integrados no eCatalogo
SELECT 
	  F.ecatalogosloja AS ENVIA_ECATALOGO_ATIVO
	  ,RTRIM(LTRIM(C.VENDEDOR)) AS COD_VENDEDOR
	  ,RTRIM(LTRIM(C.VENDEDOR_APELIDO)) AS NOME_VENDEDOR
      ,RTRIM(LTRIM(B.cod_clifor)) AS COD_CLIENTE
	  ,RTRIM(LTRIM(B.razao_social)) AS RAZAO_SOCIAL
      ,RTRIM(LTRIM(B.nome_clifor)) AS NOME
      ,RTRIM(LTRIM(B.cgc_cpf)) AS CNPJ
      ,RTRIM(LTRIM(B.email)) AS EMAIL
      ,CASE
         WHEN B.inativo = 1 THEN 0
         ELSE 1
       END                        AS ATIVO
       ,RTRIM(LTRIM(B.endereco)) AS ENDERECO
       ,RTRIM(LTRIM(B.cidade)) AS CIDADE
       ,RTRIM(LTRIM(B.uf)) AS UF
       ,RTRIM(LTRIM(B.bairro)) AS BAIRRO
       ,RTRIM(LTRIM(B.numero)) AS NUMERO_END
       ,RTRIM(LTRIM(B.cep)) AS CEP
       ,RTRIM(LTRIM(B.ddd1)) AS DDD1
       ,RTRIM(LTRIM(B.telefone1)) AS TEL1 
       ,RTRIM(LTRIM(B.ddd2)) AS DDD2
       ,RTRIM(LTRIM(B.telefone2)) AS TEL2 
       ,RTRIM(LTRIM(B.dddfax)) AS DDDFAX
       ,RTRIM(LTRIM(B.fax)) AS FAX
       ,RTRIM(LTRIM(E.limite_credito)) AS LIMITE_CREDITO
	   ,RTRIM(LTRIM(E.TIPO_BLOQUEIO)) AS TIPO_BLOQ
       ,FORMAT(F.bloqueio_faturamento, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_FATURAMENTO 
	   ,FORMAT(F.bloqueio_expedicao, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_EXPEDICAO
	   ,FORMAT(F.bloqueio_pedidos, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_PEDIDOS
	   --CASE
       --  WHEN E.sem_credito = 1 THEN 0
       --  ELSE 1
       --END                        AS HAVE_CEDIT,
       --D.ID,
       --D.ACAO,
FROM   mq_cliente_vendedor AS A
       INNER JOIN clientes_atacado AS F
               ON A.cliente_atacado = F.cliente_atacado
       INNER JOIN cadastro_cli_for AS B
               ON A.cliente_atacado = B.nome_clifor
       INNER JOIN loja_vendedores AS C
               ON A.vendedor = Ltrim(Rtrim(C.vendedor))
       --Este join serve para validar quando ha um cadastro atualizado para integrar, se nao retornar, nao tem
       --INNER JOIN MQ_INTEGRACAO_ECATALOGOS_LOJAS AS D
       --        ON B.CLIFOR = D.CHAVE
       INNER JOIN clientes_atacado AS E
               ON B.cod_clifor = E.clifor
WHERE  B.inativo = 0
       --AND  D.MODULO = 'CLIENTES_PRIORITY'
       --AND F.ecatalogosloja = 1 
