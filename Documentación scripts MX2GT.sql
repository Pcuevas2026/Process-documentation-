use EXTRACCIONES;

-------------------------------------- Conexiones --------------------------------------
-------------------------------------- Conexiones --------------------------------------

/*
	Acá se definen las conexiones necesarias para trabajar en el proyecto
	... para lo cual se utilizan nodos "Microsoft SQL Server Connector"
*/

-- No: 1
-- IP: 10.80.219.74
-- BD: BDREPDEVLAM

-- No: 2
-- IP: 10.48.201.146
-- BD: ALMACENRISK

-- No: 3
-- IP: 10.48.201.146
-- BD: EXTRACCIONES

-- No: 4
-- IP: 10.48.201.146
-- BD: COVID

-- No: 5
-- IP: 10.48.201.146
-- BD: SILO

-- No: 6
-- IP: 10.48.201.146
-- BD: JOB_RISK

-- No: 7
-- IP: 10.48.201.146
-- BD: GS

-------------------------------------- EXPRESS --------------------------------------
-------------------------------------- EXPRESS --------------------------------------

/*************************************** Pedidos sin saldo ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..GT_envioGUATEPedidosCero;

--DB Writer (3)
--truncate table EXTRACCIONES..ETL_PEDIDO_SIN_SALDO_FROM_MX;
--insert into EXTRACCIONES..ETL_PEDIDO_SIN_SALDO_FROM_MX

--DB SQL Executor (3)
--insert into EXTRACCIONES..PROC_PEDIDO_SIN_SALDO
--select
--	FiSucursal
--	,FiNoPedido
--	,FechaSurt
--	,UltimoAbono
--from EXTRACCIONES..ETL_PEDIDO_SIN_SALDO_FROM_MX a
--where not exists(
--	select 1 from EXTRACCIONES..PROC_PEDIDO_SIN_SALDO b
--	where b.FiSucursal = a.FiSucursal
--	and b.FiNoPedido = a.FiNoPedido
--);

/*************************************** Cristal solicitudes ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..CD_solicitudesMOC_GUA_2;

--DB Writer (2)
--truncate table ALMACENRISK..CRISTAL_SOLICITUD_MOC_paso;
--insert into ALMACENRISK..CRISTAL_SOLICITUD_MOC_paso

--DB SQL Executor (2)
--insert into ALMACENRISK..CRISTAL_SOLICITUD_MOC
--select * from ALMACENRISK..CRISTAL_SOLICITUD_MOC_paso a
--where not exists(
--	select 1 from ALMACENRISK..CRISTAL_SOLICITUD_MOC b
--	where b.FICANALID = a.FICANALID
--	and b.FISUCURSALID = a.FISUCURSALID
--	and b.FISOLICITUDID = a.FISOLICITUDID
--);

/*************************************** Cristal pedidos ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..CD_pedidosMOC_GUA_2;

--DB Writer (2)
--truncate table ALMACENRISK..CRISTAL_PEDIDOS_MOC_paso;
--insert into ALMACENRISK..CRISTAL_PEDIDOS_MOC_paso

--DB SQL Executor (2)
--insert into ALMACENRISK..CRISTAL_PEDIDOS_MOC
--select * from ALMACENRISK..CRISTAL_PEDIDOS_MOC_paso a
--where not exists(
--	select 1 from ALMACENRISK..CRISTAL_PEDIDOS_MOC b
--	WHERE b.FICANALID = a.FICANALID
--	AND b.FISUCURSALID = a.FISUCURSALID
--	AND b.FISOLICITUDID = a.FISOLICITUDID
--);

/*************************************** Cosechas ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..GUA_GT_PASO_RESERVA_INGRESO_COSECHAS;

--DB Writer (6)
--truncate table JOB_RISK..ETL_HIST_COSECHAS;
--insert into JOB_RISK..ETL_HIST_COSECHAS

--DB SQL Executor (6)
--insert into JOB_RISK..HIST_COSECHASGT 
--select * from JOB_RISK..ETL_HIST_COSECHAS A
--where not exists(
--	select 1 from JOB_RISK..HIST_COSECHASGT B
--	where B.FICANAL = A.FICANAL
--	and B.FISUCURSAL = A.FISUCURSAL
--	and B.FINOPEDIDO = A.FINOPEDIDO
--);

/*************************************** Actor JVC ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..SEndClienteGT;

--DB Writer (3)
--truncate table EXTRACCIONES..PROC_MXSolicitudeshist_actor;
--insert into EXTRACCIONES..PROC_MXSolicitudeshist_actor

/*************************************** Cliente lunes ***************************************/

