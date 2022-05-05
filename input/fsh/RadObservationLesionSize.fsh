Instance: RadLeasionSize
InstanceOf: Observation
Title: "RadLeasionSize"
Usage: #example

* status = #final
* code = SCT#385014004 "Tumor size, dominant nodule (observable entity)"
* subject = Reference(Patient/q201)
* subject.display = "Bibata Amadou"
* performer = Reference(Practitioner/radpract1)
* performer.display = "Kiki Bambrick"
* valueQuantity = 110 'mm' "milimeter"
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"