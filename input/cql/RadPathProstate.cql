library RadPathProstate

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "RADLEX":  'http://radlex.org'

//Gleason Score codes
code "Gleason Score": '372278000' from SNOMED
code "Structure of posterior surface of prostate": '5026003' from SNOMED
code "clinically significant prostate cancer": 'RID49502' from RADLEX

context Patient

define "Gleason Score Available": 
    [Observation] O
    where O.code ~ "Gleason Score"

define "Rads clinically significant prostate cancer": 
    "Gleason Score Available" O
        where (O.value as CodeableConcept) ~ "clinically significant prostate cancer"