--Table Creator
/*Definir columna "año" con los últimos 3 años
	2024
	2025
	2026
*/

--Group Loop Start
/*Incluir (includes) variable año*/

--DB Query Reader (1)
--select * from BDREPDEVLAM..SendtoGT_ClienteUnico
--where year(FechaPrimerCompra) = $${Iaño}$$

--DB Writer (3)
--truncate table EXTRACCIONES..ETL_ClienteLunes;
--insert into EXTRACCIONES..ETL_ClienteLunes

--DB SQL Executor (3)
--delete cli
--from EXTRACCIONES..GT_cliente_Lunes cli
--join EXTRACCIONES..ETL_ClienteLunes etl_cli
--	on etl_cli.Finotienda = cli.Finotienda
--	and etl_cli.Ficteid = cli.Ficteid
--	and etl_cli.Fidigitover = cli.Fidigitover;

--DB Writer (3)
--insert into EXTRACCIONES..GT_cliente_Lunes
--select * from EXTRACCIONES..ETL_ClienteLunes;

--Loop End

/*************************************** EVER ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..GT_ever_semanal;

--DB SQL Executor (3)
--delete from EXTRACCIONES..mxrisk_EVER_SEMANAL
--where SEMANA_Cosecha > (
--select ID_FECHA from CARGASDOC.dbo.DIM_TIEMPO
--where (
--	select dateadd(week,-13,FechaFin) semana_13_atras from CARGASDOC.dbo.DIM_TIEMPO
--	where convert(date,getdate()) between FechaInicio and FechaFin
--) between FechaInicio and FechaFin);

--DB Writer (3)
--insert into EXTRACCIONES..mxrisk_EVER_SEMANAL
--select * from BDREPDEVLAM..GT_ever_semanal;

/*************************************** Pedidos MNCH ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..pedidos292CU;

--DB Writer (3)
--truncate table EXTRACCIONES..pedidos_empresario;
--insert into EXTRACCIONES..pedidos_empresario

/*************************************** Cartera JVC ***************************************/

