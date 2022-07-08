library RadPathCommon

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "RADLEX":  'http://radlex.org'

codesystem "ObservationCategory": 'http://terminology.hl7.org/CodeSystem/observation-category'

// MedicationRequest Category Codes
code "Social History": 'social-history' from "ObservationCategory" display 'Social History'
code "Vital Signs": 'vital-signs' from "ObservationCategory" display 'Vital Signs'
code "Imaging": 'imaging' from "ObservationCategory" display 'Imaging'
code "Laboratory": 'laboratory' from "ObservationCategory" display 'Laboratory'
code "Procedure": 'procedure' from "ObservationCategory" display 'Procedure'
code "Survey": 'Survey' from "ObservationCategory" display 'Survey'
code "Exam": 'exam' from "ObservationCategory" display 'Exam'
code "Therapy": 'therapy' from "ObservationCategory" display 'Therapy'
code "Activity": 'activity' from "ObservationCategory" display 'Activity'