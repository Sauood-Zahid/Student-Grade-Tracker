@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Student Grades Projection View'
define root view entity ZC_STUDENT_GRADES
  provider contract transactional_query
  as projection on ZI_STUDENT_GRADES
{
  @UI.facet: [ { id: 'idGrades', type: #IDENTIFICATION_REFERENCE, label: 'Student Details' } ]

  @UI.lineItem: [ { position: 10 } ]
  @UI.identification: [ { position: 10 } ]
  @EndUserText.label: 'Student ID' // Label added
  key StudentId,

  @UI.lineItem: [ { position: 20 } ]
  @UI.identification: [ { position: 20 } ]
  @EndUserText.label: 'Student Name' // Label added
  StudentName,

  @UI.lineItem: [ { position: 30 } ]
  @UI.identification: [ { position: 30 } ]
  @EndUserText.label: 'Subject' // Label added
  Subject,

  @UI.lineItem: [ { position: 40 } ]
  @UI.identification: [ { position: 40 } ]
  @EndUserText.label: 'Marks' // Label added
  Marks,

  @UI.lineItem: [ { position: 50 } ]
  @UI.identification: [ { position: 50 } ]
  @EndUserText.label: 'Grade' // Label added
  Grade,
  LastChangedAt
  
}
