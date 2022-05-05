Instance: PathLesionSize
InstanceOf: Observation
Title: "PathLesionSize"
Usage: #example
* id = "PathLesionSize"
* status = #final
* code = SCT#385014004 "Tumor size, dominant nodule (observable entity)"
* subject = Reference(q201)
* subject.display = "Bibata Amadou"
* performer = Reference(pathpract1)
* performer.display = "Luigi Maas"
* valueQuantity = 100 'mm' "milimeter"
* bodySite = SCT#5026003 "Structure of posterior surface of prostate"