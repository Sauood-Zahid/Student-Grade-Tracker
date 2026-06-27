CLASS lhc_StudentGrades DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS calculateGrade FOR DETERMINE ON MODIFY
      IMPORTING keys FOR StudentGrades~calculateGrade.

ENDCLASS.

CLASS lhc_StudentGrades IMPLEMENTATION.

  METHOD calculateGrade.
    " 1. Database/Buffer se marks read karne ke liye query
    READ ENTITIES OF ZI_STUDENT_GRADES IN LOCAL MODE
      ENTITY StudentGrades
        FIELDS ( Marks ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_students).

    DATA lt_update TYPE TABLE FOR UPDATE ZI_STUDENT_GRADES.

    " 2. Calculate Grade ONLY FOR DRAFT RECORDS (%is_draft = '01')!
    LOOP AT lt_students ASSIGNING FIELD-SYMBOL(<fs_student>) WHERE %is_draft = '01'.
      DATA(lv_grade) = VALUE string( ).
      IF <fs_student>-Marks >= 90.
        lv_grade = 'A+'.
      ELSEIF <fs_student>-Marks >= 80.
        lv_grade = 'A'.
      ELSEIF <fs_student>-Marks >= 70.
        lv_grade = 'B'.
      ELSEIF <fs_student>-Marks >= 50.
        lv_grade = 'C'.
      ELSE.
        lv_grade = 'F'.
      ENDIF.

      APPEND VALUE #( %tky = <fs_student>-%tky
                      Grade = lv_grade ) TO lt_update.
    ENDLOOP.

    " 3. Calculated Grade ko update karein agar update table khali nahi hai
    IF lt_update IS NOT INITIAL.
      MODIFY ENTITIES OF ZI_STUDENT_GRADES IN LOCAL MODE
        ENTITY StudentGrades
          UPDATE FIELDS ( Grade ) WITH lt_update.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
