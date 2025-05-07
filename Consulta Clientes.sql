--Consulta Tabela de clientes, com validação de campos para envia ecatalogo lojas (todas as colunas devem estar preenchidas para o integrador enviar ao ecatalogo)

SELECT
	--REPLACE(cadastro_cli_for.INATIVO,' ','') AS INATIVO -- 0 Ativo / 1 Inativo
	clientes_atacado.ecatalogosloja AS ENVIA_ECATALOGO -- 0 Não Envia / 1 Envia
	,clientes_atacado.vendedor
    --,loja_vendedores.nome_vendedor
	,TRIM(cadastro_cli_for.clifor) AS COD_CLIENTE
	,TRIM(cadastro_cli_for.nome_clifor) AS NOME
	,TRIM(cadastro_cli_for.razao_social) AS RAZAO_SOCIAL
	--,REPLACE(cadastro_cli_for.pj_pf,' ','') AS PF_PJ -- 1 PF / 0 PJ
	,TRIM(cadastro_cli_for.cgc_cpf) AS CPF_CNPJ
	,TRIM(cadastro_cli_for.rg_ie) AS RG_IE
	--Endereço e Contato
	,TRIM(cadastro_cli_for.cep) AS CEP
	,TRIM(cadastro_cli_for.endereco) AS ENDERECO
	--,TRIM(cadastro_cli_for.complemento) AS END_COMPLEMENTO
	,TRIM(cadastro_cli_for.numero) AS END_NUMERO
	,TRIM(cadastro_cli_for.bairro) AS BAIRRO
	,TRIM(cadastro_cli_for.cidade) AS CIDADE
	,TRIM(cadastro_cli_for.uf) AS UF
	--,TRIM(cadastro_cli_for.pais) AS PAIS
	--,REPLACE(cadastro_cli_for.ddi,' ','') AS DDI
	,REPLACE(cadastro_cli_for.ddd1,' ','') AS DDD1
	,TRIM(cadastro_cli_for.telefone1) AS TELEFONE1 
	--,TRIM(cadastro_cli_for.ramal1) AS RAMAL1
	,REPLACE(cadastro_cli_for.ddd2,' ','') AS DDD2
	,REPLACE(cadastro_cli_for.telefone2,' ','') AS TELEFONE2
	,REPLACE(cadastro_cli_for.dddfax,' ','') AS DDD_FAX
	,REPLACE(cadastro_cli_for.fax,' ','') AS TELEFONE_FAX
	--,TRIM(cadastro_cli_for.ramal2) AS RAMAL2
	,TRIM(cadastro_cli_for.email) AS EMAIL
	--Verifica campos de bloqueio do cadastro
	,(clientes_atacado.tipo) AS TIPO_CLIENTE
	,REPLACE(clientes_atacado.limite_credito,' ','') AS LIMITE_CREDITO
	,REPLACE(clientes_atacado.sem_credito,' ','') AS SEM_CREDITO
	,TRIM(clientes_atacado.tipo_bloqueio) AS TIPO_BLOQUEIO
	,FORMAT(clientes_atacado.bloqueio_faturamento, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_FATURAMENTO 
	,FORMAT(clientes_atacado.bloqueio_expedicao, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_EXPEDICAO
	,FORMAT(clientes_atacado.bloqueio_pedidos, 'dd/MM/yyyy', 'pt-BR') AS BLOQ_PEDIDOS
	
FROM   clientes_atacado
       INNER JOIN cadastro_cli_for
               ON clientes_atacado.cliente_atacado = cadastro_cli_for.nome_clifor
	   LEFT JOIN loja_vendedores
              ON loja_vendedores.vendedor = clientes_atacado.vendedor
       LEFT JOIN contas_plano
              ON clientes_atacado.conta_contabil = contas_plano.conta_contabil
       LEFT JOIN ctb_conta_plano
              ON clientes_atacado.ctb_conta_contabil = ctb_conta_plano.conta_contabil
       LEFT JOIN bancos
              ON cadastro_cli_for.banco = bancos.banco
       INNER JOIN filiais
               ON clientes_atacado.filial = filiais.filial
       LEFT JOIN ctb_lx_indicador_fiscal_terceiro
              ON cadastro_cli_for.indicador_fiscal_terceiro = ctb_lx_indicador_fiscal_terceiro.indicador_fiscal_terceiro
       LEFT JOIN ctb_excecao_grupo
              ON cadastro_cli_for.id_excecao_grupo = ctb_excecao_grupo.id_excecao_grupo
WHERE   cadastro_cli_for.INATIVO = 0
		AND clientes_atacado.tipo_bloqueio NOT IN ('FUNCIONARIO')
		--cadastro_cli_for.CGC_CPF 
		--IN ('50027993000163')
		--and clientes_atacado.vendedor != ''
ORDER BY cadastro_cli_for.INATIVO desc, clientes_atacado.tipo_bloqueio


/**/

--,TRIM(clientes_atacado.obs) AS OBS
	--,TRIM(cadastro_cli_for.obs_de_faturamento) AS OBS_FATURAMENTO
	--Endereço e Contato
	--,TRIM(cadastro_cli_for.cep) AS CEP
	--,TRIM(cadastro_cli_for.endereco) AS ENDERECO
	--,TRIM(cadastro_cli_for.complemento) AS END_COMPLEMENTO
	--,TRIM(cadastro_cli_for.numero) AS END_NUMERO
	--,TRIM(cadastro_cli_for.bairro) AS BAIRRO
	--,TRIM(cadastro_cli_for.cidade) AS CIDADE
	--,TRIM(cadastro_cli_for.uf) AS UF
	--,TRIM(cadastro_cli_for.pais) AS PAIS
	--,REPLACE(cadastro_cli_for.ddi,' ','') AS DDI
	--,REPLACE(cadastro_cli_for.ddd1,' ','') AS DDD1
	--,TRIM(cadastro_cli_for.telefone1) AS TELEFONE1 
	--,TRIM(cadastro_cli_for.ramal1) AS RAMAL1
	--,REPLACE(cadastro_cli_for.ddd2,' ','') AS DDD2
	--,REPLACE(cadastro_cli_for.telefone2,' ','') AS TELEFONE2
	--,TRIM(cadastro_cli_for.ramal2) AS RAMAL2
	--,TRIM(cadastro_cli_for.email) AS EMAIL
	----Outras Info
	--,REPLACE(Isnull(clientes_atacado.aceita_juntar_ped, 0),' ','') AS ACEITA_JUNTAR_PED
	--,FORMAT(cadastro_cli_for.cadastramento, 'dd/MM/yyyy', 'pt-BR') AS DT_CADASTRO
	--,FORMAT(cadastro_cli_for.aniversario, 'dd/MM/yyyy', 'pt-BR') AS DT_ANIVERSARIO
	--,REPLACE(cadastro_cli_for.indica_fornecedor,' ','') AS INDICA_FORNECEDOR
	--,REPLACE(cadastro_cli_for.indica_cliente,' ','') AS INDICA_CLIENTE
	--,REPLACE(cadastro_cli_for.ind_representante,' ','') AS INDICA_REPRESENTANTE
	--,REPLACE(cadastro_cli_for.indica_filial,' ','') AS INDICA_FILIAL
	--,REPLACE(cadastro_cli_for.aceita_dias_fixo,' ','') AS ACEITA_DIAS_FIXO
	--,REPLACE(clientes_atacado.prioridade,' ','') AS PRIORIDADE
	--,REPLACE(clientes_atacado.frete_a_pagar,' ','') AS FRETE_A_PAGAR
	--,TRIM(clientes_atacado.conceito) AS CONCEITO
	--,TRIM(clientes_atacado.filial) AS FILIAL
	--,REPLACE(cadastro_cli_for.indicador_fiscal_terceiro,' ','') AS INDICADOR_FISCAL_TERCEIROS
	--,TRIM(ctb_lx_indicador_fiscal_terceiro.descricao_fiscal_terceiro) AS DESC_FISCAL_TERCEIROS
	--,TRIM(clientes_atacado.ctb_conta_contabil) AS CONTA_CONTABIL
	--,TRIM(ctb_conta_plano.desc_conta) AS CTB_DESC_CONTA
	--,clientes_atacado.conta_contabil
	--,contas_plano.desc_conta
	--,cadastro_cli_for.fax
	--,cadastro_cli_for.cobranca_endereco
	--,cadastro_cli_for.cobranca_cidade
	--,cadastro_cli_for.cobranca_bairro
	--,cadastro_cli_for.dddfax
	--,cadastro_cli_for.cobranca_uf
	--,cadastro_cli_for.cobranca_cep
	--,cadastro_cli_for.cobranca_telefone
	--,cadastro_cli_for.entrega_endereco
	--,cadastro_cli_for.entrega_bairro
	--,cadastro_cli_for.entrega_cidade
	--,cadastro_cli_for.entrega_uf
	--,cadastro_cli_for.entrega_cep
	--,cadastro_cli_for.entrega_telefone
	--,cadastro_cli_for.cobranca_ddd
	--,cadastro_cli_for.contato
	--,cadastro_cli_for.cobranca_cgc
	--,cadastro_cli_for.cobranca_ie
	--,cadastro_cli_for.entrega_ddd
	--,cadastro_cli_for.entrega_cgc
	--,clientes_atacado.clifor
	--,clientes_atacado.cgc_cpf
	--,clientes_atacado.transportadora
	--,clientes_atacado.pontualidade
	--,clientes_atacado.matriz_cliente
	--,clientes_atacado.cliente_atacado
	--,cadastro_cli_for.entrega_ie
	--,clientes_atacado.regiao
	--,clientes_atacado.condicao_pgto
	--,cadastro_cli_for.banco
	--,cadastro_cli_for.cc_agencia
	--,cadastro_cli_for.cc_conta
	--,cadastro_cli_for.cc_nome_agencia
	--,cadastro_cli_for.ref_anterior
	--,clientes_atacado.numero_pedidos
	--,clientes_atacado.data_maior_pedido
	--,clientes_atacado.maior_pedido
	--,clientes_atacado.maior_saldo
	--,clientes_atacado.data_maior_saldo
	--,clientes_atacado.data_maior_atraso
	--,clientes_atacado.numero_atrasos
	--,clientes_atacado.maior_atraso
	--,clientes_atacado.pgtos_cartorio
	--,clientes_atacado.numero_devolucoes
	--,clientes_atacado.maior_devolucao
	--,clientes_atacado.numero_prorrogacoes
	--,clientes_atacado.maior_prorrogacao
	--,clientes_atacado.maior_qtde_dev
	--,clientes_atacado.data_maior_qtde_dev
	--,clientes_atacado.data_maior_devolucao
	--,clientes_atacado.maior_qtde_pedido
	--,clientes_atacado.data_maior_qtde_pedido
	--,clientes_atacado.desconto_faturamento
	--,cadastro_cli_for.carteira
	--,clientes_atacado.moeda
	--,clientes_atacado.inativo
	--,cadastro_cli_for.atualizacao_exportar
	--,cadastro_cli_for.data_exportacao
	--,cadastro_cli_for.status_envio
	--,cadastro_cli_for.inativo
	--,cadastro_cli_for.data_para_transferencia
	--,cadastro_cli_for.entrega_pais
	--,cadastro_cli_for.cobranca_pais
	--,bancos.nome_banco
	--,cadastro_cli_for.entrega_ddi
	--,cadastro_cli_for.cobranca_ddi
	--,clientes_atacado.cod_cliente
	--,clientes_atacado.data_para_transferencia
	--,clientes_atacado.indica_franquia
	--,clientes_atacado.codigo_tab_preco
	--,clientes_atacado.fator_custo_franquia
	--,clientes_atacado.desconto_pedido_venda
	--,clientes_atacado.seguro_numero_contrato
	--,clientes_atacado.seguro_numero_cliente
	--,clientes_atacado.seguro_validade
	--,cadastro_cli_for.isento_ipi
	--,cadastro_cli_for.isento_icms
	--,clientes_atacado.maior_valor_faturado
	--,clientes_atacado.data_maior_valor_faturado
	--,cadastro_cli_for.meses_sem_vencimento
	--,cadastro_cli_for.data_fixa_pgto
	--,cadastro_cli_for.aceita_agrupar_fatura
	--,cadastro_cli_for.numero_vias_fatura
	--,cadastro_cli_for.report_fatura
	--,cadastro_cli_for.dias_antecipacao_pgto
	--,cadastro_cli_for.passweb
	--,cadastro_cli_for.vencimento_passweb
	--,filiais.empresa
	--,filiais.tipo_filial
	--,Isnull(cadastro_cli_for.possui_recargo, 0) AS POSSUI_RECARGO
	--,Isnull(clientes_atacado.expedicao_completo_pedido, 0) AS EXPEDICAO_COMPLETO_PEDIDO
	--,Isnull(clientes_atacado.expedicao_completo_pack, 0) AS EXPEDICAO_COMPLETO_PACK
	--,Isnull(clientes_atacado.expedicao_completo_tamanhos, 0) AS EXPEDICAO_COMPLETO_TAMANHOS
	--,Isnull(clientes_atacado.expedicao_completo_cor, 0) AS EXPEDICAO_COMPLETO_COR
	--,Isnull(clientes_atacado.expedicao_completo_coordenado, 0) AS EXPEDICAO_COMPLETO_COORDENADO
	--,Isnull(clientes_atacado.expedicao_porcentagem_maior, 0) AS EXPEDICAO_PORCENTAGEM_MAIOR
	--,Isnull(clientes_atacado.expedicao_porcentagem_minima, 0) AS EXPEDICAO_PORCENTAGEM_MINIMA
	--,Isnull(clientes_atacado.expedicao_porcentagem_tipo, 0) AS EXPEDICAO_PORCENTAGEM_TIPO
	--,Isnull(clientes_atacado.expedicao_valor_maximo, 0) AS EXPEDICAO_VALOR_MAXIMO
	--,Isnull(clientes_atacado.expedicao_completo_cartela, 0) AS EXPEDICAO_COMPLETO_CARTELA
	--,Isnull(clientes_atacado.expedicao_completo_faixas, 0) AS EXPEDICAO_COMPLETO_FAIXAS
	--,cadastro_cli_for.cod_clifor
	--,cadastro_cli_for.cobranca_razao_social
	--,cadastro_cli_for.entrega_razao_social
	--,Isnull(clientes_atacado.expedicao_porc_adequacao, 0) AS EXPEDICAO_PORC_ADEQUACAO
	--,Isnull(clientes_atacado.expedicao_qtde_adequacao, 0) AS EXPEDICAO_QTDE_ADEQUACAO
	--,Isnull(clientes_atacado.expedicao_adequacao_cor, 0) AS EXPEDICAO_ADEQUACAO_COR
	--,Isnull(clientes_atacado.expedicao_adequacao_tamanho, 0) AS EXPEDICAO_ADEQUACAO_TAMANHO
	--,cadastro_cli_for.id_excecao_grupo
	--,ctb_excecao_grupo.desc_excecao_grupo
	--,Isnull(cadastro_cli_for.agrupamento_itens, 0) AS AGRUPAMENTO_ITENS
	--,clientes_atacado.indicador_venda
	--,cadastro_cli_for.cobranca_complemento
	--,cadastro_cli_for.entrega_complemento
	--,cadastro_cli_for.cobranca_numero
	--,cadastro_cli_for.entrega_numero

--select distinct(tipo_bloqueio) from clientes_atacado
--select distinct(tipo) from clientes_atacado
