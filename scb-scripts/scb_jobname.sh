echo J_Holiday_Rates:dsjob -run -mode NORMAL -jobstatus :dummy:scb_fact_run.sh
echo J_MYSIA_Holiday_Rates:dsjob -run -mode NORMAL -jobstatus :dummy:scb_fact_run.sh
echo J_Sat_Holiday_Rates:dsjob -run -mode NORMAL -jobstatus :dummy:scb_fact_run.sh
echo J_EndDates_Null_Holidays:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Exchange_Rates:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param Country=$4 -jobstatus :MYS_PSF_FTP_EXCH_RT:scb_stg_tpbal_run.sh:J_Exchange_Rates
echo J_EOD_Rates:dsjob -run -mode NORMAL -param TPFileName=$2 -param Cntrycode=$3 -jobstatus :IN_EOD_RATES:scb_stg_tpbal_run.sh
echo J_Cust_Dimension:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param Process=$4 -jobstatus :MYS_BBS_FTP_CM:scb_stg_tpbal_run.sh:J_Cust_DimensionD
echo J_Cust_Dimension:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param Process=$4 -jobstatus :MYS_BBS_FTP_CM:scb_stg_tpbal_run.sh:J_Cust_DimensionM
echo J_Cust_Dimension_Lookups:dsjob -run -mode NORMAL -jobstatus :dummy:scb_fact_run.sh 
echo J_Hash_Lookups:dsjob -run -mode NORMAL  -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Hash_Lookup1:dsjob -run -mode NORMAL  -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Balance_Stg_1:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_HGN_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_1HGN 
echo J_Balance_Stg_ccms:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_CCM_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_ccmsCCM
echo J_Balance_Stg_rls:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -param Cntrycode=$5 -jobstatus :MYS_RLS_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_rlsRLS
echo J_Balance_Stg:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_CLS_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_StgCLS
echo J_Balance_Stg_1:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_OPI_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_1OPX
echo J_Balance_Stg.OAF:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_OAF_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg.OAFOAF
echo J_Balance_Stg.IMX:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_IMX_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg.IMXIMX
echo J_Balance_Stg_1:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_IFS_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_1IFS 
echo J_Balance_Stg_RLS_GT:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -param Cntrycode=$5 -jobstatus :MYS_RLS_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_RLS_GTRLS
echo J_Opx_Balance_Stg:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_OPI_FTP_BAL:scb_stg_tpbal_run.sh:J_Opx_Balance_StgOPX
echo J_Balance_Stg_ACB_GT:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_ACB_FTP_BAL:scb_stg_tpbal_run.sh:J_Balance_Stg_ACB_GTACB
echo J_EBBS_Balance_Stg:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_BBS_FTP_BAL:scb_stg_tpbal_run.sh:J_EBBS_Balance_StgBBS

