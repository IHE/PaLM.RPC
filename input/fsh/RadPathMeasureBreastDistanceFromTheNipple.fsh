Instance: MeasureBreastDistanceFromTheNipple
InstanceOf: Measure
Title: "RadPathMeasureBreastDistanceFromTheNippleEx0"
Usage: #example

* name = "Breast Distance from the Nipple Rad Path Correlation"
* status = #draft
* experimental = true
* group[0].stratifier.code = #measure-observation
* group[0].stratifier.component.criteria.language = #text/fhir-x-query
* group[0].stratifier.component.criteria.expression = ""
//change to the question code not the answer code
* group[1].stratifier.component.code = #measure-observation
* group[1].stratifier.component.criteria.language = #text/fhir-x-query
* group[1].stratifier.component.criteria.expression = ""