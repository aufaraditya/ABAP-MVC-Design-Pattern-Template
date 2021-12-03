CLASS zcl_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA t_vbak TYPE shp_vl10_vbak_t .
    METHODS: get_data
      IMPORTING ir_erdat TYPE tpmy_r_date.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_model IMPLEMENTATION.
  METHOD get_data.
*
* Get data and save into attribute T_VBAK
    SELECT * FROM vbak
           INTO  TABLE t_vbak
           WHERE erdat IN ir_erdat.
*
*
  ENDMETHOD.

ENDCLASS.
