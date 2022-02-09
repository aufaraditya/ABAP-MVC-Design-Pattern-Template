CLASS zcl_model DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA sales_docs TYPE zshp_vl10.

    METHODS get_sales_docs
      IMPORTING
        !doc_date TYPE tpmy_r_date .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_model IMPLEMENTATION.


  METHOD get_sales_docs.

    DATA sales_doc TYPE zta_sales_doc.

    SELECT * FROM vbak
           INTO  TABLE @DATA(sales_doc_headers)
           WHERE audat IN @doc_date.

    IF sales_doc_headers[] IS NOT INITIAL.

      SELECT * FROM vbap
      INTO TABLE @DATA(sales_doc_items)
      FOR ALL ENTRIES IN @sales_doc_headers
      WHERE vbeln EQ @sales_doc_headers-vbeln.


      LOOP AT sales_doc_headers INTO DATA(sales_doc_header).
        sales_doc = CORRESPONDING #( sales_doc_header ).
        LOOP AT sales_doc_items INTO DATA(sales_doc_item) WHERE vbeln EQ sales_doc_header-vbeln.
          sales_doc = VALUE #( posnr = sales_doc_item-posnr
                               matnr = sales_doc_item-matnr
                               matkl = sales_doc_item-matkl
                               arktx = sales_doc_item-arktx
                               pstyv = sales_doc_item-pstyv ).
          INSERT sales_doc INTO TABLE sales_docs.
          CLEAR sales_doc.
        ENDLOOP.
      ENDLOOP.




    ELSE.
      MESSAGE 'No Data Found' TYPE 'E'.
    ENDIF.

*
*
  ENDMETHOD.
ENDCLASS.
