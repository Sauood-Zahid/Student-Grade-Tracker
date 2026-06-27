@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Grades Root View'
define root view entity ZI_STUDENT_GRADES as select from zstudent_grades
{
  key student_id as StudentId,
  student_name as StudentName,
  subject as Subject,
  marks as Marks,
  grade as Grade,
  
  @Semantics.systemDateTime.lastChangedAt: true // Is annotation se timestamp automatic save hoga
  last_changed_at as LastChangedAt
}
