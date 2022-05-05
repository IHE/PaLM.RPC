Instance: RadSeminalVesicleInvasion
InstanceOf: Observation
Title: "RadSeminalVesicleInvasion"
Usage: #example

* status = #final
* code = SCT#384999004 "Status of seminal vesicle invasion by tumor (observable entity)"
* subject = Reference(Patient/q201)
* subject.display = "Bibata Amadou"
* performer = Reference(Practitioner/radpract1)
* performer.display = "Kiki Bambrick"
* valueCodeableConcept = SCT#49907008 "Uninvolved (Qualifier Value)"
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"