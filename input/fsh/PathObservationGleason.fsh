Instance: PathObsGleason
InstanceOf: Observation
Title: "PathGleason"
Usage: #example
* id = "PathGleason"
* status = #final
* code = SCT#372278000 "Gleason score"
* subject = Reference(Patient/q201)
* subject.display = "Bibata Amadou"
* performer = Reference(Practitioner/pathpract1)
* performer.display = "Luigi Maas"
* valueCodeableConcept = CAP#16811 "Score 7" 
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"