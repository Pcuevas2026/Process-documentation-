use EXTRACCIONES;

-------------------------------------- INICIO --------------------------------------
-------------------------------------- INICIO --------------------------------------

select IP from [Pharaoh].dbo.[CONEXION] where CONNECION = 'A';

-------------------------------------- Borrar tabla de solicitudes --------------------------------------
-------------------------------------- Borrar tabla de solicitudes --------------------------------------

truncate table EXTRACCIONES..ETL_adn_congelados; -- NUCA SE LLENA
truncate table EXTRACCIONES..ETL_CUENTASCAPTACION; -- NUCA SE LLENA
truncate table EXTRACCIONES..ETL_FROMADN_PEDIDOONE; -- NUCA SE LLENA
truncate table EXTRACCIONES..ETL_ADN_Renovaciones;
truncate table EXTRACCIONES..ETL_cancelaciones;
truncate table EXTRACCIONES..ETL_ADN_PedidoCancAnticipado;
truncate table EXTRACCIONES..ETL_ExtraADNpedidos;
truncate table EXTRACCIONES..ETL_FROMADN_MOCSOLICITUD;
truncate table EXTRACCIONES..ETL_FROMAND_PEDIDOALL;
truncate table EXTRACCIONES..ETL_RMD_FROM_ADN;
--truncate table EXTRACCIONES..PROC_RMD_ADN_CLEAN;
truncate table EXTRACCIONES..ETL_ADN_CLIBLOQUEADO;
truncate table EXTRACCIONES..ETL_abonosJC;
truncate table EXTRACCIONES..ETL_TelefonoCuActulizado;
truncate table EXTRACCIONES..ETL_SolicutesfromADN;
truncate table EXTRACCIONES..ETL_PedidoForaneoFromADN;
--truncate table EXTRACCIONES..RPT_NuevoPoliticasMOC;

--truncate table POLITICAS2020.dbo.TempTempPrestamos90;
--truncate table POLITICAS2020.dbo.DropTempPoliticasFinAnio2021_colocacion;
--truncate table POLITICAS2020.dbo.DropTempPoliticasFinAnio2021_pre;
--truncate table POLITICAS2020.dbo.DRopTempTABLEaupoliticaFinanio;
--truncate table POLITICAS2020.dbo.RPT_PoliticasFinAnio2021;

--truncate table [VistasRedUnica]..SeguimientoPoliticasPedidosNuevosSurtidos;

truncate table EXTRACCIONES..ETL_FROMADN_REGPCJ;
truncate table EXTRACCIONES..ETL_FROMADN_REG_SOL_7614;

truncate table EXTRACCIONES.DBO.cliente_Geo

------14-12-24 CABE--cosas de cobranza
truncate table EXTRACCIONES..ETL_CU_REF_PERSONALES
truncate table EXTRACCIONES..ETL_CU_DPI
truncate table EXTRACCIONES..ETL_CU_AVAL
truncate table EXTRACCIONES..ETL_FROMADN_REGRMD

truncate table EXTRACCIONES..ETL_ADN_BLOQ_POST_SURTIMIENTO
truncate table EXTRACCIONES..ETL_PROC_SOL_CAMBIO_DOMICILIO
truncate table EXTRACCIONES..ETL_RMD_FROM_MOV_PEDIDO
truncate table EXTRACCIONES..ETL_SurtimientosTDC
truncate table EXTRACCIONES..ETL_CANCELACION_PEDS_PRE_POST
truncate table EXTRACCIONES..ETL_SOLICTUD_RESCATE
truncate table EXTRACCIONES..ETL_TACRMarcasSolLAM
truncate table EXTRACCIONES..ETL_TRANSAC_MEDIOS_PAGO

truncate table EXTRACCIONES..ETL_ADN_solicitudesWithMotivoRechazo
truncate table EXTRACCIONES..ETL_SurtimientosTDC
truncate table EXTRACCIONES..ETL_DatosClienteCredito
truncate table EXTRACCIONES..ETL_dataFromAdnForLAE

truncate table EXTRACCIONES..cus_sucgestora;

-------------------------------------- ADN to 146 --------------------------------------
-------------------------------------- ADN to 146 --------------------------------------

/*************************************** Renovaciones* ***************************************/

-- use ADN;
--select
--	l.fiSucursalGestora
--	,P.fiPaisCU
--	,P.fiCanalCU
--	,P.fiSucursalCU
--	,P.fiFolioCU
--	,p.fiCanalS
--	,p.fiNoTiendaS
--	,fiNoPedidoS PedidoPrestamoRenovado
--	,p3.fdFecSurt FechaSurtimientoR
--	,c3.fiPlazo fiPlazoR
--	,c3.fiTIR fiTIRR
--	,c3.fnPedPagoPer SemanalidadR
--	,d3.fiProdId IdProductoR
--	,r3.fcProdDesc ProductoR
--	,d3.fnPrcUnit Importe_Prestamo_Renovado
--	,S.fiNoPedidoSeguro fiNoPedidoSeguroRenovado
--	,p4.fdFecSurt FechaSurtimientoS
--	,c4.fiPlazo fiPlazoS
--	,c4.fiTIR fiTIRS
--	,c4.fnPedPagoPer SemanalidadS
--	,d4.fiProdId IdProductoS
--	,r4.fcProdDesc ProductoS
--	,d4.fnPrcUnit Importe_Seguro_Renovado
--	,fiNoPedidoL PedidoPrestamoLiquidado
--	,p1.fdFecSurt FechaSurtimientoPA
--	,c1.fiPlazo fiPlazoPA
--	,c1.fiTIR fiTIRPA
--	,c1.fnPedPagoPer SemanalidadPA
--	,c1.fiNoPeriodoCorr Periodo_LiquidoPA
--	,c1.fdFecUltPago Fecha_LiquidacionPA
--	,m1.fnMovPImp Importe_Liquidacion_Prestamo_Anterior
--	,d1.fiProdId IdProductoPA
--	,r1.fcProdDesc ProductoPA
--	,d1.fnPrcUnit Importe_Original_Prestamo_Liquidado
--	,S2.fiNoPedidoSeguro fiNoPedidoSeguroLiquidado
--	,p2.fdFecSurt FechaSurtimientoSA
--	,c2.fiPlazo fiPlazoSA
--	,c2.fiTIR fiTIRSA
--	,c2.fnPedPagoPer SemanalidadSA
--	,c2.fiNoPeriodoCorr Periodo_LiquidoSA
--	,c2.fdFecUltPago Fecha_LiquidacionSA
--	,isnull(m2.fnMovPImp,0)+isnull(m22.fnMovPImp,0) Importe_Liquidacion_Seguro_Anterior
--	,d2.fiProdId IdProductoSA
--	,r2.fcProdDesc ProductoSA
--	,d2.fnPrcUnit Importe_Original_Seguro_Liquidado
--	,p3.fnpedsaldo
--	,p3.fiPedStat
--	,z.fcCuenta
--	,z.fnMonto Deposito
--FROM
--	TACRBITPEDIDOSURTLIQ P
--INNER JOIN credito c1
--	ON c1.finopedido = fiNoPedidoL
--INNER JOIN pedido p1
--	ON p1.finopedido = fiNoPedidoL
--INNER JOIN detalle_pedido d1
--	ON d1.finopedido = fiNoPedidoL
--INNER JOIN producto r1
--	ON r1.fiProdId = d1.fiProdId
--INNER JOIN movimiento_pedido m1
--	ON m1.finopedido = fiNoPedidoL
--	AND m1.fiTipoOP IN(932)
--INNER JOIN credito c3
--	ON c3.finopedido = fiNoPedidoS
--INNER JOIN pedido p3
--	ON p3.finopedido = fiNoPedidoS
--INNER JOIN detalle_pedido d3
--	ON d3.finopedido = fiNoPedidoS
--INNER JOIN producto r3
--	ON r3.fiProdId = d3.fiProdId
--INNER JOIN cenlineadecredito l
--	ON P.fiPaisCU = l.fiPais
--	AND P.fiCanalCU = l.fiCanal
--	AND P.fiSucursalCU = l.fiSucursal
--	AND P.fiFolioCU = l.fiFolio
--LEFT JOIN TACRBitTarjetaDeposito z
--	ON P.fiPaisCU = z.fiPaisCU
--	AND P.fiCanalCU = z.fiCanalCU
--	AND P.fiSucursalCU = z.fiSucursalCU
--	AND P.fiFolioCU = z.fiFolioCU
--	AND z.fiNoPedido = fiNoPedidoS
--LEFT JOIN TACRPrestamosSeguros S
--	ON P.fiNoPedidoS = S.fiNoPedidoPP
--LEFT JOIN TACRPrestamosSeguros S2
--	ON P.fiNoPedidoL = S2.fiNoPedidoPP
--LEFT JOIN credito c2
--	ON c2.finopedido = S2.fiNoPedidoSeguro
--LEFT JOIN pedido p2
--	ON p2.finopedido = S2.fiNoPedidoSeguro
--LEFT JOIN detalle_pedido d2
--	ON d2.finopedido = S2.fiNoPedidoSeguro
--LEFT JOIN producto r2
--	ON r2.fiProdId = d2.fiProdId
--LEFT JOIN movimiento_pedido m2
--	ON m2.finopedido = S2.fiNoPedidoSeguro
--	AND m2.fiTipoOP IN(977,932)
--LEFT JOIN movimiento_pedido m22
--	ON m22.finopedido = S2.fiNoPedidoSeguro
--	AND m22.fiTipoOP IN(978)
--LEFT JOIN credito c4
--	ON c4.finopedido = S.fiNoPedidoSeguro
--LEFT JOIN pedido p4
--	ON p4.finopedido = S.fiNoPedidoSeguro
--LEFT JOIN detalle_pedido d4
--	ON d4.finopedido = S.fiNoPedidoSeguro
--LEFT JOIN producto r4
--	ON r4.fiProdId = d4.fiProdId
--WHERE
--	fiEsSeguro = 0
--	AND fiNoPedidoS > 0
--	AND r3.fcProdDesc NOT LIKE '%SEGURO%';

select top 10 * from EXTRACCIONES..ETL_ADN_Renovaciones;

-- use ADN;
--select distinct fiProdId,fcProdDesc,fiDepto,fiSubDepto,fiClase,fiSubClase,fiIDJda from PRODUCTO

select top 10 * from EXTRACCIONES..ETL_CAT_PRODUCTO_PASO;

/*************************************** telfono* ***************************************/

-- use ADN;
--select fiPais,fiCanal,fiSucursal,fiFolio,fcTelCasa,fcTelCelular from(
--	select
--		fiPais,fiCanal,fiSucursal,fiFolio,cast(fcTelCasa as varchar(20)) as fcTelCasa,fcTelCelular
--		,ROW_NUMBER()over(partition by fiPais,fiCanal,fiSucursal,fiFolio order by fdfecha desc) as cc
--	from TACRBitTelCU
--	where len(fcTelCasa + fcTelCelular) > 0
--) as o
--where o.cc = 1;

select top 10 * from EXTRACCIONES..ETL_TelefonoCuActulizado;

/*************************************** Cancelaciones* ***************************************/

-- use ADN;
--IF OBJECT_ID('PEDIDOCIFRASCONTROL') IS NOT NULL
--BEGIN
--select ped.*,prod.fiprodid,prod.fcproddesc ,
--case  
--when prod.fidepto=10 and prod.fisubdepto NOT IN(22) then 'ELECTRONICA'
--when prod.fidepto=10 and prod.fisubdepto=22 then 'CONSUMO MULTICANAL'
--when prod.fidepto=41 and prod.fisubdepto=13 then 'CONSUMO MOTO'
--when prod.fidepto=23 and prod.fisubdepto=20 then 'ABARROTES'
--when prod.fidepto=11 then 'LINEA BLANCA'
--when prod.fidepto=12 then 'MUEBLES'
--when prod.fidepto=13 then 'COMPUTO'
--when prod.fidepto=14 then 'TELEFONIA'
--when prod.fidepto=15 then 'TRANSPORTE'
--when prod.fidepto=18 and prod.fisubdepto NOT IN(38) then 'PRESTAMOS'
--when prod.fidepto=18 and prod.fisubdepto =38 then 'SEGUROS Y GARANTIAS'
--when prod.fidepto=22 then 'MOTOCICLETAS'
--when prod.fidepto=20 then 'SEGUROS Y GARANTIAS'
--when prod.fidepto=24 then 'COLCHONES Y BOXES'
--else 'DESCONOCIDO'
--end Linea,
--DP.FICANTART,--ped.FnSaldoCapital SaldoCapital2,ped.fnInteresesPorFinanciamiento,ped.FnSaldoOriginal, 
--ped.[FNSALDO]*(1-(ped.[fnInteresesPorFinanciamiento]/ped.[FnSaldoOriginal]))SALDO_CAPITAL, 
--DP.FNPRCUNIT,DP.FNPDCTODESCTO,(DP.FNPRCUNIT-DP.FNPDCTODESCTO)*DP.FICANTART VALOR_PRODUCTO, 
--((DP.FNPRCUNIT-(DP.FNPDCTODESCTO))*DP.FICANTART)/(PED.FnSaldoCapital+PED.FNENGANCHE) PORCENTAJE_PRODUCTO, 
--((DP.FNPRCUNIT-(DP.FNPDCTODESCTO))*DP.FICANTART)/(PED.FnSaldoCapital+PED.FNENGANCHE) *PED.FNENGANCHE ENGANCHE, 
--((DP.FNPRCUNIT-DP.FNPDCTODESCTO)*DP.FICANTART)-(((DP.FNPRCUNIT-(DP.FNPDCTODESCTO))*DP.FICANTART)/(PED.FnSaldoCapital+PED.FNENGANCHE) *PED.FNENGANCHE) VALOR_REAL_PRODUCTO, 
--(ped.[FNSALDO]*(1-(ped.[fnInteresesPorFinanciamiento]/ped.[FnSaldoOriginal])))*((DP.FNPRCUNIT-(DP.FNPDCTODESCTO))*DP.FICANTART)/(PED.FnSaldoCapital+PED.FNENGANCHE) SALDO_PRODUCTO 
 
