library RadPathProstate

using FHIR version '4.0.1'

include FHIRHelpers version '4.0.1'
include FHIRCommon called FC

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "RADLEX":  'http://radlex.org'
codesystem "CAP": 'http://cap.org/eCC' // is this the right link?

//Gleason Score codes
code "Gleason Score": '372278000' from SNOMED
code "Structure of posterior surface of prostate": '5026003' from SNOMED
code "clinically significant prostate cancer": 'RID49502' from RADLEX
code "Score 7": 'CAP#16811' from CAP

context Patient

define "Gleason Score Available": 
    [Observation] O
    where O.code ~ "Gleason Score"

define "Rads clinically significant prostate cancer": 
    "Gleason Score Available" O
        where (O.value as CodeableConcept) ~ "clinically significant prostate cancer"

define "Path Score of 7": 
    "Gleason Score Available" O
        where (O.value as CodeableConcept) ~ "Score 7"

