*&---------------------------------------------------------------------*
*& Report  Z_PROJ_TABFILL
*& Application - MM , Productivity | Developer - HXS0615
*&---------------------------------------------------------------------*
REPORT z_proj_tabfill.

INCLUDE: z_proj_selscreen,
         z_proj_data,
         z_proj_cls.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_fil.
  CALL FUNCTION 'F4_FILENAME'
    EXPORTING
      program_name  = sy-repid
      dynpro_number = sy-dynnr
      field_name    = ' '
    IMPORTING
      file_name     = p_fil.

AT SELECTION-SCREEN.
  IF p_mail IS INITIAL AND p_dl IS NOT INITIAL.
    MESSAGE: 'Kindly check the mail option for sending mail' TYPE 'E' DISPLAY LIKE 'I'.
  ELSEIF p_mail IS NOT INITIAL AND p_dl IS INITIAL.
    MESSAGE: 'Kindly input the DL or uncheck the mail option' TYPE 'E' DISPLAY LIKE 'I'.
  ENDIF.

START-OF-SELECTION.
  IF rad3 IS NOT INITIAL.
    lcl_main=>get_filedata( tab_name =  c_tab1 ).
  ELSEIF rad2 IS NOT INITIAL.
    lcl_main=>get_filedata( tab_name =  c_tab3 ).
  ELSE.
    lcl_main=>get_filedata( tab_name =  c_tab2 ).
  ENDIF.