-- from (
--select
--cen.fiPais,cen.fiCanal,cen.fiSucursal,cen.fiFolio,a.fiNoTienda,a.fcTdaNombre,a.fiIdCanal,
--cred.finopedido, cred.fitir,ped.fdfecsurt,cred.fdIniPeriodo,cred.fdFecUltPago,cred.fnEnganche,ped.fnPEDsaldo fNsALDO,
--cred.fnImpPagado,cred.fnImpDeveng,CRED.FIPLAZO,PDC.fnSaldoCapital,PDC.fnInteresesPorFinanciamiento,PDC.fnSaldoOriginal,PDC.fnAbonoPuntual,PDC.fnAbonoNormal,
--DATEDIFF(WK,PED.fdfecsurt,CRED.fdFecUltPago) Vida_pedido,
--case when PDC.fnAbonoPuntual>0 then
--((pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital )+fnSaldoCapital
--else 
--((pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital)+fnSaldoCapital end TotalMontoPuntual,
--case when PDC.fnAbonoPuntual>0 then
--(pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital 
--else 
--(pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital end TotalInteresPuntual,
--case when PDC.fnAbonoPuntual>0 then
--(((pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*13
--else 
--(((pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*13
--end InteresTotalPuntual_13
--from control a,credito cred with(nolock)
--left join pedido ped with(nolock)
--on cred.finopedido=ped.finopedido
--LEFT JOIN PEDIDOCIFRASCONTROL PDC with(nolock)
--ON PDC.FINOPEDIDO=CRED.FINOPEDIDO
--left join cenlineadecredito cen with(nolock)
--on cen.fiNgcioId =ped.fiNgcioId
--and cen.fiNoTienda =ped.fiNoTienda
--and cen.fiCteId =ped.fiCteId
--and cen.fiDigitoVer=ped.fiDigitoVer
--where ped.fnpedsaldo=0 and cred.fdFecUltPago between '2024-01-01 00:00:00' and '2025-05-31 23:59:59' and cred.fitir in (184,495)
--AND DATEDIFF(WK,PED.fdfecsurt,CRED.fdFecUltPago)<=13 AND CRED.FIPLAZO>13 )ped

--left join detalle_pedido  dp with(nolock)
--on dp.finopedido=ped.finopedido
--left join producto  prod with(nolock)
--on prod.fiprodid=dp.fiprodid
--END

select top 10 * from EXTRACCIONES..ETL_cancelaciones;

/*************************************** NuevasCancelaciones* ***************************************/

-- use ADN;
--select 
--a.fiIdCanal,a.fiNoTienda,a.fiNoPedido,fdFecSurt,fiTIR,fiPlazo,fnPagoNormal,fnPagoPuntual,TotalPedido,fnCapital,
--fnSobreprecio,fnEnganche,fdFecLiquidacion,tiempoTranscurrido,fnImporteComision,fnImportePagado,InteresSemanal,InteresSemanalRedondo,DescuentoPuntual,
--InteresSemanalCalculo,	InteresX13Semanas,TotalAPagar,Diferencia,InteresPuntualCredito,MontoInteresEstimado2,TotalAPagar2,a.InteresesPagados,a.DiferenciaTotal,
--sum(pag.fnMovPImp)MontoPrevio,

--sum(pag.fnMovPImp)*(cast(a.fncapital as float)/a.TotalPedido ) MontoCapitalPrevio,

-----capital por cuota
--cast(a.fnCapital as float)/a.fiplazo CuotaCapital, 
--round(sum(pag.fnMovPImp)*(cast(a.fncapital as float)/a.TotalPedido ) /(cast(a.fnCapital as float)/a.fiplazo),0)CuotasPagadasPre

--from (
--select *,
--TotalAPagar2-(fncapital)+(fnImportePagado-TotalAPagar2 ) InteresesPagados ,

--fnImportePagado-TotalAPagar2 DiferenciaTotal
-- from (
--select fiIdCanal,fiNoTienda,fiNoPedido,fdFecSurt,fiTIR,fiPlazo,fnPagoNormal,fnPagoPuntual,TotalPedido,
--Sum(fnCapital)-fnEnganche fnCapital, Sum(fnSobreprecio) fnSobreprecio, fnEnganche,
--fdFecLiquidacion,DATEDIFF(WK,fdFecSurt,fdFecLiquidacion)tiempoTranscurrido,  fnImporteComision,  fnImportePagado,
-----calculo
--sum(fnSobreprecio)/cast(fiplazo as float) InteresSemanal,FLOOR(sum(fnSobreprecio)/cast(fiplazo as float)) InteresSemanalRedondo,
-- fnPagoNormal-fnPagoPuntual DescuentoPuntual, (floor(sum(fnSobreprecio)/cast(fiplazo as float))-(fnPagoNormal-fnPagoPuntual))InteresSemanalCalculo,
-- (floor(sum(fnSobreprecio)/cast(fiplazo as float))-(fnPagoNormal-fnPagoPuntual)) * 13 InteresX13Semanas ,

--(Sum(fnCapital)-fnEnganche ) +((round(sum(fnSobreprecio)/cast(fiplazo as float),0)-(fnPagoNormal-fnPagoPuntual)) * 13) TotalAPagar,

--fnImportePagado-((Sum(fnCapital)-fnEnganche ) +((FLOOR(sum(fnSobreprecio)/cast(fiplazo as float))-(fnPagoNormal-fnPagoPuntual)) * 13)) Diferencia,

--fnPagoPuntual*fiPlazo  InteresPuntualCredito,

------
--(floor(((fnPagoPuntual*fiPlazo)-(sum(fncapital)-fnEnganche) )/fiPlazo))*13  MontoInteresEstimado2,

--((floor(((fnPagoPuntual*fiPlazo)-(sum(fncapital)-fnEnganche) )/fiPlazo))*13)+Sum(fnCapital)-fnEnganche TotalAPagar2


--FROM (select l.fiIdCanal,l.fiNoTienda,p.fiNoPedido,P.fdFecSurt,c.fiTIR,c.fiPlazo,c.fnPedPagoPer fnPagoNormal,u.fnAbonoPromocion fnPagoPuntual,
--p.fnPedTotal TotalPedido,d.fncapital,d.fnSobreprecio,c.fnEnganche,

--c.fdFecUltPago fdFecLiquidacion , m.fnMovPImp fnImporteComision,  Sum(m2.fnMovPImp) fnImportePagado

--from pedido p with(nolock)
--inner join credito c with(nolock) on p.fiNoPedido=c.fiNoPedido
--inner join tacrlpromocionprontopago u with(nolock) on p.finopedido=u.finopedido

--inner join
--(select finopedido,sum(fnCapital)fncapital,sum(fnSobreprecio)fnSobreprecio
--from (select d.finopedido, (d.fiCantArt*d.fnPrcUnit)- (d.fiCantArt*d.fnPdctoDescto)-(d.fiCantArt*d.fnProdDesctoE) fnCapital, d.fiCantArt*d.fnImpSobreP fnSobreprecio
--from detalle_pedido d with(nolock)  )d group by finopedido)d  on p.finopedido=d.finopedido


--LEFT  join movimiento_pedido m with(nolock) on p.fiNoPedido=m.fiNoPedido  AND  m.fitipoop=951 and m.fdFecMovtoPed >='2021-07-01' 
--inner join movimiento_pedido m2 with(nolock) on p.fiNoPedido=m2.fiNoPedido and m2.fitipoop in (7,16) 
--inner join control l with(nolock) on l.fiidpais=2




----where m.fitipoop=951 and m.fdFecMovtoPed >='2022-06-01' 
--where c.fdFecUltPago >='2024-01-01 00:00:00'and  c.fitir not in (32,52,72,423,205,206) and DATEDIFF(WK,p.fdFecSurt,c.fdFecUltPago)<=13 and p.fnPedSaldo=0 and p.fiPedStat=1 and c.fiPlazo>13
--group by l.fiIdCanal,l.fiNoTienda,p.fiNoPedido,c.fiTIR,c.fiPlazo,c.fnPedPagoPer,u.fnAbonoPromocion,P.fdFecSurt,p.fnPedTotal,
--c.fnEnganche, c.fdFecUltPago , m.fnMovPImp ,d.fncapital,d.fnSobreprecio
--) T
----WHERE FINOPEDIDO=698444

--Group by fiIdCanal,fiNoTienda,fiNoPedido,fiTIR,fiPlazo,fnPagoNormal,fnPagoPuntual,
--fnEnganche,fdFecLiquidacion,  fnImporteComision,  fnImportePagado,fdFecSurt,TotalPedido
--)a
--)a

--left join movimiento_pedido pag with(nolock) 
--on pag.finopedido=a.finopedido
--and pag.fiNoTransac not in (
--select max(y.fiNoTransac) from  movimiento_pedido y where y.finopedido=pag.fiNoPedido and fitipoop in (7,16))
--and pag.fiTipoOp in (7,16)

--group by a.fiIdCanal,a.fiNoTienda,a.fiNoPedido,fdFecSurt,fiTIR,fiPlazo,fnPagoNormal,fnPagoPuntual,TotalPedido,fnCapital,
--fnSobreprecio,fnEnganche,fdFecLiquidacion,tiempoTranscurrido,fnImporteComision,fnImportePagado,InteresSemanal,InteresSemanalRedondo,DescuentoPuntual,
--InteresSemanalCalculo,	InteresX13Semanas,TotalAPagar,Diferencia,InteresPuntualCredito,MontoInteresEstimado2,TotalAPagar2,a.InteresesPagados,a.DiferenciaTotal

select top 10 * from dbo.ETL_ADN_PedidoCancAnticipado;

/*************************************** cobroJC ***************************************/

-- use ADN;
--select * from(
--	select cast(fdgestion as date) as Fecha,fiCanalId,fiNoTienda,fiNoPedido,sum(fnImporte) as Importe
--	from CredRendimientoSD
--	where fdGestion >= '2022-01-01'
--	group by cast(fdgestion as date),fiCanalId,fiNoTienda,fiNoPedido
--) as T
--where t.Importe > 0;

select top 10 * from dbo.ETL_abonosJC;

/*************************************** Cancelaciones13y26* ***************************************/

-- use ADN;
--IF OBJECT_ID('PEDIDOCIFRASCONTROL') IS NOT NULL
--BEGIN

--select
--cen.fiPais,cen.fiCanal,cen.fiSucursal,cen.fiFolio,a.fiIdCanal,a.fiNoTienda,
--cred.finopedido, cred.fitir,ped.fdfecsurt,cred.fdIniPeriodo,cred.fdFecUltPago,cred.fnEnganche,ped.fnPEDsaldo fNsALDO,
--cred.fnImpPagado,cred.fnImpDeveng,CRED.FIPLAZO,PDC.fnSaldoCapital,PDC.fnInteresesPorFinanciamiento,PDC.fnSaldoOriginal,PDC.fnAbonoPuntual,PDC.fnAbonoNormal,
--DATEDIFF(WK,PED.fdfecsurt,CRED.fdFecUltPago) Vida_pedido,
--case when PDC.fnAbonoPuntual>0 then
--((pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital )+fnSaldoCapital
--else 
--((pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital)+fnSaldoCapital end TotalMontoPuntual,
--case when PDC.fnAbonoPuntual>0 then
--(pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital 
--else 
--(pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital end TotalInteresPuntual,
--case when PDC.fnAbonoPuntual>0 then (((pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*13
--else  (((pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*13
--end InteresTotalPuntual_13,
--case when PDC.fnAbonoPuntual>0 then (((pdc.fnAbonoPuntual*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*26
--else  (((pdc.fnAbonoNormal*cred.fiplazo) - fnSaldoCapital)/cred.fiplazo)*26
--end InteresTotalPuntual_26
--from control a,credito cred with(nolock)
--left join pedido ped with(nolock)
--on cred.finopedido=ped.finopedido
--LEFT JOIN PEDIDOCIFRASCONTROL PDC with(nolock)
--ON PDC.FINOPEDIDO=CRED.FINOPEDIDO
--left join cenlineadecredito cen with(nolock)
--on cen.fiNgcioId =ped.fiNgcioId
--and cen.fiNoTienda =ped.fiNoTienda
--and cen.fiCteId =ped.fiCteId
--and cen.fiDigitoVer=ped.fiDigitoVer
--where ped.fnpedsaldo=0 and cred.fdFecUltPago between '2024-01-01 00:00:00' and '2025-05-31 23:59:59' and cred.fitir in (184,495)
--AND DATEDIFF(WK,PED.fdfecsurt,CRED.fdFecUltPago)<=13 AND CRED.FIPLAZO>13 
--END

select top 10 * from dbo.ETL_PagoAntipadoAdn;

/*************************************** Bloqueados** ***************************************/

-- use ADN;
--select* from(
--select * , 
--case when fiRMD=1  then 'RMD' else
--	case when fiLegal = 1  then 'Legal' else
--		case when fiPCJ = 1 then 'PCJ' else
--			case when SemAtraso>=2 then 'Credimax' else
--				case when TipoSaldo<>'Con saldo' then  'Inactividad' else
--					case when fiLocalizacion=1 then 'Localizacion' else OtroBloq
				
--				end
--				end 
--			end
--		end
--	end
--end 
--DescBloqueo,OtroBloq NBLOQ
--from (
--select cen.fiPais,cen.fiCanal,cen.fiSucursal,cen.fiFolio, case when ped.Saldo is not null then 'Con saldo' else 'Sin saldo' end TipoSaldo,
--cred.fiListaNegra,cred.fiLocalizacion,cred.fiRMD,cred.fiLegal,cred.fiPCJ,dbloq.FCDescripcion OtroBloq,
--ped.SemAtraso,ped.UltAbono,c.fiNoTienda TiendaGestora
--from control c, dbo.CENLineaDeCredito cen with(nolock)
--inner join CREDLineaDeCredito Cred with(nolock)
--on  cred.fiCanal	=cen.fiCanal
--and cred.fiSucursal	=cen.fiSucursal
--and cred.fiFolio	=cen.fiFolio
--	left join ( 
--	               select fiNgcioId,fiNoTienda,fiCteId,fiDigitoVer	,sum(saldo)saldo, max(SemAtraso)SemAtraso ,cast( max(fdFecUltPago) as date) UltAbono from(
--						select a.fiNgcioId,a.fiNoTienda,a.fiCteId,a.fiDigitoVer, a.fiNoPedido,a.fnpedtotal Saldo,b.fdFecUltPago,
--				   	    case when b.fdVencimiento>getdate() then b.fiNoPeriodoCorr-b.fiPeriodoAct --NuevaSemanaCorrida
--						when b.fdVencimiento<getdate() then cast((getdate()-b.fdVencimiento)as int) /7 + (b.fiNoPeriodoCorr-b.fiPeriodoAct)--SemanaInactividad
--						end SemAtraso                        
--						from Pedido a with(nolock)
--						inner join credito b with(nolock)
--						on b.finopedido=a.finopedido
--						where a.fipedstat=1 and a.fnpedsaldo>0)a
--						group by fiNgcioId,fiNoTienda,fiCteId,fiDigitoVer
--				) ped
--				on ped.fiNgcioId   =cen.fiNgcioId
--				and ped.fiNoTienda =cen.fiNoTienda
--				and ped.fiCteId    =cen.fiCteId
--				and ped.fiDigitoVer=cen.fiDigitoVer
--left join (
--select u.*,w.FCDescripcion, ROW_NUMBER() over(partition by fiPais,fiCanal,fiSucursal,fiFolio order by FdProceso desc)Y
-- from TACRBitCambiosLCR U with(nolock)
-- left join TACRCambiosLCR W with(nolock)
-- on u.FiIdBloqueo=w.FiIdBloqueo
-- where u.FiIdStatus=1 ---and  w.FiIdBloqueo in (29,30,31,55,58,60,62)
--)dbloq
--on dbloq.fiCanal=cen.fiCanal
--and dbloq.fiSucursal=cen.fiSucursal
--and dbloq.fiFolio	=cen.fiFolio
--and dbloq.y=1
--where CEN.fiStatus=3 
--)A
--)y;

select top 10 * from dbo.ETL_ADN_CLIBLOQUEADO;

/*************************************** TC ***************************************/

-- use ADN;
--select 
--Z.fiNoTienda,Z.fiOperacion OperacionTarjeta,
--Z.fcNumAutoriza,Z.fiTranNo,Z.EstadoTransaccion,Z.NoTarjeta,Z.Proveedor,
--Z.fcAfiliacion,Z.Pedido,Z.FacturaNo,Z.FechaPedido,Z.EstadoPedido,Z.Plazo,Z.ImporteReg,
--z.fcNumTarj,z.fcTcTitular,z.fcNoIdentif,
--isnull(avg(Z.ValorPedido),0)ValorPedido,--AVG(Z.fnImporte)ImporteTotalTarjeta,
--isnull(sum(Z.ValorDocumentos),0)ValorDocumentos,
--isnull(sum(Z.ValorEfectivo),0)ValorEfectivo,
--isnull(sum(Z.ValorTarjeta),0)ValorTarjeta,
--isnull(sum(Z.ValorOtros),0)ValorOtros
--from (
--select 
--CT.fiNoTienda,CT.fcTdaNombre,stdc.fiOperacion,
--stdc.fcNumAutoriza,stdc.fiTranNo,isnull(stdc.fistatus,'')EstadoTransaccion,
----isnull(replace(replace(replace(replace(tdc.fcNumTarj,'0','X'),'1','X'),'9','?'),'4','1'),'') NoTarjeta,
--isnull(substring(stdc.fcNumTBan,1,6),0)NoTarjeta,
--tdc.fcNumTarj,tdc.fcTcTitular,tdc.fcNoIdentif,
--case 
--when substring(tdc.fcNumTarj,1,1) =5 then 'MasterCard'
--when substring(tdc.fcNumTarj,1,1) =4 then 'Visa'
--when substring(tdc.fcNumTarj,1,1) =3 then 'Amex'
--Else ''
--End Proveedor,
--stdc.fcAfiliacion,isnull(ped.finopedido,'')Pedido,isnull(ped.fiPedFact,0) FacturaNo,
--isnull(ped.fdFecSurt,'')FechaPedido,
--case ped.fiPedStat
--				when 0 then 'Pendiente de Surtir'
--				when 1 then 'Surtido'
--				when 2 then 'Cancelado Antes de Entrega'
--				when 3 then 'Cancelado Después de Entrega'
--				when 4 then 'En Servicio'
--				when 5 then 'Pendiente de Confirmar'
--				when 6 then ''
--				when 7 then 'Pendiente de Recoger'
--				when 8 then 'En Aclaración'
--			end EstadoPedido,
--stdc.fiPlazo Plazo,stdc.fnImporte ImporteReg ,ped.fnPedTotal ValorPedido,
--case when t_p.fiTipoPago =9 then  mvp.fnTpagMonto end ValorDocumentos,
--case when t_p.fiTipoPago =1	then  mvp.fnTpagMonto end ValorEfectivo,
--case when t_p.fiTipoPago =2 then  mvp.fnTpagMonto end ValorTarjeta,
--case when t_p.fiTipoPago not in (1,2,9) and ped.fipedstat=1 then  mvp.fnTpagMonto end ValorOtros
--		from control CT,TACJCFStatusOperTBan stdc WITH (NOLOCK)
--		left join pedido ped
--		on ped.finopedido=stdc.finopedido

--		left join TARJETA_DE_CREDITO tdc WITH (NOLOCK)
--		on tdc.fcNumTarj=stdc.fcnumtBan
--		and tdc.finotransac=fiTranNo
--		left join movto_tipo_pago mvp WITH (NOLOCK)
--		on mvp.finotransac=stdc.fiTranNo
--		left join		tipo_pago t_p WITH (NOLOCK)
--		on				t_p.fiTipoPago = mvp.fiTipoPago

--		left  join		tipo_operacion t_o2 WITH (NOLOCK)
--		on				t_o2.fiTipoOp = mvp.fiTipoOp
--where year(ped.fdFecSurt)=2025
----- ped.fdFecSurt between '2017-12-01 00:00:00' and '2017-12-04 23:59:59'
--) Z
--group by Z.fiNoTienda,Z.fcTdaNombre,Z.fcNumAutoriza,Z.fiTranNo,Z.EstadoTransaccion,Z.NoTarjeta,Z.Proveedor,
--Z.fcAfiliacion,Z.Pedido,Z.FacturaNo,Z.FechaPedido,Z.EstadoPedido,Z.Plazo,Z.ImporteReg,Z.fiOperacion,
--z.fcNumTarj,z.fcTcTitular,z.fcNoIdentif;

select top 10 * from EXTRACCIONES..ETL_SurtimientosTDC;

/*************************************** Solicitudes ***************************************/

-- use ADN;
--select
--	CC.fiCanal AS CANALCU,
--	CC.fiSucursal AS SUCURSALCU,
--	CC.fiFolio AS FOLIOCU,
--	C.fiNoTienda AS SUCURSAL,
--	P.FINOPEDIDO AS PEDIDO,
--	fcEmpNo
--from
--	CONTROL C, PEDIDO P
--	LEFT JOIN CredClienteUnicoPedido CC
--		ON CC.FINOPEDIDO = P.FINOPEDIDO
--WHERE
--	fnPedSaldo > 0
--	AND FITIPOVENTA = 2
--	AND p.fipedstat = 1
--	AND p.fdfecsurt >= '2023-02-01 00:00:00';

select top 10 * from EXTRACCIONES..ETL_ExtraADNpedidos;

-- use ADN;
--select
--	fdFecSolicitud,
--	a.ClienteUnico,
--	a.fiSolicitudId,
--	a.Ejecutivo AS EmpEjecutivo,
--	CASE
--		WHEN empAutoriza IS NOT NULL THEN empAutoriza
--		ELSE noempRechaza
--	END AS EmpAutoriza,
--	--CASE
--	--	WHEN empAutoriza IS NOT NULL THEN NomEmpAutoriza
--	--	ELSE NomEmpRechaza
--	--END AS NombEmpleadoAutoriza,
--	noempInvestiga --,NombreInvestigador
--FROM
--	(
--		select
--			cres.fdFecSolicitud,
--			RIGHT('00' + CAST(ISNULL(cldc.fiPais, 0) AS VARCHAR(2)), 2) + 
--			RIGHT('00' + CAST(ISNULL(cldc.fiCanal, 0) AS VARCHAR(2)), 2) + ' ' +
--			RIGHT('0000' + CAST(ISNULL(cldc.fiSucursal, 0) AS VARCHAR(4)), 4) + ' ' +
--			CAST(ISNULL(cldc.fiFolio,0) AS VARCHAR(8)) AS ClienteUnico,
--			CREs.fiSolicitudId,
--			cres.fcEjecutivo AS Ejecutivo,							 
--			inv.fcEmpNo AS empAutoriza,
--			--LTRIM(RTRIM(emp.fcEmpNom)) + ' ' + LTRIM(RTRIM(emp.fcEmpApp)) AS NomEmpAutoriza,
--			Inv2.fcEmpNo AS noempRechaza,
--			--LTRIM(RTRIM(emp2.fcEmpNom)) + ' ' + LTRIM(RTRIM(emp2.fcEmpApp)) AS NomEmpRechaza,
--			--LTRIM(RTRIM(emp3.fcEmpNom)) + ' ' + LTRIM(RTRIM(emp3.fcEmpApp)) AS NombreEjecutivo,
--			invs.fcEmpNo AS noempInvestiga
--			--LTRIM(RTRIM(emp4.fcEmpNom)) + ' ' + LTRIM(RTRIM(emp4.fcEmpApp)) AS NombreInvestigador
--		FROM
--			credsolicitud CREs with(nolock) 
--			INNER JOIN credclientecliente CREcc with(nolock)
--				ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--				AND CREcc.fiIdTienda = CREs.fiIdTienda
--				AND CREcc.fiIdCliente = CREs.fiIdCliente
--			INNER JOIN cliente c with(nolock)
--				ON c.fiNgcioId = CREcc.fiNgcioId
--				AND c.fiNoTienda = CREcc.fiNoTienda
--				AND c.fiCteId = CREcc.fiCteId
--				AND c.fiDigitoVer = CREcc.fiDigitoVer    
--			INNER JOIN cenlineadecredito cldc with(nolock)
--				ON cldc.fiNgcioId = CREcc.fiNgcioId
--				AND cldc.fiNoTienda = CREcc.fiNoTienda
--				AND cldc.fiCteId = CREcc.fiCteId
--				AND cldc.fiDigitoVer = CREcc.fiDigitoVer
--			LEFT JOIN credinvestigacion inv with(nolock)
--				ON CREs.fiSolicitudId = inv.fiSolicitudId
--				AND  inv.fiInvestStat = 6
--			--LEFT JOIN empleado emp with(nolock)
--			--	ON emp.fcEmpNo = inv.fcEmpNo
--			LEFT JOIN credinvestigacion inv2 with(nolock)
--				ON CREs.fiSolicitudId = inv2.fiSolicitudId
--				AND  inv2.fiInvestStat = 9
--			--LEFT JOIN empleado emp2 with(nolock)
--			--	ON emp2.fcEmpNo = inv2.fcEmpNo
--			--LEFT JOIN empleado emp3 with(nolock)
--			--	ON emp3.fcEmpNo = cres.fcEjecutivo
--			LEFT JOIN TACRCredInvestigacion invs with(nolock)
--				ON invs.fisolicitudid = cres.fisolicitudid
--				AND invs.fiInvestStat IN (25,71,84,75)
--			--LEFT JOIN empleado emp4 with(nolock)
--			--	ON emp4.fcEmpNo = REPLACE(invs.fcEmpNo, 'T', '')
--		WHERE 
--			cres.FITIPOSOLICITUD IN (8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--			146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--			203,210,211,215,216,217,218,220,222,223,224,237)
--			AND cres.fdFecSolicitud >= '2025-01-01 00:00:00'
--	) AS a;

select top 10 * from EXTRACCIONES..ETL_SolicutesfromADN;

-- use ADN;
--select cldc.fiPais,cldc.fiCanal,cldc.fiSucursal,cldc.fiFolio,ctr.fiNoTienda,CREs.fiSolicitudId,Cres.fdFecSolicitud
--from control ctr,CREDCambDomicilio credc
--inner join credsolicitud CREs
--	on CREs.fisolicitudid = credc.fisolicitudid
--inner join cenlineadecredito cldc
--	on cldc.fipais = credc.fipais and
--	cldc.ficanal = credc.ficanal and
--	cldc.fisucursal = credc.fisucursal and
--	cldc.fifolio = credc.fifolio
--where
--	Cres.fiSubStat = 6
--	/*and year(Cres.fdFecSolicitud) >= 2020*/
--	and cres.FITIPOSOLICITUD in(26);

select top 10 * from ETL_PROC_SOL_CAMBIO_DOMICILIO;

/*************************************** RMD ***************************************/

-- use ADN;
--select
--	CAST(tr.fdRegistro AS DATE) AS Registro,
--	ct.fiNoTienda,
--	ct.fcTdaNombre,
--	YEAR(tr.fdRegistro) AS Anio,
--	MONTH(tr.fdRegistro) AS Mes,
--	cldc.fiPais,
--	cldc.fiCanal,
--	cldc.fiSucursal,
--	cldc.fiFolio,
--	ped.finopedido,
--	PED.FDFECsURT,
--	cred.fitir,
--	ped.fnPedTotal,
--	SUM(d_p.ficantart * d_p.fnprcunit) AS MONTO,
--	SUM(d_p.ficantart * d_p.fnpdctodescto) AS DESCUENTO, 
--	SUM(d_p.ficantart * (d_p.fnprcunit - d_p.fnpdctodescto)) - d_pre.fnEnganche AS TOTAL
--FROM
--	control ct, tacrrmd tr
--	INNER JOIN tacrpedidosrmd tpr
--		ON tpr.firmdid=tr.firmdid
--	INNER JOIN credito cred
--		ON cred.finopedido = tpr.finopedido
--	INNER JOIN pedido ped
--		ON ped.finopedido = cred.finopedido
--	INNER JOIN cenlineadecredito cldc
--		ON cldc.fiNgcioId = ped.fiNgcioId
--		AND cldc.fiNoTienda = ped.fiNoTienda
--		AND cldc.fiCteId = ped.fiCteId
--		AND cldc.fiDigitoVer = ped.fiDigitoVer  	
--	INNER JOIN detalle_pedido d_p
--		ON d_p.finopedido = ped.finopedido					
--	INNER JOIN(
--		select
--			fcFolioParam,
--			SUM(fnenganche) AS fnenganche
--		FROM DETALLE_PREPARAMETRICO with(nolock)
--		GROUP BY fcFolioParam
--	) AS d_pre
--		ON d_pre.fcFolioParam = ped.fcFolioParam
--WHERE
--	/*cred.fitir IN (34,0,184,495)		
--	AND tr.fdRegistro >= '2023-01-01 16:56:00'
--	AND tr.fiEstatus IN (3,4)
--	AND*/ ped.fnpedsaldo = 0
--	AND tr.fisucursalgestora = ct.fiNoTienda 
--GROUP BY
--	cldc.fiPais,
--	cldc.fiCanal,
--	cldc.fiSucursal,
--	cldc.fiFolio,
--	ped.finopedido,
--	cred.fitir,
--	ped.fnPedTotal,
--	ct.fiNoTienda,
--	ct.fcTdaNombre,
--	tr.fdRegistro,
--	tr.fdRegistro,
--	d_pre.fnEnganche,
--	PED.FDFECSURT;

select top 10 * from EXTRACCIONES..ETL_RMD_FROM_ADN;

/*************************************** PedidoForaneo ***************************************/

-- use ADN;
--select
--	a.*,
--	fcEmpNo,
--	c.fiPais,
--	c.fiCanal,
--	c.fiSucursal,
--	c.fiFolio
--from
--	CREDPedVendedorGestor A with(nolock)
--	INNER JOIN PEDIDO b with(nolock)
--		ON b.fiNoPedido = a.fiNoPedidoVend
--	INNER JOIN CredClienteUnicoPedido c with(nolock)
--		ON c.finopedido = b.fiNoPedido
--WHERE
--	CAST(b.fdFecSurt AS DATE) >= '2022-12-31'
--	AND b.fiPedStat = 1;

select top 10 * from EXTRACCIONES..ETL_PedidoForaneoFromADN;

/*************************************** MOC ***************************************/

-- use ADN;
--select
--	CREcct.fiPais,
--	CREcct.fiCanal,
--	CREcct.fiSucursal,
--	CREcct.fiFolio,
--	Cres.fiSubStat AS EstadoSolicitud,
--	CEN.fiStatus AS EstatusLCR,
--	CREDP.fdFechaAlta,
--	CRES.fiSolicitudId,
--	CRES.fiTipoSolicitud,
--	CRES.fdFecSolicitud,
--	--LTRIM(RTRIM(c.fcCteNombre)) + ' ' + LTRIM(RTRIM(c.fcCteAPaterno)) + ' ' + LTRIM(RTRIM(c.fcCteAMaterno)) AS NombreCliente,
--	--fcEmpNo AS Empleado_imprimio,
--	CASE
--		WHEN t.fcObservInv IS NOT NULL THEN 1
--		ELSE 0
--	END AS MOC,
--	sco.fcColor	AS ColoScore,
--	sco.fcCredInmediato AS CreditoInmediato,
--	ISNULL(CREa.fiAvalId,0) AS TieneAval,	
--	--CASE
--	--	WHEN inm.fiTipoSolicitud = 238 THEN 1
--	--	ELSE 0
--	--END AS CreditoInmediatoSQL,
--	--CDLDC.fnCapacidadPago,
--	--CDLDC.fnCapacidadPagoDisp,
--	--yc.fnCPActual PrimerCapacidad,
--	CREDP.fdFechaNacimiento,
--	sco.fiProdId
--	--,0 FechaImpresion,
--	--invest.fcObservInv AS Descrp
--FROM
--	credsolicitud CREs with(nolock)
--	INNER JOIN CREDClienteTienda CREcct with(nolock)
--		on CREcct.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcct.fiIdTienda = CREs.fiIdTienda
--		AND CREcct.fiIdCliente = CREs.fiIdCliente
--	LEFT JOIN credclientecliente CREcc with(nolock)
--		ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcc.fiIdTienda = CREs.fiIdTienda
--		AND CREcc.fiIdCliente = CREs.fiIdCliente	
--	LEFT JOIN  CREDCliente CLI with(nolock)
--		ON CREcc.fiIdNegocio = CLI.fiIdNegocio
--		AND CREcc.fiIdTienda = CLI.fiIdTienda
--		AND CREcc.fiIdCliente = CLI.fiIdCliente
--	LEFT JOIN  CREDPersona CREDP with(nolock)
--		ON CREDP.FIIDPERSONA = CLI.fiIdPersona
--		AND CREDP.FIIDTIPOPERSONA = 1
--	--LEFT JOIN CREDLineaDeCredito CDLDC
--	--	ON CDLDC.ficanal	= CREcct.ficanal
--	--	AND CDLDC.fisucursal=CREcct.fisucursal
--	--	AND CDLDC.fifolio	=CREcct.fifolio
--	LEFT JOIN credavalcliente CREac with(nolock)
--		ON CREac.fiIdNegocio = CREcc.fiIdNegocio 
--		AND CREac.fiIdTienda = CREcc.fiIdTienda 
--		AND CREac.fiIdCliente = CREcc.fiIdCliente				
--	LEFT JOIN credaval CREa
--		ON CREa.fiAvalId = CREac.fiAvalId
--	--LEFT JOIN  cliente c with(nolock)
--	--	ON c.fiNgcioId = CREcc.fiNgcioId
--	--	AND c.fiNoTienda = CREcc.fiNoTienda
--	--	AND c.fiCteId = CREcc.fiCteId
--	--	AND c.fiDigitoVer = CREcc.fiDigitoVer
--	LEFT JOIN CENLineaDeCredito CEN with(nolock)
--		ON CEN.fiNgcioId = CREcc.fiNgcioId
--		AND CEN.fiNoTienda = CREcc.fiNoTienda
--		AND CEN.fiCteId = CREcc.fiCteId
--		AND CEN.fiDigitoVer = CREcc.fiDigitoVer	
--	LEFT JOIN TACRCREDDecScoreFisco Sco with(nolock)
--		ON sco.fiPais = CREcct.fiPais
--		AND sco.fiCanal	= CREcct.fiCanal
--		AND sco.fiSucursal = CREcct.fiSucursal
--		AND sco.fiFolio	= CREcct.fiFolio
--		AND sco.fdRegistro >= '2023-01-01 00:00:00'
--	--LEFT JOIN CREDInvestigacion invest
--	--	ON invest.fiSolicitudId = CREs.fiSolicitudId
--	--	AND nvest.fiInvestStat = 5
--	LEFT JOIN tacrcredinvestigacion T with(nolock)
--		ON t.fiSolicitudId = CREs.fiSolicitudId
--		AND t.fiInvestStat = 214
--	--LEFT JOIN	credsolicitud inm
--	--	ON inm.fiidnegocio=CREs.fiidnegocio
--	--	AND inm.fiidtienda=CREs.fiidtienda
--	--	AND inm.fiidcliente=CREs.fiidcliente
--	--	AND inm.fiTipoSolicitud =238		
--	--LEFT JOIN CREDBITCAPPAGOTR yc
--	--	ON yc.fiPais = CREcct.fiPais
--	--	AND yc.fiCanal = CREcct.fiCanal
--	--	AND yc.fiSucursal = CREcct.fiSucursal
--	--	AND yc.fiFolio = CREcct.fiFolio
--	--	AND yc.fdFecha = (
--	--		select
--	--			MIN(y.fdFecha)
--	--		FROM CREDBITCAPPAGOTR y
--	--		WHERE
--	--			y.fiCanal=yc.fiCanal
--	--			AND y.fiSucursal=yc.fiSucursal
--	--			AND y.fifolio=yc.fifolio
--	--		)
--WHERE
--	CREs.fdFecSolicitud >= '2025-01-01 00:00:00'
--	AND CREs.FITIPOSOLICITUD IN (8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--		146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--		203,210,211,215,216,217,218,220,222,223,224,237);

select top 10 * from dbo.ETL_FROMADN_MOCSOLICITUD;

-- use ADN;
--select
--	CC.fiCanal AS CANALCU,
--	CC.fiSucursal AS SUCURSALCU,
--	CC.fiFolio AS FOLIOCU,
--	C.fiNoTienda AS SUCURSAL,
--	P.FINOPEDIDO AS PEDIDO,
--	p.fdFecSurt AS FechaSurt,
--	cred.fiplazo,
--	cred.fiTIR AS UnidadNegocio,
--	d_p.ficant * d_p.fnprodprecioD AS Precio,
--	d_p.fnEnganche AS Enganche, 
--	d_p.ficant * (d_p.fndescto + d_p.fndesctoesp) AS Descuento,  
--	(d_p.fnprodpreciod * d_p.ficant) - (d_p.ficant * d_p.fndescto) + (d_p.ficant * d_p.fndesctoesp) - d_p.fnenganche AS MontoColocado, 	   	
--	(((d_p.ficant * d_p.fnSobreprecio)  +  (d_p.ficant * d_p.fnprodpreciod))  - ((d_p.fndescto * d_p.ficant) + (d_p.fndesctoesp * d_p.ficant))) - d_p.fnenganche AS SaldoOriginal,
--	prod.fiProdId,
--	prod.fcProdDesc,
--	prod.fiDepto,
--	prod.fiSubDepto
--FROM
--	CONTROL C, PEDIDO P with(nolock)
--	INNER JOIN CENLineaDeCredito CC  with(nolock)
--		ON cc.fiNgcioId = p.fiNgcioId
--		AND cc.fiNoTienda = p.fiNoTienda
--		AND cc.fiCteId = p.fiCteId
--		AND cc.fiDigitoVer = p.fiDigitoVer
--	INNER JOIN credito cred with(nolock)
--		ON cred.fiNoPedido = p.finopedido
--	INNER JOIN DETALLE_PREPARAMETRICO d_p with(nolock)
--		ON p.fcFolioParam = d_p.fcFolioParam
--	LEFT JOIN producto prod
--		ON prod.fiProdId = d_p.fiProdId
--WHERE
--	p.fipedstat = 1
--	AND p.fdFecSurt >= '2025-01-01 00:00:00'
--	AND cc.fdFechaAlta >= '2023-02-01';

select top 10 * from EXTRACCIONES..ETL_FROMAND_PEDIDOALL;

-- use ADN;
--select a.fiNoTienda,b.* from control a,TACRMarcasSolLAM B;

select top 10 * from EXTRACCIONES..ETL_TACRMarcasSolLAM

-- use ADN;
--select 
--	c.fiNoTienda,T.fiMarcaId,T.fiSolicitudId,convert(date,T.fdRegistro) as FdRegOriginacionUnica,s.fdFecSolicitud,cen.fiSucursalGestora
--	,cen.fiPais,cen.fiCanal,cen.fiSucursal,cen.fiFolio
--from control c, TACRMarcasSolicitud T with(nolock) 
--left join CREDSolicitud S with(nolock)
--	on s.fiSolicitudId = t.fiSolicitudId
--left join CREDClienteCliente ccc with(nolock)
--	on ccc.fiIdNegocio = s.fiidnegocio
--	and  ccc.fiidtienda = s.fiidtienda
--	and ccc.fiidcliente = s.fiidcliente
--left join CENLineaDeCredito cen with(nolock)
--	on cen.fiNgcioId = ccc.fiNgcioId
--	and cen.fiNoTienda = ccc.fiNoTienda
--	and cen.fiCteId = ccc.fiCteId
--	and cen.fiDigitoVer = ccc.fiDigitoVer  
--where T.fiMarcaId = 5190;

select top 10 * from EXTRACCIONES..ETL_FROMADN_TACRMarcasSolicitud;

/*************************************** RESCATE ***************************************/

-- use ADN;
--select 
--	cres.fdFecSolicitud,CRES.fiSubStat,cldc.fiPais PAISCU,cldc.fiCanal CANALCU,cldc.fiSucursal SUCURSAL_CU,cldc.fiFolio FOLIOCU,
--	cres.FITIPOSOLICITUD,
--	CREs.fiSolicitudId,cres.fcEjecutivo Ejecutivo,							 
--	inv.fcEmpNo empAutoriza, 
--	Inv2.fcEmpNo noempRechaza,INME.fcObservInv INME_DESC,PROMO.fcObservInv PROMO_DESC,RESC.fcObservacion RESC_DESC,
--	C1.fcColor,C1.fcCredInmediato,C1.fcDecisionMatriz
--from dbo.credsolicitud CREs with(nolock) 
--inner join  dbo.credclientecliente CREcc with(nolock)
--	on CREcc.fiIdNegocio = CREs.fiIdNegocio
--	and CREcc.fiIdTienda = CREs.fiIdTienda
--	and CREcc.fiIdCliente = CREs.fiIdCliente
--inner join dbo.cliente c with(nolock)
--	on c.fiNgcioId = CREcc.fiNgcioId
--	and c.fiNoTienda = CREcc.fiNoTienda
--	and c.fiCteId = CREcc.fiCteId
--	and c.fiDigitoVer = CREcc.fiDigitoVer
--inner join dbo.cenlineadecredito cldc with(nolock)
--	on cldc.fiNgcioId = CREcc.fiNgcioId and
--	cldc.fiNoTienda = CREcc.fiNoTienda and
--	cldc.fiCteId = CREcc.fiCteId and
--	cldc.fiDigitoVer = CREcc.fiDigitoVer
--left join dbo.credinvestigacion inv with(nolock)
--	on CREs.fiSolicitudId=inv.fiSolicitudId
--	and  inv.fiInvestStat = 6
--left join dbo.empleado emp with(nolock)
--	on emp.fcEmpNo = inv.fcEmpNo
--left join  dbo.credinvestigacion inv2 with(nolock)
--	on CREs.fiSolicitudId=inv2.fiSolicitudId
--	and inv2.fiInvestStat = 9
--left join dbo.empleado emp2 with(nolock)
--	on emp2.fcEmpNo = inv2.fcEmpNo
--left join dbo.empleado emp3 with(nolock)
--	on emp3.fcEmpNo = cres.fcEjecutivo
--LEFT JOIN Tacrcredinvestigacion INME
--ON INME.fiSolicitudId = CRES.fiSolicitudId
-- AND INME.fiInvestStat = 120
--LEFT JOIN Tacrcredinvestigacion PROMO
--	ON PROMO.fiSolicitudId=CRES.fiSolicitudId
--	AND PROMO.fiInvestStat = 221
--LEFT JOIN DBO.TACRMARCASSOLICITUD RESC
--	ON RESC.fiSolicitudId=CRES.fiSolicitudId
--	AND RESC.fiMarcaId in(93,159,128,136,150,151)
--left JOIN(
--	select *, ROW_NUMBER() OVER(PARTITION BY  fiPais,fiCanal,fiSucursal,fiFolio ORDER BY fdRegistro DESC) as CC
--	FROM TACRCREDDECSCOREFISCO
--) as C1
--	ON C1.FIPAIS = cldc.FIPAIS 
--	AND C1.FICANAL = cldc.FICANAL 
--	AND C1.FISUCURSAL = cldc.FISUCURSAL
--	AND C1.FIFOLIO = cldc.FIFOLIO
--	AND C1.CC = 1
--where
--	cres.FITIPOSOLICITUD IN(8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--	146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--	203,210,211,215,216,217,218,220,222,223,224,237)
--	and cres.fdFecSolicitud >= '2024-01-01 00:00:00';

select top 10 * from EXTRACCIONES..ETL_SOLICTUD_RESCATE;

-- use ADN;
--select distinct c.fiNoTienda,cred.fiNoPedido,cred.fiTIR,mp.fdFecMovtoPed
--from control c,Credito cred
--inner join Movimiento_Pedido mp
--	on mp.fiNoPedido=cred.fiNoPedido
--	and mp.fiTipoOp = 932
--where cred.fiTIR in(32,52,72,159);

select top 10 * from EXTRACCIONES..ETL_from_ADN_Ped_Restituidos;

/*************************************** Sucursal Gestora ***************************************/

-- use ADN;
--select
--	fiCanal as canalcu
--	,fiSucursal as sucursalcu
--	,fiFolio as foliocu
--	,fiSucursalGestora as sucursal_gestora
--	,fdFechaAlta
--	,fdFechaAct
--from [dbo].[CENLineaDeCredito];

select top 10 * from EXTRACCIONES..cus_sucgestora;

/*************************************** TDC ***************************************/

-- use ADN;
--select 
--	CT.fiNoTienda,/*CT.fcTdaNombre,stdc.fiOperacion,*/tdc.fcNoIdentif,
--	--stdc.fcNumAutoriza,stdc.fiTranNo,isnull(stdc.fistatus,'')EstadoTransaccion,
--	isnull(stdc.fcNumTBan,0)NoTarjeta,
--	case 
--		when substring(tdc.fcNumTarj,1,1) =5 then 'MasterCard'
--		when substring(tdc.fcNumTarj,1,1) =4 then 'Visa'
--		when substring(tdc.fcNumTarj,1,1) =3 then 'Amex'
--		else ''
--	end as Proveedor,
--	--stdc.fcAfiliacion,
--	isnull(ped.finopedido,'')Pedido,isnull(ped.fiPedFact,0) FacturaNo,
--	isnull(ped.fdFecSurt,'')FechaPedido,
--	/*
--	case ped.fiPedStat
--		when 0 then 'Pendiente de Surtir'
--		when 1 then 'Surtido'
--		when 2 then 'Cancelado Antes de Entrega'
--		when 3 then 'Cancelado Después de Entrega'
--		when 4 then 'En Servicio'
--		when 5 then 'Pendiente de Confirmar'
--		when 6 then ''
--		when 7 then 'Pendiente de Recoger'
--		when 8 then 'En Aclaración'
--	end EstadoPedido,*/
--	stdc.fiPlazo Plazo,stdc.fnImporte ImporteReg ,ped.fnPedTotal ValorPedido,
--	case when t_p.fiTipoPago =9 then  mvp.fnTpagMonto end as ValorDocumentos,
--	case when t_p.fiTipoPago =1	then  mvp.fnTpagMonto end as ValorEfectivo,
--	case when t_p.fiTipoPago =2 then  mvp.fnTpagMonto end as ValorTarjeta,
--	case when t_p.fiTipoPago not in(1,2,9) and ped.fipedstat = 1 then mvp.fnTpagMonto end as ValorOtros,
--	pro.fiprodid,
--	pro.fcProdDesc,  
--	dtp.ficantart * dtp.fnprcunit as MONTO,dtp.ficantart * dtp.fnpdctodescto as descuento, 
--	dtp.ficantart * dtp.fnProdDesctoE as descuentoEspecial,
--	dtp.ficantart * (dtp.fnprcunit - (dtp.fnpdctodescto+dtp.fnProdDesctoE)) as totalVenta
--from control CT,TACJCFStatusOperTBan stdc WITH (NOLOCK)
--left join pedido ped
--	on ped.finopedido = stdc.finopedido
--left join TARJETA_DE_CREDITO tdc WITH (NOLOCK)
--	on tdc.fcNumTarj = stdc.fcnumtBan
--	and tdc.finotransac = fiTranNo
--left join movto_tipo_pago mvp WITH (NOLOCK)
--	on mvp.finotransac=stdc.fiTranNo
--left join tipo_pago t_p WITH (NOLOCK)
--	on t_p.fiTipoPago = mvp.fiTipoPago
--left  join tipo_operacion t_o2 WITH (NOLOCK)
--	on t_o2.fiTipoOp = mvp.fiTipoOp
--left join detalle_pedido dtp WITH (NOLOCK)
--	on dtp.finopedido = ped.finopedido	
--left join producto pro WITH (NOLOCK)
--	on pro.fiprodid = dtp.fiprodid
--where
--	len(stdc.fcFecha) = 8
--	and cast(substring(stdc.fcFecha,1,4) +'-'+substring(stdc.fcFecha,5,2)+'-'+ substring(stdc.fcFecha,7,2) as datetime) >= '2024-01-01 00:00:00'
--	and ped.fiPedStat = 1;

select top 10 * from EXTRACCIONES..ETL_ADN_ventaTDC;

-- use ADN;
--select
--	finotienda, convert(date,fdMovFecHr)fechaTransac,fcNoIdentif,fiNoTransac,fcRefMov,Proveedor,Plazo,ImporteReg,
--	fiNoPedido,fiprodid,fcProdDesc,MONTO,descuento,descuentoEspecial,totalVenta, avg(isnull(fnImpMov,0))fnImpMov,sum(isnull(ValorDocumentos,0))valorDocumentos,
--	sum(isnull(ValorEfectivo,0))ValorEfectivo,sum(isnull(ValorTarjeta,0))ValorTarjeta,sum(isnull(ValorOtros,0))ValorOtros
--from(
--	select
--		cc.finotienda, m.fdMovFecHr,tdc.fcNoIdentif,m.fiNoTransac,m.fcRefMov,m.fnImpMov,ltrim(rtrim(tp.fcTopDesc))fcTopDesc ,mtp.fiTipoPago,
--		case
--			when substring(tdc.fcNumTarj,1,1) =5 then 'MasterCard'
--			when substring(tdc.fcNumTarj,1,1) =4 then 'Visa'
--			when substring(tdc.fcNumTarj,1,1) =3 then 'Amex'
--		else ''
--		end as Proveedor,
--		stdc.fiPlazo Plazo,stdc.fnImporte ImporteReg,m.fiNoPedido,
--		pro.fiprodid,pro.fcProdDesc,      
--		dtp.ficantart * dtp.fnprcunit MONTO,dtp.ficantart * dtp.fnpdctodescto descuento, 
--		dtp.ficantart * dtp.fnProdDesctoE descuentoEspecial, 
--		dtp.ficantart * (dtp.fnprcunit - (dtp.fnpdctodescto+dtp.fnProdDesctoE)) totalVenta,
--		case when t_p.fiTipoPago =9 then  mtp.fnTpagMonto end as ValorDocumentos,
--		isnull(case when t_p.fiTipoPago = 1	then mtp.fnTpagMonto end,0) as ValorEfectivo,
--		case when t_p.fiTipoPago = 2 then  mtp.fnTpagMonto end as ValorTarjeta, 
--		case when t_p.fiTipoPago = 14 then  mtp.fnTpagMonto end as ValorOtros
--	from control cc,movto_caja m with(nolock) 
--	inner join movto_tipo_pago mtp with(nolock) 
--		on mtp.fiNoTransac = m.fiNoTransac
--	inner join tipo_operacion tp WITH (NOLOCK)
--		on tp.fiTipoOp = m.fiTipoOp
--	left join TACJCFStatusOperTBan stdc WITH (NOLOCK)
--		on stdc.finopedido = m.fiNoPedido
--	left join TARJETA_DE_CREDITO tdc WITH (NOLOCK)
--		on tdc.fcNumTarj = stdc.fcnumtBan
--		and tdc.finotransac = stdc.fiTranNo
--	inner join detalle_pedido dtp WITH (NOLOCK)
--		on dtp.finopedido=m.finopedido		
--	left join producto pro WITH (NOLOCK)
--		on pro.fiprodid=dtp.fiprodid
--	left join tipo_pago t_p WITH (NOLOCK)
--		on t_p.fiTipoPago = mtp.fiTipoPago
--	inner join pedido ped
--		on ped.finopedido = m.fiNoPedido
--		and ped.fiPedStat = 1		
--	where
--		m.fiTipoOp = 32
--		and convert(date,m.fdMovFecHr) >= convert(date,'2025-10-06')
--) as y
--group by convert(date,fdMovFecHr),fcNoIdentif,fiNoTransac,fcRefMov,Proveedor,Plazo,ImporteReg,
--fiNoPedido,fiprodid,fcProdDesc,MONTO,descuento,descuentoEspecial,totalVenta,fiNoTienda;

select top 10 * from EXTRACCIONES..ETL_ADN_detalleFomaPagoVtaContado;

/*************************************** CLIENTE ***************************************/

-- use ADN;
--select * from(
--	select
--		CRECCT.fiPais, CREcct.fiCanal,CREcct.fiSucursal,CREcct.fiFolio,
--		CREcc.fiNoTienda,CREcc.fiCteId	,CREcc.fiDigitoVer,
--		CREDP.fcNombre,CREDP.fcApPaterno,CREDP.fcAMaterno,CONVERt(DATE,CreDp.fdFechaNacimiento )fdFechaNacimiento,
--		ROW_NUMBER()OVER(PARTITION BY CREcc.fiNoTienda,CREcc.fiCteId,CREcc.fiDigitoVer ORDER BY CREcc.fiDigitoVer) as CC
--	FROM control w,credsolicitud CREs with(nolock)
--	inner JOIN CREDClienteTienda CREcct with(nolock)
--		on CREcct.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcct.fiIdTienda = CREs.fiIdTienda
--		AND CREcct.fiIdCliente = CREs.fiIdCliente
--	LEFT JOIN credclientecliente CREcc with(nolock)
--		ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcc.fiIdTienda = CREs.fiIdTienda
--		AND CREcc.fiIdCliente = CREs.fiIdCliente	
--	LEFT JOIN  CREDCliente CLI with(nolock)
--		ON CREcc.fiIdNegocio = CLI.fiIdNegocio
--		AND CREcc.fiIdTienda = CLI.fiIdTienda
--		AND CREcc.fiIdCliente = CLI.fiIdCliente
--	LEFT JOIN  CREDPersona CREDP with(nolock)
--		ON CREDP.FIIDPERSONA = CLI.fiIdPersona
--		AND CREDP.FIIDTIPOPERSONA = 1 
--WHERE CREs.FITIPOSOLICITUD IN(8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--	146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--	203,210,211,215,216,217,218,220,222,223,224,237) 
--) as X
--WHERE X.CC = 1;

select top 10 * from EXTRACCIONES..ETL_DatosClienteCredito;

-- use ADN;
--select
--	distinct CRECCT.fiPais, CREcct.fiCanal,	CREcct.fiSucursal,	CREcct.fiFolio,
--	CREcc.fiNoTienda,CREcc.fiCteId	,CREcc.fiDigitoVer,CREDP.fcTelefonoPersonal,CDPD.fcTelefono
--FROM control w,credsolicitud CREs with(nolock)
--inner JOIN CREDClienteTienda CREcct with(nolock)
--	on CREcct.fiIdNegocio = CREs.fiIdNegocio
--	AND CREcct.fiIdTienda = CREs.fiIdTienda
--	AND CREcct.fiIdCliente = CREs.fiIdCliente
--LEFT JOIN credclientecliente CREcc with(nolock)
--	ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--	AND CREcc.fiIdTienda = CREs.fiIdTienda
--	AND CREcc.fiIdCliente = CREs.fiIdCliente	
--LEFT JOIN  CREDCliente CLI with(nolock)
--	ON CREcc.fiIdNegocio = CLI.fiIdNegocio
--	AND CREcc.fiIdTienda = CLI.fiIdTienda
--	AND CREcc.fiIdCliente = CLI.fiIdCliente
--LEFT JOIN  CREDPersona CREDP with(nolock)
--	ON CREDP.FIIDPERSONA = CLI.fiIdPersona
--	AND CREDP.FIIDTIPOPERSONA = 1 
--left join  CREDPersonaDomicilio CDP
--	ON CDP.fiIdPersona = CREDP.fiIdPersona
--LEFT JOIN CREDDomicilio CDPD
--	ON CDPD.fiIdDomicilio = CDP.fiIdDomicilio;

select top 10 * from EXTRACCIONES..ETL_ADN_TELEFONO_SOLICITUD;

/*************************************** LAE ***************************************/

-- use ADN;
--select
--	w.fiNoTienda,CREcct.fiCanal,CREcct.fiSucursal,CREcct.fiFolio,Cres.fiSubStat as EstadoSolicitud, 
--	CRES.fiSolicitudId,CRES.fiTipoSolicitud,convert(date,CRES.fdFecSolicitud) as fechaSolicitud,
--	case
--		when t.fcObservInv is not null then 1
--		else 0
--	end as MOC,
--	sco.fcColor	as ColoScore,sco.fcCredInmediato as CreditoInmediato,CDPD.fcCP,CDPD.fiPoblacion,CDPD.fiEstado,EST.fcEdoDesc as nombreEstado,pob.fcPobDesc as nombrePoblacion,CDPD.fcColonia as colonia
--	,CREDP.fiSexo,CREDP.fiEdoCivil,cpcp.fiEscolaridad,cpcp.fiCarrera,cpcp.fiGiroEmpresa,cpcp.fiIdOficio,cdeco.fiTipoVivienda  
--from control w,credsolicitud CREs with(nolock)
--inner join CREDClienteTienda CREcct with(nolock)
--	on CREcct.fiIdNegocio = CREs.fiIdNegocio
--	and CREcct.fiIdTienda = CREs.fiIdTienda
--	and CREcct.fiIdCliente = CREs.fiIdCliente
--left join credclientecliente CREcc with(nolock)
--	on CREcc.fiIdNegocio = CREs.fiIdNegocio
--	and CREcc.fiIdTienda = CREs.fiIdTienda
--	and CREcc.fiIdCliente = CREs.fiIdCliente	
--left join  CREDCliente CLI with(nolock)
--	on CREcc.fiIdNegocio = CLI.fiIdNegocio
--	and CREcc.fiIdTienda = CLI.fiIdTienda
--	and CREcc.fiIdCliente = CLI.fiIdCliente
--left join  CREDPersona CREDP with(nolock)
--	on CREDP.FIIDPERSONA = CLI.fiIdPersona
--	and CREDP.FIIDTIPOPERSONA = 1
--left join CENLineaDeCredito CEN with(nolock)
--	on CEN.fiNgcioId = CREcc.fiNgcioId
--	and CEN.fiNoTienda = CREcc.fiNoTienda
--	and CEN.fiCteId = CREcc.fiCteId
--	and CEN.fiDigitoVer = CREcc.fiDigitoVer	
--left join (select *,ROW_NUMBER() over(partition by fiPais,fiCanal,fiSucursal,fiFolio order by fdregistro asc) as cc from TACRCREDDecScoreFisco Sco with(nolock)) as sco
--	on sco.fiPais = CREcct.fiPais
--	and sco.fiCanal	= CREcct.fiCanal
--	and sco.fiSucursal = CREcct.fiSucursal
--	and sco.fiFolio	= CREcct.fiFolio
--	and sco.cc=1
--left join tacrcredinvestigacion T with(nolock)
--	on t.fiSolicitudId = CREs.fiSolicitudId
--	and t.fiInvestStat = 214
--left join  CREDPersonaDomicilio CDP
--	on CDP.fiIdPersona = CREDP.fiIdPersona
--left join CREDDomicilio CDPD
--	on CDPD.fiIdDomicilio=CDP.fiIdDomicilio 
--left join Estado EST
--	on EST.fiEdoId=CDPD.fiEstado 
--left join POBLACION pob
--	on pob.fiEdoId = EST.fiEdoId
--	and pob.fiPobId = CDPD.fiPoblacion 
--left join credpersonacomplemento cpcp 
--	on cpcp.fiIdPersona = CREDP.fiIdPersona
--left join CREDDatosEconomicos cdeco
--	on cdeco.fiIdPersona = CREDP.fiIdPersona
--WHERE
--	CREs.FITIPOSOLICITUD IN (8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--	146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--	203,210,211,215,216,217,218,220,222,223,224,237);

select top 10 * from EXTRACCIONES..ETL_dataFromAdnForLAE;

/*************************************** COBRANZA ***************************************/

-- use ADN;
--select
--	A.fiCanal CANAL_CU,A.fiSucursal SUCURSAL_CU,A.fiFolio FOLIO_CU
--	,E.fcNombre as Nombres_referencias,E.fcApPaterno as Apellidos_P_Referencia,E.fcAMaterno as Apellidos_M_Referencia
--	,E.fcTelefonoPersonal as Telefono_referencia,E.fcCorreoEMail as Correo_referencia
--from CENLineaDeCredito A with(nolock)
--inner join CREDClienteCliente B with(nolock)
--	on A.fiNgcioId = B.fiNgcioId
--	and A.fiNoTienda = B.fiNoTienda	
--	and A.fiCteId = B.fiCteId
--	and A.fiDigitoVer = B.fiDigitoVer
--left join CREDReferenciaCliente C
--	on	C.fiIdNegocio = B.fiIdNegocio 
--	and C.fiIdTienda = B.fiIdTienda 
--	and C.fiIdCliente = B.fiIdCliente
--left join CREDReferencia D
--	on D.fiReferenciaId= C.fiReferenciaId
--left join CREDPersona E with(nolock)
--	on E.fiIdPersona = D.fiIdPersona
--	and E.fiIdTipoPersona <> 1
--Where
--	year(A.fdFechaAlta) >= 2024
--	and E.fiIdPersona is not null;

select top 10 * from EXTRACCIONES..ETL_CU_REF_PERSONALES;

-- use ADN;
--select * from(
--	select CENldc.fiCanal,CENldc.fiSucursal,CENldc.fiFolio,doc.fnLatitud,doc.fnLongitud,CENldc.fdFechaAlta
--	from dbo.cenlineadecredito CENldc with(nolock)
--	inner join CredClienteCliente ccc with(nolock)
--		on ccc.fiNgcioId = CENldc.fiNgcioId
--		and ccc.fiNoTienda = CENldc.fiNoTienda
--		and ccc.fiCteId	= CENldc.fiCteId
--		and ccc.fidigitover	= CENldc.fidigitover
--		and ccc.fiIdCliente =(
--			select max(Y.fiIdCliente)
--			from credclientetienda Y with(nolock)
--			where 
--				Y.fiCanal = CENldc.fiCanal
--				and Y.fiSucursal = CENldc.fiSucursal
--				and Y.fiFolio =CENldc.fiFolio
--		)
--	inner join CredCliente cdc with(nolock)
--		on cdc.fiIdNegocio = ccc.fiIdNegocio
--		and cdc.fiIdTienda = ccc.fiIdTienda
--		and cdc.fiIdCliente = ccc.fiIdCliente	
--	inner join credpersona cp with(nolock)
--		on cp.fiIdPersona =	cdc.fiIdPersona
--	inner join CREDPersonaDomicilio cpd with(nolock)
--		on cpd.fiIdPersona = cp.fiIdPersona
--	inner join CREDDomicilio doc
--		on doc.fiIdDomicilio = cpd.fiIdDomicilio
--) as a
--where
--	a.fnLatitud <> 0
--	and a.fnLongitud <> 0
--	and a.fdFechaAlta >= '2024-01-01';

select top 10 * from EXTRACCIONES..CLIENTE_GEO;

-- use ADN;
--select
--	A.fiCanal CANAL_CU,A.fiSucursal SUCURSAL_CU,A.fiFolio FOLIO_CU,I.FCDPI DPI
--	,D.fcCorreoEMail as CorreoCliente
--from CENLineaDeCredito A with(nolock)
--left join CREDClienteCliente B with(nolock)
--	on A.fiNgcioId = B.fiNgcioId
--	and A.fiNoTienda = B.fiNoTienda	
--	and A.fiCteId = B.fiCteId
--	and A.fiDigitoVer = B.fiDigitoVer
--left join CREDCliente C with(nolock)
--	on C.fiIdNegocio = B.fiIdNegocio	
--	and	C.fiIdTienda = B.fiIdTienda
--	and C.fiIdCliente = B.fiIdCliente
--left join CREDPersona D with(nolock)
--	on D.fiIdPersona = C.fiIdPersona
--	and D.fiIdTipoPersona = 1
--left join CREDInfoAdicional I with(nolock)
--	on D.fiIdPersona = I.fiIdPersona
--	and D.fiIdTipoPersona = 1
--Where len(I.FCDPI) = 13 and year(A.fdFechaAlta) >= 2024;

select top 10 * from EXTRACCIONES..ETL_CU_DPI;

-- use ADN;
--select
--	a.fiNoTienda,b.fiNoPedido,c.fiPais,c.fiCanal,c.fiSucursal,c.fiFolio,c.fiTir,B.fdFecMovtoPed
--from control a, MOVIMIENTO_PEDIDO b
--left join CredClienteUnicoPedido c
--	on b.fiNoPedido = c.finopedido
--where b.fiTipoOp = 435 and year(b.fdFecMovtoPed) >= 2024;

select top 10 * from EXTRACCIONES..ETL_RMD_FROM_MOV_PEDIDO;

/*************************************** solicitud y pcj ***************************************/

-- use ADN;
--select * from(
--	select fiCanal,fiSucursal,fiFolio,fdactualiza from TACRBITACORALCR
--	where ltrim(rtrim(fcValor)) like '%PCJ%'
--) as x;

select top 10 * from EXTRACCIONES..ETL_FROMADN_REGPCJ;

-- use ADN;
--select * from(
--	select fiCanal,fiSucursal,fiFolio,fdactualiza, fcValor from TACRBITACORALCR
--	where ltrim(rtrim(fcValor)) like '%RMD%'
--) as x;

select top 10 * from EXTRACCIONES..ETL_FROMADN_REGRMD;

-- use ADN;
--select
--	CREcct.fiCanal,CREcct.fiSucursal,CREcct.fiFolio,Cres.fiSubStat as EstadoSolicitud
--	,CRES.fiSolicitudId,CRES.fiTipoSolicitud,CRES.fdFecSolicitud,case when t.fcObservInv is not null then 1 else 0 end as MOC
--from credsolicitud CREs WITH(NOLOCK)
--inner join CREDClienteTienda CREcct with(nolock)
--	on CREcct.fiIdNegocio = CREs.fiIdNegocio
--	and CREcct.fiIdTienda = CREs.fiIdTienda
--	and CREcct.fiIdCliente = CREs.fiIdCliente
--left join credclientecliente CREcc with(nolock)
--	ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--	and CREcc.fiIdTienda = CREs.fiIdTienda
--	and CREcc.fiIdCliente = CREs.fiIdCliente	
--left join  CREDCliente CLI with(nolock)
--	ON CREcc.fiIdNegocio = CLI.fiIdNegocio
--	and CREcc.fiIdTienda = CLI.fiIdTienda
--	and CREcc.fiIdCliente = CLI.fiIdCliente
--left join tacrcredinvestigacion T with(nolock)
--	ON t.fiSolicitudId = CREs.fiSolicitudId
--	and t.fiInvestStat = 214
--WHERE CREs.FITIPOSOLICITUD in(14,76);

select top 10 * from EXTRACCIONES..ETL_FROMADN_REG_SOL_7614;

-- use ADN;
--select c.fiNoTienda,nd.* from control c,TaCrBitPedidosNDOriginacion nd
--where nd.fiPlataformId = 3;

select top 10 * from EXTRACCIONES..ETL_RESTITUIDOS;

/*************************************** Bloqueados Post ***************************************/

-- use ADN;
--select
--	p.fiCanal,p.fiSucursal,p.fiFolio,fdactualiza,fcValor
--	,row_number()over(partition by X.fiPais,X.fiCanal,X.fiSucursal,X.fiFolio order by X.fifolio desc) as YY
--from(
--	select
--		FiPais,FiCanal,FiSucursal,FiFolio
--		,convert(date,min(FdProceso)) as Fecha_ini
--		,convert(date, dateadd(wk,1,min(FdProceso))) as Fecha_fin 
--	from TACRBitCambiosLCR 
--	--where fifolio=38010 
--	group by FiPais,FiCanal,FiSucursal,FiFolio
--) as x
--inner join TACRBitacoralcr P
--	on P.FiPais	= x.FiPais	
--	and P.FiCanal = x.FiCanal	
--	and P.FiSucursal = x.FiSucursal	
--	and P.FiFolio = x.FiFolio		
--	and convert(date,P.fdactualiza) between x.Fecha_ini and x.Fecha_fin
--	and P.fiCenActual = 3;

select top 10 * from EXTRACCIONES..ETL_ADN_BLOQ_POST_SURTIMIENTO;

/*************************************** cancelacions pre y post entrega cred ***************************************/

-- use ADN;
--select
--	cu.fiCanal as canalcu
--	,cu.fiSucursal as sucursalcu
--	,cu.fiFolio as foliocu
--	,c.fiNoTienda as sucursal_pedido
--	,mov.fiNoPedido as pedido
--	,mov.fiTipoOp as tipo_mov_cancelacion
--	,mov.fdFecMovtoPed as fecha_movimiento	
--from control c, movimiento_pedido mov
--left join CredClienteUnicoPedido cu
--	ON cu.finopedido = mov.fiNoPedido
--where fiTipoOp in(11,26);

select top 10 * from EXTRACCIONES..ETL_CANCELACION_PEDS_PRE_POST;

/*************************************** erd ***************************************/

-- use ADN;
--SELECT
--	CREcct.fiPais,
--	CREcct.fiCanal,
--	CREcct.fiSucursal,
--	CREcct.fiFolio,
--	Cres.fiSubStat AS EstadoSolicitud,
--	CEN.fiStatus AS EstatusLCR,
--	CREDP.fdFechaAlta,
--	CRES.fiSolicitudId,
--	CRES.fiTipoSolicitud,
--	CRES.fdFecSolicitud,
--	--LTRIM(RTRIM(c.fcCteNombre)) + ' ' + LTRIM(RTRIM(c.fcCteAPaterno)) + ' ' + LTRIM(RTRIM(c.fcCteAMaterno)) AS NombreCliente,
--	--fcEmpNo AS Empleado_imprimio,
--	CASE
--		WHEN t.fcObservInv IS NOT NULL THEN 1
--		ELSE 0
--	END AS MOC,
--	sco.fcColor	AS ColoScore,
--	sco.fcCredInmediato AS CreditoInmediato,
--	ISNULL(CREa.fiAvalId,0) AS TieneAval,	
--	--CASE
--	--	WHEN inm.fiTipoSolicitud = 238 THEN 1
--	--	ELSE 0
--	--END AS CreditoInmediatoSQL,
--	--CDLDC.fnCapacidadPago,
--	--CDLDC.fnCapacidadPagoDisp,
--	--yc.fnCPActual PrimerCapacidad,
--	CREDP.fdFechaNacimiento,
--	sco.fiProdId	, ci22.fcObservInv,	ci223.fcObservInv fcObservInv_238,inm.fiSubStat AS EstadoSolicitud_238
--	--,0 FechaImpresion,
--	--invest.fcObservInv AS Descrp
--FROM
--	credsolicitud CREs WITH(NOLOCK)
--	INNER JOIN CREDClienteTienda CREcct WITH(NOLOCK)
--		on CREcct.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcct.fiIdTienda = CREs.fiIdTienda
--		AND CREcct.fiIdCliente = CREs.fiIdCliente
--	LEFT JOIN credclientecliente CREcc WITH(NOLOCK)
--		ON CREcc.fiIdNegocio = CREs.fiIdNegocio
--		AND CREcc.fiIdTienda = CREs.fiIdTienda
--		AND CREcc.fiIdCliente = CREs.fiIdCliente	
--	LEFT JOIN  CREDCliente CLI WITH(NOLOCK)
--		ON CREcc.fiIdNegocio = CLI.fiIdNegocio
--		AND CREcc.fiIdTienda = CLI.fiIdTienda
--		AND CREcc.fiIdCliente = CLI.fiIdCliente
--	LEFT JOIN  CREDPersona CREDP WITH(NOLOCK)
--		ON CREDP.FIIDPERSONA = CLI.fiIdPersona
--		AND CREDP.FIIDTIPOPERSONA = 1
--	--LEFT JOIN CREDLineaDeCredito CDLDC
--	--	ON CDLDC.ficanal	= CREcct.ficanal
--	--	AND CDLDC.fisucursal=CREcct.fisucursal
--	--	AND CDLDC.fifolio	=CREcct.fifolio
--	LEFT JOIN credavalcliente CREac WITH(NOLOCK)
--		ON CREac.fiIdNegocio = CREcc.fiIdNegocio 
--		AND CREac.fiIdTienda = CREcc.fiIdTienda 
--		AND CREac.fiIdCliente = CREcc.fiIdCliente				
--	LEFT JOIN credaval CREa
--		ON CREa.fiAvalId = CREac.fiAvalId
--	--LEFT JOIN  cliente c WITH(NOLOCK)
--	--	ON c.fiNgcioId = CREcc.fiNgcioId
--	--	AND c.fiNoTienda = CREcc.fiNoTienda
--	--	AND c.fiCteId = CREcc.fiCteId
--	--	AND c.fiDigitoVer = CREcc.fiDigitoVer
--	LEFT JOIN CENLineaDeCredito CEN WITH(NOLOCK)
--		ON CEN.fiNgcioId = CREcc.fiNgcioId
--		AND CEN.fiNoTienda = CREcc.fiNoTienda
--		AND CEN.fiCteId = CREcc.fiCteId
--		AND CEN.fiDigitoVer = CREcc.fiDigitoVer	
--	LEFT JOIN TACRCREDDecScoreFisco Sco WITH(NOLOCK)
--		ON sco.fiPais = CREcct.fiPais
--		AND sco.fiCanal	= CREcct.fiCanal
--		AND sco.fiSucursal = CREcct.fiSucursal
--		AND sco.fiFolio	= CREcct.fiFolio
--		AND sco.fdRegistro >= '2023-01-01 00:00:00'
--	--LEFT JOIN CREDInvestigacion invest
--	--	ON invest.fiSolicitudId = CREs.fiSolicitudId
--	--	AND nvest.fiInvestStat = 5
--	LEFT JOIN tacrcredinvestigacion T WITH(NOLOCK)
--		ON t.fiSolicitudId = CREs.fiSolicitudId
--		AND t.fiInvestStat = 214
--	LEFT JOIN	credsolicitud inm
--		ON inm.fiidnegocio=CREs.fiidnegocio
--		AND inm.fiidtienda=CREs.fiidtienda
--		AND inm.fiidcliente=CREs.fiidcliente
--		AND inm.fiTipoSolicitud =238		
--	--LEFT JOIN CREDBITCAPPAGOTR yc
--	--	ON yc.fiPais = CREcct.fiPais
--	--	AND yc.fiCanal = CREcct.fiCanal
--	--	AND yc.fiSucursal = CREcct.fiSucursal
--	--	AND yc.fiFolio = CREcct.fiFolio
--	--	AND yc.fdFecha = (
--	--		SELECT
--	--			MIN(y.fdFecha)
--	--		FROM CREDBITCAPPAGOTR y
--	--		WHERE
--	--			y.fiCanal=yc.fiCanal
--	--			AND y.fiSucursal=yc.fiSucursal
--	--			AND y.fifolio=yc.fifolio
--	--		)
--		left join credinvestigacion ci22
--		on ci22.fiSolicitudId=CREs.fisolicitudid
--		and ci22.fiinveststat =9
--		left join credinvestigacion ci223
--		on ci223.fiSolicitudId=inm.fisolicitudid
--		and ci223.fiinveststat =9
--WHERE
--	CREs.fdFecSolicitud >= '2020-01-01 00:00:00'
--	AND CREs.FITIPOSOLICITUD IN (8,9,10,23,27,40,41,42,43,51,53,63,46,71,75,82,90,91,92,93,94,95,140,141,234,143,144,
--		146,147,148,154,227,156,175,108,109,110,159,176,180,181,182,184,185,186,187,188,189,190,195,201,171,172,202,
--		203,210,211,215,216,217,218,220,222,223,224,237);

select top 10 * from EXTRACCIONES..ETL_ADN_solicitudesWithMotivoRechazo;

-------------------------------------- Quemado en tabla solicitudes --------------------------------------
-------------------------------------- Quemado en tabla solicitudes --------------------------------------

--SELECT *, NULL AS cc FROM [EXTRACCIONES].[dbo].[ETL_ADN_Renovaciones] A
--WHERE NOT EXISTS(
--	SELECT * FROM [EXTRACCIONES].[dbo].[PROC_RENOVACION] B
--	WHERE
--		B.ficanalcu = A.ficanalcu
--		AND B.fisucursalcu = A.fisucursalcu
--		AND B.fifoliocu = A.fifoliocu
--		AND B.fiNoTiendaS = A.fiNoTiendaS
--		AND B.PedidoPrestamoRenovado = A.PedidoPrestamoRenovado
--	);

select top 10 * from EXTRACCIONES..PROC_RENOVACION;

--select
--	*,
--	CAST(GETDATE() AS DATE) AS Fecha_insert
--from EXTRACCIONES.dbo.ETL_cancelaciones;

select top 10 * from EXTRACCIONES..PROC_ADN_CANCELACIONES;

--select
--	* ,
--	CAST(GETDATE() AS DATE) AS FechaInsert
--from [EXTRACCIONES].[dbo].[ETL_ExtraADNpedidos] A
--WHERE NOT EXISTS(
--	select 1 from [EXTRACCIONES].[dbo].[Proc_ADNPedidoVendedor_Hist] B
--	WHERE
--		B.canalcu = A.canalcu
--		AND B.sucursalcu = A.sucursalcu
--		AND B.foliocu = A.foliocu
--		AND B.pedido = A.pedido
--	)
--	AND a.foliocu IS NOT NULL;

select top 10 * from EXTRACCIONES..Proc_ADNPedidoVendedor_Hist;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from(
--	select
--		z.*,
--		emp.nombre AS NombreEjecutivo,
--		empAut.nombre AS NombreAutorizador,
--		empInves.nombre AS NombreInvestigador
--	from(
--		select * from(
--			select *, ROW_NUMBER() OVER (PARTITION BY ClienteUnico, fiSolicitudId, EmpEjecutivo ORDER BY fiSolicitudId) AS CC
--			from [EXTRACCIONES].[dbo].[ETL_SolicutesFROMADN]
--		) AS a
--		WHERE a.cc = 1
--	) AS z
--	LEFT JOIN OPERACION.dbo.CAT_EMPLEADO emp
--		ON LTRIM(RTRIM(CAST(emp.NoEMp AS VARCHAR(10)))) = LTRIM(RTRIM(CAST(z.EmpEjecutivo AS VARCHAR(10))))
--	LEFT JOIN OPERACION.dbo.CAT_EMPLEADO empAut
--		ON LTRIM(RTRIM(CAST(empAut.NoEMp AS VARCHAR(10)))) = LTRIM(RTRIM(CAST(z.EmpAutoriza AS VARCHAR(10))))
--	LEFT JOIN OPERACION.dbo.CAT_EMPLEADO empInves
--		ON LTRIM(RTRIM(CAST(empInves.NoEMp AS VARCHAR(10)))) = LTRIM(RTRIM(CAST(z.noempInvestiga AS VARCHAR(10))))
--) AS a
--WHERE NOT EXISTS(
--	select 1 from [EXTRACCIONES].[dbo].PROC_ADNSolictudHist_actor B
--	WHERE
--		a.ClienteUnico = b.ClienteUnico
--		AND a.fisolicitudid = b.fisolicitudid
--	);

select top 10 * from EXTRACCIONES..PROC_ADNSolictudHist_actor;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from ETL_ADN_PedidoCancAnticipado E
--WHERE NOT EXISTS(
--	select 1 from PROC_ADN_PedidoCancAnticipado y
--	WHERE
--		y.fiidcanal = e.fiidcanal
--		AND y.finotienda = E.finotienda
--		AND y.finopedido = e.finopedido
--	);

select top 10 * from EXTRACCIONES..PROC_ADN_PedidoCancAnticipado;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert 
--from EXTRACCIONES.dbo.ETL_FROMADN_MOCSOLICITUD a
--WHERE NOT EXISTS(
--	select 1 from EXTRACCIONES.dbo.PROC_FROMADN_MOC_SOLICITUD y
--	WHERE
--		y.ficanal = a.fiCanal
--		AND y.fiSucursal = a.fiSucursal
--		AND y.fiFolio = a.fiFolio
--		AND y.fiSolicitudId=a.fiSolicitudId
--	);

select top 10 * from EXTRACCIONES..PROC_FROMADN_MOC_SOLICITUD; -- LISTO EN DW

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from EXTRACCIONES.dbo.ETL_CUENTASCAPTACION a 
--WHERE NOT EXISTS(
--	select 1 from EXTRACCIONES.dbo.PROC_CUENTAS_CAPTACION y 
--	WHERE
--		y.fcFolioIdentificacion = a.fcFolioIdentificacion
--		AND y.fcNumeroCuenta = a.fcNumeroCuenta
--	);

select top 10 * from EXTRACCIONES..PROC_CUENTAS_CAPTACION;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from EXTRACCIONES.[dbo].ETL_FROMAND_PEDIDOALL a
--WHERE NOT EXISTS(
--	select 1 from [dbo].PROC_FROMAND_PEDIDOALL y
--	WHERE
--		y.CANALCU = a.canalcu
--		AND y.SUCURSALCU = a.sucursalcu
--		AND y.FOLIOCU = a.foliocu
--		AND y.PEDIDO = a.pedido
--	);

select top 10 * from EXTRACCIONES..PROC_FROMAND_PEDIDOALL;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert  
--from EXTRACCIONES.dbo.ETL_RMD_FROM_ADN a
--WHERE NOT EXISTS(
--	select 1 from EXTRACCIONES.dbo.PROC_RMD_FROM_ADN y 
--	WHERE
--		y.fisucursal = a.fisucursal
--		AND y.fifolio = a.fifolio
--		AND y.finopedido = a.finopedido
--	);

select top 10 * from EXTRACCIONES..PROC_RMD_FROM_ADN;

--select * from EXTRACCIONES.dbo.ETL_PedidoForaneoFromADN A
--WHERE NOT EXISTS(
--	select 1 from EXTRACCIONES.dbo.PROC_PedidoForaneoFromADN B
--	WHERE
--		a.finopedidovend = b.finopedidovend
--		AND a.finotiendavend=b.finotiendavend
--	);

select top 10 * from EXTRACCIONES..PROC_PedidoForaneoFromADN;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from ETL_ADN_CLIBLOQUEADO A
--WHERE NOT EXISTS(
--	select 1 from PROC_ADN_CLIBLOQUEADO B
--	WHERE
--		a.ficanal = b.ficanal
--		AND a.fisucursal = b.fisucursal
--		AND a.fifolio = b.fifolio
--	);

select top 10 * from EXTRACCIONES..PROC_ADN_CLIBLOQUEADO;

--select *, CAST(GETDATE() AS DATE) AS FechaInsert
--from ETL_abonosJC A
--WHERE NOT EXISTS(
--	select 1 from PROC_abonosJCFromADN B
--	WHERE
--		b.fecha=a.fecha
--		AND b.ficanalid = a.ficanalid
--		AND b.finotienda = a.finotienda
--		AND b.finopedido = a.finopedido
--	);

select top 10 * from EXTRACCIONES..PROC_abonosJCFromADN;

--select *, GETDATE() AS FechaInsert
--from EXTRACCIONES.dbo.ETL_TelefonoCuActulizado a
--WHERE NOT EXISTS(
--	select * from extracciones.dbo.PROC_TelefonoCuActulizado_ADN y
--	WHERE
--		y.fiSucursal = a.fisucursal
--		AND y.fiFolio = a.fifolio	
--		AND y.fcTelCasa	= a.fcTelCasa
--		AND y.fcTelCelular = a.fcTelCelular
--	);

select top 10 * from EXTRACCIONES..PROC_TelefonoCuActulizado_ADN;

-- select * from EXTRACCIONES.dbo.CLIENTE_GEO X with(nolock)

select top 10 * from EXTRACCIONES..PROC_GEOCLIENTE;

--select
--	fiNoTienda,
--	fiMarcaId,
--	fiSolicitudId,
--	fiSubStat,
--	fcEmpNo,
--	fdRegistro,
--	fcObservacion,
--	fiTranno,
--	CAST(GETDATE() AS DATE) AS Fecha_Insert
--from EXTRACCIONES.dbo.ETL_TACRMarcasSolLAM A
--WHERE NOT EXISTS(
--	select 1 from EXTRACCIONES.dbo.PROC_ETL_TACRMarcasSolLAM B
--	WHERE
--		B.fiNoTienda = A.fiNoTienda
--		AND B.fiMarcaId = A.fiMarcaId
--		AND B.fiSolicitudId = A.fiSolicitudId
--);

select top 10 * from EXTRACCIONES..PROC_ETL_TACRMarcasSolLAM;

--select
--	X.*,
--	CAST(GETDATE() AS DATE) AS FechaInsert 
--from EXTRACCIONES.dbo.ETL_SOLICTUD_RESCATE X with(nolock)
--WHERE not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_SOLICITUD_RESCATE Y
--	WHERE
--		X.CANALCU = Y.CANALCU
--		AND X.SUCURSAL_CU = Y.SUCURSAL_CU
--		AND X.FOLIOCU =Y.FOLIOCU
--		and x.fiSolicitudId = y.fiSolicitudId
--	);

select top 10 * from EXTRACCIONES..PROC_SOLICITUD_RESCATE;

--select
--	distinct
--	*
--	,NULL as clasificacion
--	,NULL as estatus
--	,NULL as familia
--	,NULL as linea
--	,NULL as sublinea
--	,NULL as categoria
--from EXTRACCIONES.dbo.ETL_CAT_PRODUCTO_PASO A
--where not exists(
--	select 1 from OPERACION.DBO.CAT_PRODUCTO B
--	where A.fiProdId = B.fiProdId
--);

select top 10 * from OPERACION..Cat_Producto;

--select *,CONVERT(DATE,GETDATE()) Fechainsert
--from EXTRACCIONES.DBO.ETL_FROMADN_REGPCJ A with (nolock)
--where not exists(
--	select 1 from EXTRACCIONES.DBO.PROC_FROM_ADN_REGPCJ Y
--	where
--		Y.fiCanal = A.fiCanal
--		and Y.fiSucursal = A.fiSucursal
--		and Y.fiFolio = A.fiFolio
--);

select top 10 * from EXTRACCIONES..PROC_FROM_ADN_REGPCJ;

--select *,CONVERT(DATE,GETDATE()) Fechainsert
--from EXTRACCIONES.DBO.ETL_FROMADN_REG_SOL_7614 A with (nolock)
--where not exists(
--	select 1 from EXTRACCIONES.DBO.PROC_FROM_ADN_REG_SOL_7614 Y
--	where
--		Y.fiCanal = A.fiCanal
--		and Y.fiSucursal = A.fiSucursal
--		and Y.fiFolio = A.fiFolio
--		and A.fiSolicitudId = Y.fiSolicitudId
--);

select top 10 * from EXTRACCIONES..PROC_FROM_ADN_REG_SOL_7614;

--select *,CONVERT(DATE,GETDATE()) Fechainsert
--from EXTRACCIONES.dbo.ETL_FROMADN_REGRMD A with (nolock)
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_FROMADN_REGRMD Y
--	where
--		Y.fiCanal = A.fiCanal
--		and Y.fiSucursal = A.fiSucursal
--		and Y.fiFolio = A.fiFolio
--		and convert(Date,A.fdactualiza) = convert(date,Y.fdactualiza)
--	);

select top 10 * from EXTRACCIONES..PROC_FROMADN_REGRMD;

--select Y.*, convert(date,GETDATE()) FechaInsert
--from EXTRACCIONES.dbo.ETL_CU_REF_PERSONALES y with(nolock)
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_CU_REF_PERSONALES Z
--	where
--		y.CANAL_CU = z.CANAL_CU  
--		and y.SUCURSAL_CU = z.SUCURSAL_CU	
--		and y.FOLIO_CU = z.FOLIO_CU
--	);

select top 10 * from EXTRACCIONES..PROC_CU_REF_PERSONALES;

--select *, convert(date,GETDATE()) FechaInsert
--from EXTRACCIONES.dbo.ETL_CU_AVAL Y with(nolock)
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_CU_AVAL	Z
--	where
--		y.CANAL_CU = z.CANAL_CU  
--		and y.SUCURSAL_CU = z.SUCURSAL_CU	
--		and y.FOLIO_CU = z.FOLIO_CU
--	);

select top 10 * from EXTRACCIONES..PROC_CU_AVAL;

--select *, convert(date,GETDATE()) FechaInsert
--from EXTRACCIONES.dbo.ETL_CU_DPI Y with(nolock)
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_CU_DPI Z
--	where
--		y.CANAL_CU = z.CANAL_CU  
--		and y.SUCURSAL_CU = z.SUCURSAL_CU	
--		and y.FOLIO_CU = z.FOLIO_CU
--	);

select top 10 * from EXTRACCIONES..PROC_CU_DPI;

select *,convert(date, getdate())FechaInsert from EXTRACCIONES.dbo.ETL_FROMADN_TACRMarcasSolicitud A with(nolock)
where not exists(
	select 1 from EXTRACCIONES.dbo.PROC_FROMADN_TACRMarcasSolicitud B with(nolock)
	where
		A.fiSolicitudId = B.fiSolicitudId
		and A.fiCanal = B.fiCanal
		and A.fiSucursal = B.fiSucursal
		and A.fiFolio = B.fiFolio
	);

select top 10 * from EXTRACCIONES..PROC_FROMADN_TACRMarcasSolicitud;

-------------------------------------- LAE --------------------------------------
-------------------------------------- LAE --------------------------------------

--select *,cast(getdate() as date)FechaInsert from EXTRACCIONES.DBO.ETL_dataFromAdnForLAE x
--where not exists(
--	select 1 from EXTRACCIONES.DBO.PROC_dataFromAdnForLAE z
--	where
--		z.fiNoTienda = x.fiNoTienda
--		and z.fisucursal = x.fisucursal
--		and z.fifolio = x.fifolio
--		and z.fiSolicitudid = x.fiSolicitudid
--	);

select top 10 * from EXTRACCIONES..PROC_dataFromAdnForLAE;

-------------------------------------- Quemado2025 --------------------------------------
-------------------------------------- Quemado2025 --------------------------------------

--select *,cast(getdate() as date)FechaInsert from EXTRACCIONES.dbo.ETL_ADN_ventaTDC x
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_ADN_ventaTDC z
--	where
--		z.Pedido = x.Pedido
--		and z.FacturaNo = x.FacturaNo
--		and z.fiNoTienda = x.fiNoTienda
--	);

select top 10 * from EXTRACCIONES..PROC_ADN_ventaTDC;

--select *, convert(date,getdate())f from extracciones.dbo.ETL_DatosClienteCredito A
--where not exists(
--	select 1 from extracciones.dbo.PROC_DatosClienteCredito B
--		where
--			a.fiNoTienda = b.fiNoTienda
--			and a.fiCteId = b.fiCteId
--			and a.fiDigitoVer = b.fiDigitoVer
--	);

select top 10 * from EXTRACCIONES..PROC_DatosClienteCredito;

--select *,cast(GETDATE() as date)Fechainsert from EXTRACCIONES.dbo.ETL_RMD_FROM_MOV_PEDIDO A
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_RMD_FROM_MOV_PEDIDO B
--	where 
--		A.fiNoTienda =	B.fiNoTienda
--		and A.fiNoPedido = B.fiNoPedido
--		and A.fiCanal = B.fiCanal
--		and A.fiSucursal = B.fiSucursal
--		and A.fiFolio = B.fiFolio
--	);

select top 10 * from EXTRACCIONES..PROC_RMD_FROM_MOV_PEDIDO;

--select *, convert(date,GETDATE())FechaInsert from EXTRACCIONES.dbo.ETL_PROC_SOL_CAMBIO_DOMICILIO A
--where not exists(
--	select 1 from EXTRACCIONES.dbo.PROC_SOL_CAMBIO_DOMICILIO Y
--	where
--		A.fiNoTienda = Y.fiNoTienda
--		and A.fiSolicitudId = Y.fiSolicitudId
--	);

select top 10 * from EXTRACCIONES..PROC_SOL_CAMBIO_DOMICILIO;

--select *, convert(date,getdate())FechaInsert from ETL_ADN_BLOQ_POST_SURTIMIENTO A
--where not exists(
--	select 1 from PROC_ADN_BLOQ_POST_SURTIMIENTO B
--	where 
--		A.fiCanal = B.fiCanal
--		and A.fiSucursal = B.fiSucursal
--		and A.fiFolio = B.fiFolio
--		and convert(date,A.fdactualiza)	= convert(date,B.fdactualiza)
--	);

select top 10 * from EXTRACCIONES..PROC_ADN_BLOQ_POST_SURTIMIENTO;

--select * from ETL_CANCELACION_PEDS_PRE_POST a
--where not exists(
--	select 1 from PROC_CANCELACION_PEDS_PRE_POST b
--	where b.sucursal_pedido = a.sucursal_pedido
--	and b.pedido = a.pedido	
--);

select top 10 * from EXTRACCIONES..PROC_CANCELACION_PEDS_PRE_POST;

-------------------------------------- Politicas --------------------------------------
-------------------------------------- Politicas --------------------------------------

-- A la última solicitud del cliente se le pega el monto colocado en un perioro de 90 días
--select * from(
--	select
--		c.fiPais,
--		c.fiCanal,
--		c.fiSucursal,
--		c.fiFolio,
--		SUM(FDCSALDOORIGINAL) - SUM(FDCINTXFINANCIAR) AS MontoColocado90
--	from(
--		select *, ROW_NUMBER() OVER(PARTITION BY fiPais,fiCanal,fiSucursal,fiFolio ORDER BY fdfecsolicitud DESC) AS CC
--		from EXTRACCIONES.dbo.PROC_FROMADN_MOC_SOLICITUD
--	) AS c
--	INNER JOIN ALMACENRISK.dbo.TemporalDiario t
--		ON t.FISUCURSALCU = c.fiSucursal
--		AND t.FIFOLIO = c.fiFolio
--		AND t.FICANALCU = c.fiCanal
--		AND t.FDFECHASURT BETWEEN fdFecSolicitud
--		AND DATEADD(dd,90,fdFecSolicitud)
--		AND t.FIUNIDADNEGOCIO IN (4,83,159)
--	INNER JOIN EXTRACCIONES.dbo.PROC_FROMAND_PEDIDOALL pp
--		ON t.FISUCURSAL = pp.SUCURSAL
--		AND t.FINOPEDIDO = pp.pedido
--	WHERE
--		c.CC = 1
--		AND fcProdDesc NOT LIKE '%seguro%'
--		AND fcProdDesc NOT LIKE '%vidamax%'
--	GROUP BY
--		c.fiPais,
--		c.fiCanal,
--		c.fiSucursal,
--		c.fiFolio
--) AS A;

select top 10 * from POLITICAS2020..TempTempPrestamos90;

-- Deja el primer registro de RMD del cliente
--select
--	*,
--	CAST(YEAR(FDFECSURT) AS VARCHAR(4)) + '-' + RIGHT('00' + CAST(MONTH(FDFECSURT) AS VARCHAR(2)),2) AS PERIODO_COSECHA,
--	CASE
--		WHEN DATEADD(MM,-1,REGISTRO) < FDFECSURT THEN CAST(YEAR(FDFECSURT) AS VARCHAR(4)) + '-' + RIGHT('00' + CAST(MONTH(FDFECSURT) AS VARCHAR(2)),2)
--		ELSE CAST(YEAR(DATEADD(MM,-1,REGISTRO)) AS VARCHAR(4)) + '-' + RIGHT('00' + CAST(MONTH(DATEADD(MM,-1,REGISTRO)) AS VARCHAR(2)),2)
--	END AS PERIODO_RMD
--from(
--	select *, ROW_NUMBER() OVER(PARTITION BY fiCanal,fiSucursal,fiFolio,finopedido ORDER BY Registro ASC) AS cc
--	from EXTRACCIONES.dbo.PROC_RMD_FROM_ADN
--) AS a
--WHERE a.CC = 1;

select top 10 * from EXTRACCIONES..PROC_RMD_ADN_CLEAN;

-------------------------------------- consolidado --------------------------------------
-------------------------------------- consolidado --------------------------------------

-- A la última solicitud del cliente se le pega el último pedido que ha tenido
--select
--	sol.*,
--	ped.PEDIDO,
--	ped.fiplazo,
--	ped.FechaSurt,
--	ped.UnidadNegocio,
--	pda.MontoPedido,
--	pda.Enganche,
--	pda.PrecioArticulos,
--	ped.fcProdDesc,
--	ped.fiDepto,
--	ped.fiSubDepto,
--	l.Region2,
--	CASE
--		WHEN l.Region2 NOT LIKE '%metro%' OR l.Sucursal4dig IN (7811,4074,4067,7814) THEN 'Interior'
--		ELSE 'Metro'
--	END AS RegionPolitica,
--	l.Pais,
--	l.nombreAgencia,
--	l.Departamento,
--	l.Latitud,
--	l.Longitud,
--	DATEDIFF(YY,sol.fdfechaNacimiento,sol.fdfecSolicitud) AS EdadCliente,
--	l.sucursal4dig AS NoEconomico,
--	ISNULL(PV.fcEmpNo,0) AS CodigoVendedor,
--	ISNULL(CASE WHEN PV.fcEmpNo = 117 THEN 'MultiCanal' ELSE CAST(cat.Nombre AS VARCHAR(200))END,'') AS NombreEmpleado
--from(
--	select * from(
--		select
--			*,
--			CASE fiprodid 
--				WHEN 21 THEN 'Consumo'
--				WHEN 22 THEN 'Italika'
--				WHEN 23 THEN 'Telefonia'
--				WHEN 24 THEN 'Prestamo Personal'
--				WHEN 25 THEN 'Tarjeta'
--				WHEN 26 THEN 'Chapin'
--				WHEN 3 THEN 'Italika'
--				WHEN 4 THEN 'Consumo'WHEN 5 THEN 'Prestamos Menores'
--				WHEN 6 THEN 'Prestamos Mayores'
--				WHEN 7 THEN 'Prestamos Unificada'
--			END AS ProductoOriginacion,
--			ROW_NUMBER() OVER(PARTITION BY fiPais,fiCanal,fiSucursal,fiFolio ORDER BY fdFecSolicitud DESC) AS Cs
--		from EXTRACCIONES.dbo.PROC_FROMADN_MOC_SOLICITUD
--	) AS t
--	WHERE t.Cs = 1
--) AS sol
--LEFT JOIN(
--	select * from(
--		select *, ROW_NUMBER() OVER(PARTITION BY canalcu,sucursalcu,foliocu ORDER BY fechaSurt ASC,montocolocado DESC) AS cp 
--		from EXTRACCIONES.dbo.PROC_FROMAND_PEDIDOALL
--		WHERE fcProdDesc NOT LIKE '%seguro%'
--	) AS p
--	WHERE p.cp = 1
--) AS ped
--	ON ped.CANALCU = sol.fiCanal
--	AND ped.SUCURSALCU = sol.fiSucursal
--	AND ped.FOLIOCU = sol.fiFolio
--LEFT JOIN(
--	select
--		CANALCU,
--		SUCURSALCU,
--		FOLIOCU,
--		SUCURSAL,
--		PEDIDO,
--		SUM(MontoColocado) AS MontoPedido,
--		SUM(Enganche) AS Enganche,
--		(SUM(precio) - SUM(descuento)) AS PrecioArticulos
--	from EXTRACCIONES.dbo.PROC_FROMAND_PEDIDOALL
--	GROUP BY
--		CANALCU,
--		SUCURSALCU,
--		FOLIOCU,
--		SUCURSAL,
--		PEDIDO
-- ) AS pda
--	ON pda.CANALCU=ped.CANALCU
--	AND pda.SUCURSALCU=ped.SUCURSALCU
--	AND pda.FOLIOCU=ped.FOLIOCU
--	AND pda.SUCURSAl=ped.SUCURSAL
--	AND pda.PEDIDO=ped.PEDIDO
--LEFT JOIN ALMACENRISK.dbo.LAMAgencia l
--	ON l.sucursal4dig = sol.fisucursal
--	AND l.Canal <> 'Gcc'
--LEFT JOIN EXTRACCIONES.dbo.Proc_ADNPedidoVendedor_Hist PV with(nolock)
--	ON PV.SUCURSAL = ped.SUCURSAL
--	AND pv.PEDIDO = ped.PEDIDO
--LEFT JOIN OPERACION.dbo.CAT_EMPLEADO CAT
--	ON CAT.NoEmp = PV.fcEmpNo;

select top 10 * from POLITICAS2020..DropTempPoliticasFinAnio2021_colocacion;

-------------------------------------- calificar --------------------------------------
-------------------------------------- calificar --------------------------------------

-- use POLITICAS2020;
-- Tabla pre de políticas (usa las 2 tablas anteriores)
--select
--	*,
--	CASE 
--		WHEN PoliticaAplicar = 'SurtioDiferente' THEN 0
--		ELSE -1
--	END AS Politica_SurtioDiferente,
--	CASE
--		WHEN coloScore <>'Rojo' THEN 
--		CASE
--			WHEN PoliticaAplicar = 'PolTelefonia' THEN  
--			CASE
--				WHEN MontoPedido > 5000 THEN
--				CASE
--					WHEN Enganche >= CAST(PrecioArticulos * 0.08 AS FLOAT) AND MontoPedido <= 6000 THEN 1
--					ELSE 0
--				END 
--				ELSE 1
--			END
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaConsumoTelefonia,
--	-- Telefonia rescate
--	CASE
--		WHEN coloScore ='Rojo' THEN 
--		CASE
--			WHEN PoliticaAplicar = 'PolTelefonia' THEN 
--			CASE
--				WHEN MontoPedido > 3000 THEN
--				CASE
--					WHEN Enganche >= CAST(PrecioArticulos * 0.27 AS FLOAT) AND fiplazo <= 52 THEN 1
--					ELSE 0
--				END 
--				ELSE 1
--			END 
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaConsumoTelefoniaRescate,
--	-- Fin telefonia rescate
--	CASE
--		WHEN coloScore <>'Rojo' THEN
--		CASE
--			WHEN PoliticaAplicar = 'PolMercancias' THEN
--			CASE
--				WHEN RegionPolitica = 'Metro' THEN
--				CASE
--					WHEN edadcliente <= 24 THEN
--					CASE
--						WHEN montoPedido <= 6000 THEN 1
--						ELSE 0
--					END
--					ELSE
--					CASE
--						WHEN montoPedido <= 15000 THEN 1
--						ELSE 0
--					END
--				END	
--				ELSE 
--				CASE
--					WHEN edadcliente <= 21 THEN
--					CASE
--						WHEN montoPedido <= 6000 THEN 1
--						ELSE 0
--					END
--					ELSE
--					CASE
--						WHEN montoPedido <= 15000 THEN 1
--						ELSE 0
--					END
--				END
--			END
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaConsumoMercancias,
---- Ini mercancias rescate
--	CASE
--		WHEN coloScore = 'Rojo' THEN
--		CASE
--			WHEN PoliticaAplicar = 'PolMercancias' THEN  
--			CASE
--				WHEN MontoPedido <= 5000 THEN
--				CASE
--					WHEN Enganche >= CAST(PrecioArticulos * 0.27 AS FLOAT) AND fiplazo <= 52 THEN 1
--					ELSE  0
--				END
--				ELSE 0
--			END 
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaConsumoRescate,
---- Fin merscantesi rescate
--	CASE
--		WHEN coloScore <>'Rojo' THEN
--		CASE
--			WHEN PoliticaAplicar = 'PolItalika' THEN
--			CASE
--				WHEN RegionPolitica = 'Metro' THEN
--				CASE
--					WHEN edadcliente <= 24 THEN
--					CASE
--						WHEN montoPedido <= 12000 THEN 1
--						ELSE 0
--					END
--					ELSE
--					CASE
--						WHEN montoPedido <= 20000 THEN 1
--						ELSE 0
--					END
--				END	
--				ELSE
--				CASE
--					WHEN edadcliente <= 21 THEN
--					CASE
--						WHEN montoPedido <= 12000 THEN 1
--						ELSE 0
--					END
--					ELSE
--					CASE
--						WHEN montoPedido <= 20000 THEN 1
--						ELSE 0
--					END
--				END
--			END
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaItalika,
--	CASE
--		WHEN coloScore <>'Rojo' THEN
--		CASE
--			WHEN PoliticaAplicar = 'PolPrestamos' THEN
--			CASE
--				WHEN CreditoInmediato = 'SI' THEN
--				CASE
--					WHEN edadCliente BETWEEN 18 AND 21 AND ISNULL(MontoColocado90,0) <= 5000 THEN 1
--					WHEN edadCliente BETWEEN 22 AND 25 AND ISNULL(MontoColocado90,0) <= 6000 THEN 1
--					WHEN edadCliente > 25 AND ISNULL(MontoColocado90,0) <= 7500 THEN 1
--					ELSE 0
--				END
--				ELSE
--				CASE
--					WHEN edadCliente BETWEEN 18 AND 21 AND ISNULL(MontoColocado90,0) <= 5000 THEN 1
--					WHEN edadCliente BETWEEN 22 AND 25 AND ISNULL(MontoColocado90,0) <= 7500 THEN 1
--					WHEN edadCliente > 25 AND ISNULL(MontoColocado90,0) <= 10000 THEN 1
--					ELSE 0
--				END
--			END
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaPrestamos,
--	CASE
--		WHEN coloScore = 'Rojo' THEN
--		CASE
--			WHEN PoliticaAplicar = 'PolPrestamos' THEN
--			CASE
--				WHEN montopedido <= 3000 THEN 1
--				ELSE 0
--			END
--			ELSE -1
--		END
--		ELSE -1
--	END AS PoliticaPrestamosRescate												 
--from(
--	select
--		j.*,
--		CASE
--			WHEN pedido IS NOT NULL THEN
--			CASE
--				WHEN ProductoOriginacion IN ('Telefonia') AND fidepto IN (14) THEN 'PolTelefonia' 
--				WHEN ProductoOriginacion IN ('Electronica') AND fidepto IN (10) THEN 'PolTelefonia' 
--				WHEN ProductoOriginacion IN ('Consumo') AND fidepto NOT IN (14,10,22,41) THEN 'PolMercancias' 
--				WHEN ProductoOriginacion IN ('Italika') AND fidepto IN (41) THEN 'PolItalika' 
--				WHEN ProductoOriginacion IN ('Italika') AND fidepto IN (701) THEN 'PolItalika' 
--				WHEN ProductoOriginacion IN ('Italika') AND fidepto IN (22) THEN 'PolItalika' 
--				WHEN ProductoOriginacion IN ('Prestamo Personal') AND fidepto IN (18) THEN 'PolPrestamos' 
--				WHEN ProductoOriginacion IN ('Prestamo Personal') AND fidepto IN (900) THEN 'PolPrestamos' 
--				WHEN ProductoOriginacion IN ('Prestamos Menores') AND fidepto IN (18) THEN 'PolPrestamos' 
--				WHEN ProductoOriginacion IN ('Prestamos Menores') AND fidepto IN (900) THEN 'PolPrestamos' 
--				WHEN ProductoOriginacion IN ('Prestamos Mayores') AND fidepto IN (18) THEN 'PolPrestamos' 
--				WHEN ProductoOriginacion IN ('Prestamos Mayores') AND fidepto IN (900) THEN 'PolPrestamos'	
--				WHEN ProductoOriginacion IN ('Tarjeta') AND unidadnegocio IN (32,52,72,423) THEN 'PolTaz'	
--				WHEN ProductoOriginacion IN ('Chapin') AND unidadnegocio IN (292) THEN 'PolChapin'	
--				ELSE 'SurtioDiferente'
--			END
--			ELSE 'NA'
--		END AS PoliticaAplicar,pp90.MontoColocado90
--	from
--		DropTempPoliticasFinAnio2021_colocacion j
--	LEFT JOIN TempTempPrestamos90 pp90
--		ON j.fiPais	= pp90.fiPais
--		AND j.fiCanal = pp90.fiCanal
--		AND j.fiSucursal = pp90.fiSucursal
--		AND j.fiFolio = pp90.fifolio
--) AS Y

select top 10 * from POLITICAS2020..DropTempPoliticasFinAnio2021_pre;

-------------------------------------- fin --------------------------------------
-------------------------------------- fin --------------------------------------

--use POLITICAS2020;
--select * from(
--	select
--		*,
--		CASE
--			WHEN PoliticaAplicar <> 'NA' THEN
--			CASE
--				WHEN
--					Politica_SurtioDiferente +
--					PoliticaConsumoTelefonia +
--					PoliticaConsumoTelefoniaRescate +
--					PoliticaConsumoMercancias +
--					PoliticaConsumoRescate +
--					PoliticaItalika +
--					PoliticaPrestamos +
--					PoliticaPrestamosRescate >- 7 THEN 1
--				ELSE 0 
--			END
--			ELSE 1
--		END AS CumplioPoliticas
--	from DropTempPoliticasFinAnio2021_pre 
--) AS e
--WHERE politicaaplicar NOT LIKE '%chapin%';

select top 10 * from POLITICAS2020..DRopTempTableaupoliticaFinanio;

-------------------------------------- Reporte --------------------------------------
-------------------------------------- Reporte --------------------------------------

--use POLITICAS2020;
--select 
--	(CONVERT(NVARCHAR(4),TP.FIANIOSEMANALDTIEMPO)) + '' + RIGHT('00' + CONVERT(NVARCHAR(4),TP.FISEMANALDTIEMPO),2) AS SEMANA_cosecha,
--	a.*
--from
--	politicas2020.dbo.DRopTempTableaupoliticaFinanio A
--LEFT JOIN politicas2020.dbo.ImpTiempo TP with(nolock)
--	ON CAST(a.FECHASURT AS DATE) = TP.FDFECHATIEMPO
--WHERE
--	fdFechaAlta >= '2021-11-05 00:00:00'
--	AND fdFecSolicitud >='2021-11-05 00:00:00'
--	AND CumplioPoliticas = 0
--	AND PoliticaAplicar NOT IN ('NA','PolChapin');

select top 10 * from POLITICAS2020.dbo.RPT_PoliticasFinAnio2021;

-------------------------------------- ReporteNuevoRMD --------------------------------------
-------------------------------------- ReporteNuevoRMD --------------------------------------

--use POLITICAS2020;
--select
--	(CONVERT(NVARCHAR(4),TP.FIANIOSEMANALDTIEMPO)) + '' + RIGHT('00' + CONVERT(NVARCHAR(4),TP.FISEMANALDTIEMPO),2)AS SEMANA_cosecha,
--	RIGHT('00' + CAST(ISNULL(A.fiPais,0) AS VARCHAR(2)), 2) +
--	RIGHT('00' + CAST(ISNULL(A.fiCanal,0) AS VARCHAR(2)), 2) + ' ' +
--	RIGHT('0000' + CAST(ISNULL(A.fiSucursal,0) AS VARCHAR(4)), 4) + ' ' +
--	CAST(ISNULL(A.fiFolio,0) AS VARCHAR(8)) AS ClienteUnico,
--	CASE
--		WHEN EstadoSolicitud = 6 THEN 'Autorizado' 
--		WHEN EstadoSolicitud = 9 THEN 'Rechazado'
--		WHEN EstadoSolicitud = 5 THEN 'Cancelado'
--	END AS EstadoSolicitud,
--	CASE
--		WHEN EstatusLCR = 3 THEN 'Bloqueado'
--		WHEN EstatusLCR = 1 THEN 'Liberado'
--		WHEN EstatusLCR = 5 THEN 'Cancelado'
--		ELSE '-'
--	END AS Estado_LCR,
--	fdFechaAlta,
--	fiSolicitudId NumSolicitud,
--	CASE
--		WHEN fiTipoSolicitud = 8 THEN 'Tradicional'
--		WHEN fiTipoSolicitud = 8 THEN 'RyF'
--		ELSE '-'
--	END AS TipoSolicitud,
--	fdFecSolicitud,
--	ColoScore,
--	CreditoInmediato,
--	ProductoOriginacion,
--	PEDIDO,
--	A.fiplazo AS Plazo,
--	FechaSurt,
--	UnidadNegocio,
--	MontoPedido,
--	Enganche,
--	PrecioArticulos,
--	fcProdDesc AS DescripcionProducto,
--	Region2	AS Region,
--	RegionPolitica,
--	nombreAgencia,
--	Departamento,	
--	EdadCliente,
--	PoliticaAplicar,
--	ROUND(ISNULL(ATR.FNSALDOCAPITAL,0),0) AS SaldoCapital,
--	ISNULL(ATR.FIPERATRAACUM,0) AS SEM_ATRASO,
--	CASE
--		WHEN RMD.finopedido IS NOT NULL THEN 'Con RMD'
--		WHEN ATR.FNSALDOCAPITAL IS NOT NULL THEN 'Con Saldo'
--		ELSE 'Sin saldo'
--	END AS EstadoActual,
--	CodigoVendedor,
--	NombreEmpleado,
--	EconomicoAgencia
--from
--	politicas2020.dbo.DRopTempTableaupoliticaFinanio A
--LEFT JOIN politicas2020.dbo.ImpTiempo TP with(nolock)  
--	ON CAST(a.FECHASURT AS date) = TP.FDFECHATIEMPO 
--LEFT JOIN almacenrisk.dbo.temporaldiario ATR
--	ON ATR.finopedido =a.PEDIDO
--	AND ATR.fifolio = a.fifolio
--	AND ATR.fisucursal = a.fiSucursal
--LEFT JOIN EXTRACCIONES.DBO.PROC_RMD_ADN_CLEAN RMD
--	ON RMD.finopedido = a.PEDIDO
--	AND RMD.fifolio = a.fifolio
--	AND RMD.fisucursal = a.fiSucursal
--WHERE
--	fdFechaAlta >= '2021-11-05 00:00:00'
--	AND fdFecSolicitud >='2021-11-05 00:00:00'  
--	AND CumplioPoliticas = 0
--	AND PoliticaAplicar NOT IN ('NA','PolChapin')
--	AND MOC = 1;

select top 10 * from EXTRACCIONES..RPT_NuevoPoliticasMOC;

-------------------------------------- RedUnica --------------------------------------
-------------------------------------- RedUnica --------------------------------------

--INSERT INTO [VistasRedUnica].dbo.SeguimientoPoliticasPedidosNuevosSurtidos
--select * from EXTRACCIONES.dbo.RPT_NuevoPoliticasMOC;

select top 10 * from VistasRedUnica..SeguimientoPoliticasPedidosNuevosSurtidos;