echo J_INTSUM_Balance_Stg:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_BBS_FTP_INTSUM:scb_stg_tpbal_run.sh:J_INTSUM_Balance_StgBBS
echo J_Check_Date_INTSUM:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCode=$4 -jobstatus :MYS_BBS_FTP_INTSUM:scb_stg_tpbal_run.sh:J_Check_Date_INTSUMBBS
echo J_CB_DealNumber_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Default_Chartfield_Translation:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_CNTRL_DEFAULT_VALUE_MAP:scb_trans_run.sh
echo J_Account_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_ACCOUNT_MAP:scb_trans_run.sh
echo J_CostCentre_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_COSTCENTRE_MAP:scb_trans_run.sh
echo J_Cust_Class_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_CUSTCLASS_MAP:scb_trans_run.sh
echo J_Product_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_PRODUCT_MAP:scb_trans_run.sh
echo J_TP_Exception_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_TPEXCEPTION_MAP:scb_trans_run.sh
echo J_TPRCCoa:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MYSIA_TPREC_COA:scb_trans_run.sh
echo J_TPRC_Coadtl:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MYSIA_TPREC_COADTL:scb_trans_run.sh
echo J_TP_Map_Defn:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_CNTRL_TRANRULE_MAP:scb_trans_run.sh
echo J_BusUnit_Translation_Mapping:dsjob -run -mode NORMAL -param TPFileName=$2 -jobstatus :MY_COMPANYCODE_MAP:scb_trans_run.sh
echo J_Stg_trans_Layer:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_trans_Layer_GT:dsjob -run -mode NORMAL -param SETID=$2 -param SETID1=$3 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_ftp_err:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Error_Records_Handling:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Rec_Records_Handling:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Prod_Subprod_conversion:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Core_NonCore:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Hedge_Unhedge:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_flag_population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Generate_instruments:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_Owe_IBalance_R00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_Owe_Instr_F00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_Owe_IOther_R00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_Owe_Istatus_R00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Ibalance_Ibal_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Hedge_Owe_Instr_F00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Hedge_Owe_Istatus_R00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_STG_PL_IINC_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_IINC_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_IINC_IFS_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Negotiation_Rates:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_NPL_Negotiation_Rates:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Break_Funding:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Partial_Break_Funding:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_CashFlows:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Matured_Hedges:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_stg_ftp_psgl_bal_tb:dsjob -run -mode NORMAL -param SETID=$3 -param PSGLFileName=$2 -jobstatus :MYS_PSF_FTP_BAL:scb_stg_tpbal_run.sh:J_stg_ftp_psgl_bal_tb
echo J_Stg_Ftp_Psgl_Adj_Tb:dsjob -run -mode NORMAL -param SETID=$3 -param SrcFilename=$2 -jobstatus :GLBSETRAN_MYS_03052006:scb_stg_tpbal_run.sh:J_Stg_Ftp_Psgl_Adj_Tb
echo J_Stg_Tp_Bypass_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
#echo J_Psgl_reconciliation_Process:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3  -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_ProcessHGN
#echo J_Psgl_reconciliation_Process1:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3  -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_Process1RLS
#echo J_Psgl_reconciliation_Process:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3 -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_ProcessCCM
#echo J_Psgl_reconciliation_Process1:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3 -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_Process1IFS
#echo J_Psgl_reconciliation_Process:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3 -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_ProcessCLS
#echo J_Psgl_reconciliation_Process1:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3 -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_Process1OPX
#echo J_Psgl_reconciliation_Process:dsjob -run -mode NORMAL -param SETID=$2 -param TPCode=$3 -param RTType=$4 -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_ProcessIMX
#echo J_Rec_Psgl_reconciliation:dsjob -run -mode NORMAL -param SETID=$2 -param RTType=$3 -jobstatus :dummy:scb_fact_run.sh
echo J_Psgl_reconciliation_Process2:dsjob -run -mode NORMAL -param SETID=$2  -jobstatus :dummy:scb_fact_run.sh:J_Psgl_reconciliation_Process2
echo J_Pf_Ledger_F00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Mon_Pf_Ledger_F00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Psgl_Adjustments:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_IINC_ILDGR_Mon_Posting:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_IINC_ILDGR_Posting:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Ibalance_Ildgr_Posting:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Ibalance_Ildgr_Mon_Posting:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_Hist_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Behavioural_Liquidity:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MYS_FTP_LPS_BL:scb_fact_run.sh
echo J_Vast_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MYS_FTP_VST_RCF:scb_fact_run.sh
echo J_Feds_Feeds:dsjob -run -mode NORMAL -param BUSUNIT=$2 -param TGTFileName=$3 -param ISLAMIC=$4 -jobstatus :SGP_FTP_FEDS_FRR_150_C :scb_fact_run.sh
echo J_Feds_Managed_Feeds:dsjob -run -mode NORMAL -param BUSUNIT=$2 -param TGTFileName=$3 -param ISLAMIC=$4 -jobstatus :SGP_FTP_FEDS_MRR_148_C :scb_fact_run.sh
echo J_Feds_Managed_Feeds:dsjob -run -mode NORMAL -param BUSUNIT=$2 -param TGTFileName=$3 -param ISLAMIC=$4 -jobstatus :SGP_FTP_FEDS_MRR_150_C :scb_fact_run.sh
echo J_Pas_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_PAS_CHCR :scb_fact_run.sh
echo J_Psgl_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_PSF_CHCR :scb_fact_run.sh
echo J_Psgl_m1_Feeds:dsjob -run -mode NORMAL  -jobstatus :MYS_FTP_PSF_CHCR :scb_fact_run.sh
echo J_B_Cpr_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_CPR_DLY :scb_fact_run.sh
echo J_CBPB_B_Cpr_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MY_CB_PSFTP1.dat :scb_fact_run.sh
echo J_B_Cpr_Adj_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_CPR_ME :scb_fact_run.sh
echo J_B_Cpr_Feed_FTP:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_CPR_DLY :scb_fact_run.sh
echo J_CBPB_B_Cpr_Adj_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MY_CB_PSFTP2.dat :scb_fact_run.sh
echo J_New_B_Cpr_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MY.PSFTP.F00.ME :scb_fact_run.sh
echo J_Pas_Adj_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_PAS_CHCR_ME :scb_fact_run.sh
echo J_Psgl_Adj_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_BW12_GT_DATA:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :BW12_GT_TB_MYSIA :scb_fact_run.sh
echo J_Ess_Dimension:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_Ess_inst_Dimension1:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_Ess_prod_Dimension2:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_Credit_Chrg:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFilename=$3 -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_Cflow:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFilename=$3  -jobstatus :SGP_FTP_PSF_CHCR_ME :scb_fact_run.sh
echo J_Stg_Owe_Itrnhst_R00:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Imfund_Aseq_population:dsjob -run -mode NORMAL -param SETID=$2 -param DATASET=$3 -jobstatus :dummy:scb_fact_run.sh
echo J_Opx_Stg_trans_Layer_Opx:dsjob -run -mode NORMAL -param SETID=$2 -param SETID1=$3 -jobstatus :dummy:scb_fact_run.sh
echo J_Trans_Layer_OPX:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh:J_Trans_Layer_OPXOPX
echo J_Product_OPX:dsjob -run -mode NORMAL -param TPFileName=$2 -param TP_CODE=$3 -jobstatus :MYS_OPI_PRODTYPE:scb_fact_run.sh:J_Product_OPXStg
echo J_Balance_Stg_opx:dsjob -run -mode NORMAL -param TPFileName=$2 -param SETID=$3 -param TPCODE=$4 -jobstatus :MYS_OPI_FTP_PL:scb_fact_run.sh:J_Balance_Stg_opxOPX
echo J_Appl_Ibalance_Ildgr_Posting_Holiday:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Appl_Pf_Ledger_F00_Holiday:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Account_Closing:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_eglex_layer_GT:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Stg_CASA_Exclusion:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Ola_Dash_Board_MY:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh

