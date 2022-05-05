Instance: RadDiagnosticReport
InstanceOf: DiagnosticReport
Title: "RadDiagnostic Report"
Description: "Example Structured Radiology Diagnostic report using ACR C/ARDS"
Usage: #example
* id = "RadDiagnosticReport0"
* identifier.use = #usual 
* identifier.type = http://terminology.hl7.org/CodeSystem/v2-0203#ACSN "Accession ID"
* identifier.system = "http://example.org/DiagnosticReport"
* identifier.value = "RadDiagnosticReport0"
* status = #final
* category = DiagnosticCodes#RAD "Radiology"
* code = LNC#68604-8 "Radiology Diagnostic study note"
* subject = Reference(Patient/q201)
* subject.display = "Example Patient"
* effectiveDateTime = "2021-05-11"
* performer = Reference(Practitioner/radpract1)
* performer.display = "Kiki Bambrick"
* result[0] = Reference(RadLeasionSize)
* result[1] = Reference(RadSeminalVesicleInvasion)
* result[2] = Reference(RadGleason)
* result[3] = Reference(RadEPE)
* presentedForm.url = "http://example.org/Radiology/RadDiagnosticReport"