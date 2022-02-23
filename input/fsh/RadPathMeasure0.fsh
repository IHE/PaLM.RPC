Instance: RadObs
InstanceOf: Measure
Title: "RadPathMeasureGleasonEx0"
Usage: #example

* status = #draft
* experimental = true
* group[0].stratifier.code = #measure-observation
* group[0].stratifier.component.criteria.language = #text/fhir-x-query
* group[0].stratifier.component.criteria.expression = "/Observation?subject:Patient/{id}/&amp;value-concept=http://radlex.org|RID49502"
* group[1].stratifier.component.code = #measure-observation
* group[1].stratifier.component.criteria.language = #text/fhir-x-query
* group[1].stratifier.component.criteria.expression = "/Observation?subject:Patient/{id}/&amp;value-concept=http://cap.org/eCC|16811"