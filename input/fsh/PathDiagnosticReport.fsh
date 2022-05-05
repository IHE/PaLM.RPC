Instance: eCCDiagnosticReport
InstanceOf: DiagnosticReport
Title: "PathDiagnostic Report"
Description: "Example Pathology eCC Diagnostic report"
Usage: #example
* id = "eCCDiagnosticReport0"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/DiagnosticReport"
* identifier.value = "PathDiagnosticReport0"
* status = #final
* category = LNC#LP7839-6 "Pathology"
* code = LNC#60568-3 "Pathology Synoptic report"
* subject = Reference(Patient/q201)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(Practitioner/pathpract1)
* performer.display = "Luigi Maas"
* result[0] = Reference(PathLesionSize)
* result[1] = Reference(PathObsSeminalVesicleInvasion)
* result[2] = Reference(PathGleason)
* result[3] = Reference(PathEPE)
* presentedForm.url = "http://example.org/pathology/eCCDiagnosticReport0"