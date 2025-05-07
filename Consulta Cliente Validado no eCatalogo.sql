--Essa consulta os clientes que estão integrados no eCatalogo
SELECT B.razao_social             AS NAME,
       B.nome_clifor              AS TRADING_NAME,
       B.email                    AS MAIL,
       B.ddd1 + ' ' + B.telefone1 AS PHONE,
       B.cod_clifor               AS CODE,
       B.cgc_cpf                  AS CNPJ,
       CASE
         WHEN B.inativo = 1 THEN 0
         ELSE 1
       END                        AS ATIVO,
       E.tipo_bloqueio,
       CASE
         WHEN E.sem_credito = 1 THEN 0
         ELSE 1
       END                        AS HAVE_CEDIT,
       E.limite_credito,
       E.bloqueio_expedicao,
       E.bloqueio_pedidos,
       E.bloqueio_faturamento,
       --D.ID,
       B.nome_clifor,
       --D.ACAO,
       B.endereco,
       B.cidade,
       B.uf,
       B.bairro,
       B.numero,
       B.cep,
       B.ddd1,
       B.telefone1,
       B.ddd2,
       B.telefone2,
       B.dddfax,
       B.fax
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
       AND F.ecatalogosloja = 1 
