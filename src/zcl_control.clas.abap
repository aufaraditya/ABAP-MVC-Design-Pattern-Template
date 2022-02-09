CLASS zcl_control DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA model TYPE REF TO zcl_model .

    METHODS get_object
      IMPORTING
        !name TYPE char30 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_control IMPLEMENTATION.


  METHOD get_object .

    DATA: object TYPE REF TO object.

    TRY.
        CREATE OBJECT object TYPE (name).
      CATCH cx_sy_create_object_error INTO DATA(object_error).
        MESSAGE |{ object_error->get_text( ) }| TYPE 'E'.
    ENDTRY.

    TRY.
        model ?= object.
      CATCH cx_sy_move_cast_error INTO DATA(casting_error).
        MESSAGE |{ casting_error->get_text( ) }| TYPE 'E'.
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
