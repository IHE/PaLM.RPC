Instance: RadGleason
InstanceOf: Observation
Title: "RadGleason"
Usage: #example

* status = #final
* code = SCT#372278000 "Gleason score"
* subject = Reference(Patient/q201)
* subject.display = "Bibata Amadou"
* performer = Reference(Practitioner/radpract1)
* performer.display = "Kiki Bambrick"
* valueCodeableConcept = RAD#RID49502 "clinically significant prostate cancer"
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"