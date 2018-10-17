#!/usr/bin/ksh
########################################################################################
# Program ID      : scb_chkaddqr.sh -
#
# Function        : To add Quantitative Resources
#
# Program History :
# Date        Amended By           Changes/Remarks
# ========    ================     ===============
# 24 Sept 07   S. EUJISH 
# 30 Oct  07   S. EUJISH
# 29-Sep-2010 Vivekanandhan T	Added resource for SG BW files.
########################################################################################
cd $CONTROLM/exe_RedHat
echo "$PWD"
echo "First"
ecaqrtab ADD ACCT_RES 1
ecaqrtab ADD BCPR_ADJ_FEED 1
ecaqrtab ADD BCPR_FEED 1
ecaqrtab ADD BEH_LPS 1
ecaqrtab ADD BRK_FUND 1
ecaqrtab ADD BUS_RES 1
ecaqrtab ADD CASH_FLOWS 1
ecaqrtab ADD CCMS_STAGE 1
ecaqrtab ADD COA_RES 1
ecaqrtab ADD COADTL_RES 1
ecaqrtab ADD COST_RES 1
ecaqrtab ADD CR_NCR 1
ecaqrtab ADD CUST_DIM 1
ecaqrtab ADD CUST_LOOKUP 1
ecaqrtab ADD CUST_RES 1
ecaqrtab ADD DEAL_POP 1
ecaqrtab ADD DEFT_RES 1
ecaqrtab ADD DELTA_CHG 1
ecaqrtab ADD EOD_RATE 1
ecaqrtab ADD EXCH_RATE 1
ecaqrtab ADD FEDSFL_FEED 1
ecaqrtab ADD FEDSFX_FEED 1
ecaqrtab ADD FEDSVR_FEED 1
ecaqrtab ADD HDG_INSTR 1
ecaqrtab ADD HDG_ISTATUS 1
ecaqrtab ADD HOLI_RATE 1
ecaqrtab ADD IBAL_ILDGR 1
ecaqrtab ADD IFS_IINC 1
ecaqrtab ADD ILDGR_DLY 1
ecaqrtab ADD ILDGR_MON 1
ecaqrtab ADD INDEX_CREA 1
ecaqrtab ADD LED_POP 1
ecaqrtab ADD NEG_RATES 1
ecaqrtab ADD OUT_ADJ 1
ecaqrtab ADD OWE_IBAL 1
ecaqrtab ADD OWE_IBALANCE 1
ecaqrtab ADD OWE_INSTR 1
ecaqrtab ADD OWE_IOTHER 1
ecaqrtab ADD OWE_ISTATUS 1
ecaqrtab ADD PARBRK_FUND 1
ecaqrtab ADD PAS_ADJ_FEED 1
ecaqrtab ADD PAS_FEED 1
ecaqrtab ADD PROC_BYPASS 1
ecaqrtab ADD PROD_RES 1
ecaqrtab ADD PSGL_ADJ 1
ecaqrtab ADD PSGL_ADJ_FEED 1
ecaqrtab ADD PSGL_BAL 1
ecaqrtab ADD PSGL_FEED 1
ecaqrtab ADD RECON 1
ecaqrtab ADD RECON 1
ecaqrtab ADD RECON1 1
ecaqrtab ADD RLS_STAGE 1
ecaqrtab ADD STG_HIST 1
ecaqrtab ADD STG_IINC 1
ecaqrtab ADD STG_PL_IINC 1
ecaqrtab ADD STR_LPS 1
ecaqrtab ADD SUB_PROD 1
ecaqrtab ADD SYN_INSTR 1
ecaqrtab ADD TP_IINC 1
ecaqrtab ADD TP_STAGE 1
ecaqrtab ADD TP_STAGE1 1
ecaqrtab ADD TPEX_RES 1
ecaqrtab ADD TPMAP_RES 1
ecaqrtab ADD TRANS_LAYER 1
ecaqrtab ADD VAL_CHK 1
ecaqrtab ADD VAST_FEED 1
ecaqrtab ADD SQRReport 1
ecaqrtab ADD SchQuery 1
ecaqrtab ADD TRUNCATE 1
ecaqrtab ADD BSMTQuery 2
ecaqrtab ADD SQRReport1 1
ecaqrtab ADD PS-Alloc-Jobs 1
ecaqrtab ADD STG_LOAD 1
ecaqrtab ADD BSMTQuery 1
ecaqrtab ADD BW2_BSMT_SPORE 1
ecaqrtab ADD BW3_BSMT_SPORE 1
ecaqrtab ADD BW4_BSMT_SPORE 1
ecaqrtab ADD BW7_BSMT_SPORE 1
ecaqrtab ADD BW8_BSMT_SPORE 1
ecaqrtab ADD BW9_BSMT_SPORE 1
ecaqrtab ADD BW10_BSMT_SPORE 1
ecaqrtab ADD REP_BAL 1
ecaqrtab ADD REP_REF 1
ecaqrtab ADD REP_EXC 1
ecaqrtab ADD REP_CUR 1
echo "END"
exit 0
