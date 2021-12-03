CLASS zcl_control DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: o_model TYPE REF TO zcl_model.

    METHODS: get_object
      IMPORTING if_name TYPE char30.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_control IMPLEMENTATION.
  METHOD get_object .
*
    DATA: lo_object TYPE REF TO object.
*
* Generic object reference to importing class
    CREATE OBJECT lo_object TYPE (if_name).
    IF sy-subrc = 0.
*   Downcasting to assign generic object to O_MODEL
      o_model ?= lo_object.
    ENDIF.
*
  ENDMETHOD.
ENDCLASS.
