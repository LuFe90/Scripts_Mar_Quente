select
v.FILIAL
,v.CLIENTE_ATACADO
,v.PEDIDO
,v.PEDIDO_EXTERNO
,v.PEDIDO_CLIENTE
,v.ROMANEIO
,vp.PRODUTO
,vp.COR_PRODUTO
,vp.PRECO1
,vp.ITEM_PEDIDO
,vp.VO1
,vp.VO2
,vp.VO3
,vp.VO4
,vp.VO5
,vp.VO6
,vp.VO7
,vp.VO8
,vp.VO9
,vp.VO10
,vp.VE1
,vp.VE2
,vp.VE3
,vp.VE4
,vp.VE5
,vp.VE6
,vp.VE7
,vp.VE8
,vp.VE9
,vp.VE10
,vp.QTDE_LIQUIDA
,vp.VALOR_LIQUIDO
,v.CODIGO_TAB_PRECO
,v.TIPO AS TIPO_VENDA
,vp.ENTREGA
,v.DATA_RECEBIMENTO
,v.DATA_ENVIO
,v.EMISSAO
,v.CADASTRAMENTO
,v.TOT_QTDE_ORIGINAL
,v.TOT_QTDE_ENTREGUE
,v.TOT_QTDE_EMBALADA
,v.TOT_QTDE_DEVOLVIDA
,v.TOT_QTDE_CANCELADA
,v.TOT_QTDE_ENTREGAR
,v.TOT_VALOR_ORIGINAL
,v.TOT_VALOR_ENTREGUE
,v.TOT_VALOR_CANCELADO
,v.TOT_VALOR_DEVOLVIDO
,v.TOT_VALOR_ENTREGAR
,v.DESCONTO
,v.CONDICAO_PGTO
,v.TRANSPORTADORA
,v.REPRESENTANTE
,v.GERENTE
,v.PRIORIDADE
,v.STATUS
,v.TABELA_FILHA
,v.OBS
from vendas v
INNER JOIN vendas_produto vp
	ON v.pedido = vp.pedido
where
--v.pedido_externo in ('LJ00000448') --pedido eCatalogo
--and 
--vp.produto in ('06.13.0290','06.13.0117','06.13.0403','23.31.0546')
--AND FILIAL = 'MAR QUENTE - FILIAL 09'
--and v.PEDIDO not in ('LA-01551838') --pedido Linx
v.TIPO like '%overgirls%'
ORDER BY --v.PEDIDO_EXTERNO desc
--vp.ENTREGA desc
vp.PRODUTO desc

	
/*
select distinct(tipo) from vendas order by tipo

	Select da tabela vendas_produto
SELECT 
 PEDIDO
,PRODUTO
,COR_PRODUTO
,ENTREGA
,ITEM_PEDIDO
,NUMERO_CONJUNTO
,PACKS
,STATUS_VENDA_ATUAL
,QTDE_ORIGINAL
,QTDE_EMBALADA
,QTDE_ENTREGAR
,QTDE_ENTREGUE
,QTDE_DEVOLVIDA
,QTDE_CANCELADA
,DESCONTO_ITEM
,VALOR_CANCELADO
,VALOR_ORIGINAL
,VALOR_ENTREGAR
,VALOR_DEVOLVIDO
,VALOR_ENTREGUE
,VO1
,VO2
,VO3
,VO4
,VO5
,VO6
,VO7
,VO8
,VO9
,VO10
,VE1
,VE2
,VE3
,VE4
,VE5
,VE6
,VE7
,VE8
,VE9
,VE10
,QTDE_LIQUIDA
,VALOR_LIQUIDO
,DATA_PARA_TRANSFERENCIA
FROM VENDAS_PRODUTO WHERE PEDIDO in ('LA-01552742')
*/

/*Select da tabela vendas_produto
SELECT 
 PEDIDO
,PRODUTO
,COR_PRODUTO
,ENTREGA
,ITEM_PEDIDO
,NUMERO_CONJUNTO
,PACKS
,STATUS_VENDA_ATUAL
,QTDE_ORIGINAL
,QTDE_EMBALADA
,QTDE_ENTREGAR
,QTDE_ENTREGUE
,QTDE_DEVOLVIDA
,QTDE_CANCELADA
,DESCONTO_ITEM
,VALOR_CANCELADO
,VALOR_ORIGINAL
,VALOR_ENTREGAR
,VALOR_DEVOLVIDO
,VALOR_ENTREGUE
,VO1
,VO2
,VO3
,VO4
,VO5
,VO6
,VO7
,VO8
,VO9
,VO10
,VE1
,VE2
,VE3
,VE4
,VE5
,VE6
,VE7
,VE8
,VE9
,VE10
,QTDE_LIQUIDA
,VALOR_LIQUIDO
,DATA_PARA_TRANSFERENCIA
FROM VENDAS_PRODUTO WHERE PEDIDO in ('LA-01550707')
*/
