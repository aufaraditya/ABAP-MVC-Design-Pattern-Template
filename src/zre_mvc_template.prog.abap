*&---------------------------------------------------------------------*
*& Report zre_mvc_template
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_mvc_template.

START-OF-SELECTION.
*----------------------------------------------------------------------
* Controller
*----------------------------------------------------------------------
*
* Iniiate controller
  data(lo_control) = new zcl_control(  ).
*
* Get the object from Control
  CALL METHOD lo_control->get_object
    EXPORTING
      if_name = 'ZCL_MODEL'.





*----------------------------------------------------------------------
* Model - Business Logic
*----------------------------------------------------------------------
* Date Range
  DATA: r_erdat  TYPE RANGE OF vbak-erdat,
        la_erdat LIKE LINE OF r_erdat.
*
  la_erdat-SIGN = 'I'.
  la_erdat-OPTION = 'BT'.
  la_erdat-LOW = sy-datum - 10.
  la_erdat-HIGH = sy-datum.
  APPEND la_erdat TO r_erdat.
*
* Get data method
  CALL METHOD lo_control->o_model->get_data
    EXPORTING
      ir_erdat = r_erdat.







*----------------------------------------------------------------------
* View - ALV output
*----------------------------------------------------------------------

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = data(lo_alv)
        CHANGING
          t_table      = lo_control->o_model->t_vbak ).
    CATCH cx_salv_msg INTO data(lx_msg).
  ENDTRY.
*
*
* Displaying the ALV
  lo_alv->display( ).