#MYS HYBRID RATE DTD:02-Jan-08

echo J_Stg_Dsc_ADRatio:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Hybrid_Rates:dsjob -run -mode NORMAL -param SETID=$2 -param CntryCode1=$3 -param CntryCode2=$4 -jobstatus :dummy:scb_fact_run.sh

#MYS STRIP FUNDING

echo J_Strip_Funding:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh

#MYS Reconcialiation process

echo J_Rec_Psgl_reconciliation:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh

#echo J_CBPB_B_Cpr_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MY_CB_PSFTP1.dat :scb_fact_run.sh

#echo J_CBPB_B_Cpr_Adj_Feed:dsjob -run -mode NORMAL -param SETID=$2 -param TGTFileName=$3 -jobstatus :MY_CB_PSFTP2.dat :scb_fact_run.sh

#Compilation script
echo J_ETLCompileJobs:dsjob -run -mode NORMAL -warn 1 -param Folder= -param JobsLike=$2 -param NotCompiledOnly=$3 -param AreYouSure=$4 -param SystemType=$5 -jobstatus :dummy:scb_fact_run.sh
##Staging table Backup

echo J_Staging_Backup:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh

###BSMT Extracts
echo J_BW1_INSTR_IBAL:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW1_INSTR_IBAL_303S:scb_fact_run.sh
echo J_BW2_IOTHER:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW2_IOTHER_303S:scb_fact_run.sh
echo J_BW3_CIF_FTP_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW3_CIF_FTP_RATE_303S:scb_fact_run.sh
echo J_BW4_CAF:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW4_CAF_303S:scb_fact_run.sh
echo J_BW5_EOD_SOD_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW5_EOD_SOD_RATE_303S:scb_fact_run.sh
echo J_BW6_EX_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW6_EX_RATE_303S:scb_fact_run.sh
echo J_BW7_PF_LEDGER:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW7_PF_LEDGER_303S:scb_fact_run.sh
echo J_BW8_PF_LEDGER_NONFTP:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW8_PF_LEDGER_NONFTP_303S:scb_fact_run.sh
echo J_BW9_HEDGE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW9_HEDGE_303S:scb_fact_run.sh
echo J_BW10_OPX_FWDST:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW10_OPX_FWDST_303S:scb_fact_run.sh
echo J_BW11_OPX_ASID:dsjob -run -mode NORMAL -param TGTFileName=$2 -jobstatus :BW11_OPX_ASID_303S:scb_fact_run.sh


