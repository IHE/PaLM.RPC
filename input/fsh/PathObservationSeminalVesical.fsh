Instance: PathObsSeminalVesicleInvasion
InstanceOf: Observation
Title: "PathObsSeminalVesicleInvasion"
Usage: #example
* id = "PathObsSeminalVesicleInvasion"
* status = #final
* code = SCT#384999004 "Status of seminal vesicle invasion by tumor (observable entity)"
* subject = Reference(Patient/q201)
* subject.display = "Bibata Amadou"
* performer = Reference(Practitioner/pathpract1)
* performer.display = "Luigi Maas"
* valueCodeableConcept = SCT#49907008 "Uninvolved (Qualifier Value)"
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"