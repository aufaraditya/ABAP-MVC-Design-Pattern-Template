class ZCL_MODEL definition
  public
  final
  create public .

public section.

  data SALES_DOC_DATA type SHP_VL10_VBAK_T .

  methods GET_DATA
    importing
      !RECORD_DATE type TPMY_R_DATE .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MODEL IMPLEMENTATION.


  METHOD get_data.
*
* Get data and save into attribute T_VBAK
    SELECT * FROM vbak
           INTO  TABLE sales_doc_data
           WHERE erdat IN record_date.
*
*
  ENDMETHOD.
ENDCLASS.
