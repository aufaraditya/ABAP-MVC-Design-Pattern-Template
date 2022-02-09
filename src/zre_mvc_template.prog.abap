REPORT zre_mvc_template.



CONSTANTS model_name TYPE char30 VALUE 'ZCL_MODEL'.
CONSTANTS report_name TYPE lvc_title VALUE 'Sales Document Report'.

START-OF-SELECTION.
*----------------------------------------------------------------------
* Controller
*----------------------------------------------------------------------


  TRY.
      DATA(controller) = NEW zcl_control(  ).
    CATCH cx_sy_create_object_error INTO DATA(object_error).
      MESSAGE |{ object_error->get_text( ) }| TYPE 'E'.
  ENDTRY.

  TRY.
      controller->get_object(
        EXPORTING
          name = model_name ).
    CATCH cx_method_not_implemented INTO DATA(control_method_error).
      MESSAGE |{ control_method_error->get_text( ) }| TYPE 'E'.
  ENDTRY.




*----------------------------------------------------------------------
* Model - Business Logic
*----------------------------------------------------------------------

  DATA: doc_date      TYPE RANGE OF vbak-audat.


  INSERT VALUE #( sign = 'I'
                  option = 'BT'
                  low = '20170101'
                  high = '20171231'
                  ) INTO doc_date INDEX 1.


  TRY.
      controller->model->get_sales_docs(
        EXPORTING
          doc_date = doc_date ).

    CATCH cx_method_not_implemented INTO DATA(model_method_error).
      MESSAGE |{ model_method_error->get_text( ) }| TYPE 'E'.
  ENDTRY.



*----------------------------------------------------------------------
* View - ALV output
*----------------------------------------------------------------------

  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = DATA(alv)
        CHANGING
          t_table      = controller->model->sales_docs ).
    CATCH cx_salv_msg INTO DATA(alv_error).
      MESSAGE |{ alv_error->get_text( ) }| TYPE 'E'.
  ENDTRY.

  DATA(display_settings) = alv->get_display_settings( ).
  display_settings->set_striped_pattern( if_salv_c_bool_sap=>true ).
  display_settings->set_list_header( report_name ).

  DATA(alv_columns) = alv->get_columns( ).
  alv_columns->set_optimize( ).

  alv->display( ).
