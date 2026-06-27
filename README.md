# Student Grade Tracker (ABAP RAP)

A transactional cloud application built on the SAP BTP ABAP Environment using the RESTful ABAP Programming Model (RAP) with Draft capabilities and real-time business logic.

---

## Key Features

* Full CRUD Operations : Create, Read, Update, and Delete student records.
* Draft Capability : Built-in auto-save and draft data handling.
* Real-time Grade Calculation : Instant grade calculation as soon as the `Marks` field is modified on the screen.
* Optimistic Locking : Concurrency control using standard `LastChangedAt` timestamp (`tzntstmp`).
* OData V4 UI Service : Exposed via OData V4 UI Service Binding for Fiori Elements.

## Tech Stack & Architecture

* Database Table : `zstudent_grades` (Active) & `zstudent_graded` (Draft).
* CDS Views : 
  * Interface View: `ZI_STUDENT_GRADES` (Data Model)
  * Projection View: `ZC_STUDENT_GRADES` (UI Annotations & Labels)
* Behavior Definition (BDEF) : Managed RAP with Draft and dynamic mapping.
* Business Logic Class : `zbp_i_student_grades` (Grade calculation handler).
* Service Exposure : Service Definition (`ZUI_STUDENT_GRADES`) & Service Binding (`ZUI_STUDENT_GRADES_O4`).

## Grading Business Logic

| Marks | Grade |
| :--- | :--- |
| $\ge$ 90 | **A+** |
| $\ge$ 80 | **A** |
| $\ge$ 70 | **B** |
| $\ge$ 50 | **C** |
| $<$ 50 | **F** |

---

## Environment
* IDE: Eclipse ADT (ABAP Development Tools)
* Platform : SAP BTP ABAP Environment