--DB Query Reader (3)
--select	
--	l.Pais
--	,l.Departamento
--	,l.NombreAgencia
--	,l.Region
--	,l.Region2
--	,l.Latitud
--	,l.Longitud
--	,l.REGION_UNICA
--	,l.TERRITORIO_UNICA
--	,(
--		RIGHT('00' + CAST(ISNULL(t.fiPaiscu,0) as VARCHAR(2)), 2) +
--		RIGHT('00' + CAST(ISNULL(t.fiCanalcu,0) as VARCHAR(2)), 2) + ' ' +
--		RIGHT('0000' + CAST(ISNULL(t.fiSucursalcu,0) as VARCHAR(4)), 4) + ' ' +
--		CAST(ISNULL(t.fiFolio,0) as VARCHAR(8))
--	) CU
--	,t.FICANAL
--	,t.FISUCURSAL
--	,t.FINOPEDIDO
--	,EXTRACCIONES.[dbo].[fechaVisita2](T.FDULTIMOABONO) as FDULTIMOABONO
--	,(t.FDCSALDOORIGINAL - t.FDCINTXFINANCIAR) as MONTO_COLOCADO
--	,t.FNSALDOCAPITAL as SaldoCapital
--	,t.FDFECHASURT
--	,t.FIPERATRAACUM as SEM_ATRASO
--	,T.FIUNIDADNEGOCIO
--	,sol.EmpEjecutivo
--	,sol.NombreEjecutivo
--	,ISNULL(solejecu.EstadoEjecutivo, '') as EstadoEjecutivo
--	,ISNULL(solejecu.FechaAltaEjecutivo, '') as FechaAltaEjecutivo
--	,ISNULL(solejecu.FechaBajaEjecutivo, '') as FechaBajaEjecutivo
--	,sol.EmpAutoriza
--	,sol.NombreAutorizador
--	,ISNULL(CAST(sol.noempInvestiga as VARCHAR(6)), CAST(solmx.NumEmpleadoCampo as VARCHAR(6))) as noempInvestiga
--	,ISNULL(sol.NombreInvestigador, solmx.nombre) as NombreInvestiga
--	,ISNULL(sol.Estadoinvestiga, solmx.ColaboradorEstado) as Estadoinvestiga
--	,ISNULL(sol.FechaAltaInvestiga, solmx.ColaboradorFechaContratacion) as FechaAltaInvestiga
--	,ISNULL(sol.FechaBajaInvestiga, solmx.ColaboradorFechaBaja) as FechaBajaInvestiga
--	,sol.fiSolicitudId
--	,ped.fcEmpNo as empVendedor
--	,ped.nombre as VendedorNombre
--	,ped.ColaboradorFechaContratacion as FechaAltaVendedor
--	,ped.ColaboradorFechaBaja as FechaBajaVendedor
--	,ped.ColaboradorEstado as EstadoVendedor
--	,CASE WHEN LUN.NumPrimerPedido IS NOT NULL THEN 'nuevo' ELSE 'Recompra' END as Tipo_pedido
--	,geo.fnLatitud
--	,geo.fnLongitud	
--from ALMACENRISK.dbo.TemporalDiario T
--left join(
--	select
--		z.*
--		,esol.Estado as Estadoinvestiga
--		,esol.Fecha as FechaAltaInvestiga
--		,esol.fechaBaja as FechaBajaInvestiga
--	from(
--		select
--			EmpAutoriza
--			,NombreAutorizador
--			,noempInvestiga
--			,NombreInvestigador
--			,fiSolicitudId
--			,ClienteUnico
--			,EmpEjecutivo
--			,NombreEjecutivo
--			,row_number() over(partition by ClienteUnico order by fdfecsolicitud desc) orden
--		from extracciones.dbo.PROC_ADNSolictudHist_actor
--	) as z
--	left join OPERACION.dbo.CAT_EMPLEADO esol
--		on cast(esol.NoEMp as varchar(6)) = ltrim(rtrim(z.noempInvestiga))
--	where z.orden = 1 
--) as sol
--	ON sol.CLIENTEUNICO = (
--		RIGHT('00' + CAST(ISNULL(t.fiPaiscu,0) as VARCHAR(2)), 2) +
--		RIGHT('00' + CAST(ISNULL(t.fiCanalcu,0) as VARCHAR(2)), 2) + ' ' +
--		RIGHT('0000' + CAST(ISNULL(t.fiSucursalcu,0) as VARCHAR(4)), 4) + ' ' +
--		CAST(ISNULL(t.fiFolio,0) as VARCHAR(8)))	
--left join ALMACENRISK.dbo.LAMAgencia l
--	ON l.sucursal4dig = t.FISUCURSAL
--	AND l.Canal <> 'GCC'
--left join(
--	select
--		z.ClienteUnico
--		,esol.Estado as EstadoEjecutivo
--		,esol.Fecha as FechaAltaEjecutivo
--		,esol.fechaBaja as FechaBajaEjecutivo
--	from(
--		select ClienteUnico, EmpEjecutivo, ROW_NUMBER() over(partition by ClienteUnico order by fdfecsolicitud DESC) orden
--		from extracciones.dbo.PROC_ADNSolictudHist_actor
--	) as z
--	left join OPERACION.dbo.CAT_EMPLEADO esol
--		ON CAST(esol.NoEMp as VARCHAR(6)) = LTRIM(RTRIM(z.EmpEjecutivo))
--	where z.orden = 1
--) as solejecu
--	ON solejecu.CLIENTEUNICO = (
--		RIGHT('00' + CAST(ISNULL(t.fiPaiscu,0) as VARCHAR(2)), 2) +
--		RIGHT('00' + CAST(ISNULL(t.fiCanalcu,0) as VARCHAR(2)), 2) + ' ' +
--		RIGHT('0000' + CAST(ISNULL(t.fiSucursalcu,0) as VARCHAR(4)), 4) + ' ' +
--		CAST(ISNULL(t.fiFolio,0)as VARCHAR(8)))
--left join(
--	select
--		solmx.NumEmpleadoCampo
--		,solmx.FICANAL
--		,solmx.FISUCURSAL
--		,solmx.FIFOLIO
--		,e.nombre
--		,Fecha as ColaboradorFechaContratacion
--		,Estado as ColaboradorEstado
--		,e.FechaBaja as ColaboradorFechaBaja
--	from
--		extracciones.dbo.PROC_MXSolicitudeshist_actor solmx
--	left join OPERACION.dbo.CAT_EMPLEADO e
--		ON CAST(e.NoEMp as VARCHAR(6)) = solmx.NumEmpleadoCampo
--) as solmx
--	ON solmx.FICANAL = t.FICANALCU
--	AND solmx.FISUCURSAL = t.FISUCURSALCU	
--	AND solmx.FIFOLIO = t.FIFOLIO
--left join EXTRACCIONES.[dbo].[GT_cliente_Lunes]LUN
--	ON t.FINOTIENDA	= LUN.FINOTIENDA
--	AND t.FICTEID = LUN.FICTEID
--	AND t.FIDIGITOVER = LUN.FIDIGITOVER
--	AND t.FDFECHASURT BETWEEN LUN.FechaPrimerCompra AND DATEADD(dd,30, LUN.FechaPrimerCompra)
--left join(
--	select
--		p.PEDIDO
--		,p.SUCURSAL
--		,p.FOLIOCU
--		,p.fcEmpNo
--		,e.nombre
--		,Fecha as ColaboradorFechaContratacion
--		,Estado as ColaboradorEstado
--		,e.FechaBaja as ColaboradorFechaBaja
--	from
--		[EXTRACCIONES].[dbo].[Proc_ADNPedidoVendedor_Hist] p
--	left join OPERACION.dbo.CAT_EMPLEADO e
--		ON CAST(e.NoEMp as VARCHAR(6)) = p.fcempno
--) as ped
--	ON t.FINOPEDIDO = ped.pedido
--	AND t.FISUCURSAL = ped.sucursal
--	AND t.fifolio = ped.foliocu
--left join(
--	select * from(
--		select *, row_number()over(partition by fiCanal, fiSucursal, fiFolio order by fnLatitud) orden
--		from EXTRACCIONES.dbo.PROC_GEOCLIENTE
--	) as x where x.orden = 1
--) geo
--	ON t.fiCanalcu = geo.fiCanal
--	AND t.FISUCURSALCU = geo.fisucursal
--	AND t.FIFOLIO = geo.fiFolio
--where t.FIPERATRAACUM <= 39;