#echo J_BW1_INSTR_IBAL:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW1_INSTR_IBAL_660S:scb_fact_run.sh
#echo J_BW2_IOTHER:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW2_IOTHER_660S:scb_fact_run.sh
#echo J_BW3_CIF_FTP_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW3_CIF_FTP_RATE_660S:scb_fact_run.sh
#echo J_BW4_CAF:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW4_CAF_660S:scb_fact_run.sh
#echo J_BW5_EOD_SOD_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW5_EOD_SOD_RATE_660S:scb_fact_run.sh
#echo J_BW6_EX_RATE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW6_EX_RATE_660S:scb_fact_run.sh
#echo J_BW7_PF_LEDGER:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW7_PF_LEDGER_660S:scb_fact_run.sh
#echo J_BW8_PF_LEDGER_NONFTP:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW8_PF_LEDGER_NONFTP_660S:scb_fact_run.sh
#echo J_BW9_HEDGE:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW9_HEDGE_660S:scb_fact_run.sh
#echo J_BW10_OPX_FWDST:dsjob -run -mode NORMAL -param BU=$2 -param TGTFileName=$3 -jobstatus :BW10_OPX_FWDST_660S:scb_fact_run.sh
#echo J_BW11_OPX_ASID:dsjob -run -mode NORMAL -param TGTFileName=$2 -jobstatus :BW11_OPX_ASID_660S:scb_fact_run.sh

#Fermat Report

echo J_Balance_check:dsjob -run -mode NORMAL -param BU=$2 -jobstatus :dummy:scb_fact_run.sh

echo J_Referential_check:dsjob -run -mode NORMAL -param BU=$2 -jobstatus :dummy:scb_fact_run.sh

echo J_Exception_bw12:dsjob -run -mode NORMAL -param BU=$2 -param SETID=$3 -jobstatus :dummy:scb_fact_run.sh

echo J_Currency_Exception:dsjob -run -mode NORMAL -param BU=$2 -jobstatus :dummy:scb_fact_run.sh

echo J_ACB_trans_Layer_MYSIA:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh


###MYS-ISL Translation mapping file for BU660 added by Rajasekar#####

echo J_ISL_Default_Chartfield_Translation:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_CNTRL_DEFAULT_VALUE_MAP:scb_trans_run.sh
echo J_ISL_Account_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_ACCOUNT_MAP:scb_trans_run.sh
echo J_ISL_CostCentre_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_COSTCENTRE_MAP:scb_trans_run.sh
echo J_ISL_Cust_Class_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_CUSTCLASS_MAP:scb_trans_run.sh
echo J_ISL_Product_Translation_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_PRODUCT_MAP:scb_trans_run.sh
echo J_ISL_TP_Exception_Mapping:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_TPEXCEPTION_MAP:scb_trans_run.sh
echo J_ISL_TP_Map_Defn:dsjob -run -mode NORMAL -param SETID=$2 -param TPFileName=$3 -jobstatus :MY_IS_IS_CNTRL_TRANRULE_MAP:scb_trans_run.sh
echo J_ISL_BusUnit_Translation_Mapping:dsjob -run -mode NORMAL -param TPFileName=$2 -jobstatus :MY_IS_IS_COMPANYCODE_MAP:scb_trans_run.sh

echo J_OB_Inc_Flag_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_OB_Exc_Flag_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_OB_Spl_Allocation:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_OB_Galc_Population:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Liquidity_Col:dsjob -run -mode NORMAL -param SETID=$2 -jobstatus :dummy:scb_fact_run.sh
echo J_Time_Deposits:dsjob -run -mode NORMAL -param BU=$2 -jobstatus :dummy:scb_fact_run.sh


echo J_Finrep_Model1.FINREP_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param RT_TYPE=$4 -jobstatus :dummy:scb_fact_run.sh
echo J_Finrep_Model2.FINREP_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param RT_TYPE=$4 -jobstatus :dummy:scb_fact_run.sh	


echo J_EDM_TRANS_TEMP1_TBL.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FI_IBALANCE_R00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FI_ILDGR_F00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FI_INSTR_F00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FI_IOTHER_R00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FTP_CALC_AC_F00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_FTP_CALC_IN_F00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_PF_LEDGER_F00.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
echo J_PS_SCB_REP_CLC_VW2.EDM_MYSIA:dsjob -run -mode NORMAL -param TGTFileName=$2 -param SETID=$3 -param COUNTRYCODE2=$4 -param BUSINESS_DATE=$5 -jobstatus :dummy:scb_fact_run.sh
