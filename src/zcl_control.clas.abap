class ZCL_CONTROL definition
  public
  create public .

public section.

  data MODEL_OBJECT type ref to ZCL_MODEL .

  methods GET_OBJECT
    importing
      !NAME type CHAR30 .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_CONTROL IMPLEMENTATION.


  METHOD get_object .
*
    DATA: object TYPE REF TO object.
*
* Generic object reference to importing class
    CREATE OBJECT object TYPE (name).
    IF sy-subrc = 0.
*   Downcasting to assign generic object to O_MODEL
      model_object ?= object.
    ENDIF.
*
  ENDMETHOD.
ENDCLASS.
