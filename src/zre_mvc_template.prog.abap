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
* Initiate controller
  DATA(controller) = NEW zcl_control(  ).
*
* Get the object from Control
  controller->get_object(
    EXPORTING
      name = 'ZCL_MODEL' ).





*----------------------------------------------------------------------
* Model - Business Logic
*----------------------------------------------------------------------
* Date Range
  DATA: record_date      TYPE RANGE OF vbak-erdat.


  INSERT VALUE #( sign = 'I'
                  option = 'BT'
                  low = '20170101'
                  high = '20171231'
                  ) INTO record_date INDEX 1.
*
* Get data method
  controller->model_object->get_data(
    EXPORTING
      record_date = record_date ).







*----------------------------------------------------------------------
* View - ALV output
*----------------------------------------------------------------------

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = DATA(alv_object)
        CHANGING
          t_table      = controller->model_object->sales_doc_data ).
    CATCH cx_salv_msg INTO DATA(msg).
  ENDTRY.
*
*
* Displaying the ALV
  alv_object->display( ).
