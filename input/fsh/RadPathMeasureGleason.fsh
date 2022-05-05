Instance: MeasureGleason
InstanceOf: Measure
Title: "RadPathMeasureGleasonEx0"
Usage: #example

* name = "Gleason Score Rad Path Correlation"
* status = #draft
* experimental = true
* group[0].stratifier.code = #measure-observation
* group[0].stratifier.component.criteria.language = #text/fhir-x-query
* group[0].stratifier.component.criteria.expression = "/Observation?subject:Patient/{id}/&amp;value-concept=http://snomed.org/sct|372278000"
//change to the question code not the answer code
* group[1].stratifier.component.code = #measure-observation
* group[1].stratifier.component.criteria.language = #text/fhir-x-query
* group[1].stratifier.component.criteria.expression = "/Observation?subject:Patient/{id}/&amp;value-concept=http://snomed.org/sct|372278000"