--DB Writer (4)
--truncate table COVID..Cartera_actual_JVC;
--insert into COVID..Cartera_actual_JVC

/*************************************** CDP semanal 1 ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..DROP_ENVIOGUATE2;

--DB Writer (5)
--truncate table SILO..MI_CapacidadSemanal;
--insert into SILO..MI_CapacidadSemanal

/*************************************** CDP semanal 2 ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..DROP_ENVIOGUATE3;

--DB Writer (3)
--truncate table EXTRACCIONES..ETL_CAPACIDAD_PAGO_X_SEMANA;
--insert into EXTRACCIONES..ETL_CAPACIDAD_PAGO_X_SEMANA

--DB SQL Executor (3)
--insert into EXTRACCIONES..PROC_CAPACIDAD_PAGO_X_SEMANA
--select *,convert(date,GETDATE()) as FechaInsert
--from EXTRACCIONES..ETL_CAPACIDAD_PAGO_X_SEMANA A
--where not exists(
--	select 1 from EXTRACCIONES..PROC_CAPACIDAD_PAGO_X_SEMANA B
--	where A.SEMANA = B.SEMANA and
--	A.FICANAL = B.FICANAL and
--	A.FISUCURSAL = B.FISUCURSAL and
--	A.FIFOLIO = B.FIFOLIO
--);

/*************************************** MNCH ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..GT_LIQ_EMPRESARIO;

--DB Writer (3)
--truncate table EXTRACCIONES..GT_LIQ_EMPRESARIO;
--insert into EXTRACCIONES..GT_LIQ_EMPRESARIO

-------------------------------------- OTROS --------------------------------------
-------------------------------------- OTROS --------------------------------------

/*************************************** Archivo para Auditorio de surtimientos de +2 celulares ***************************************/

--DB Query Reader (7)
--select * from GS..AUDITORIA_PEDIDOS_CELULARES;

--CSV Writer
/*Guardar en la ruta prefereida como: surtimientos_celulares.csv*/

/*************************************** Ingresos mensuales ***************************************/

--DB Query Reader (1)
--select * from BDREPDEVLAM..ETL_INGRESOS_X_DIA;

--DB Writer (3)
--truncate table EXTRACCIONES..ETL_MX_INGRESO_X_DIA_PASO;
--insert into EXTRACCIONES..ETL_MX_INGRESO_X_DIA_PASO