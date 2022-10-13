Instance: MeasureProstateSize
InstanceOf: Measure
Title: "RadPathMeasureProstateSizeEx0"
Usage: #example

* name = "Prostate Size Rad Path Correlation"
* status = #draft
* experimental = true
* group[0].stratifier.code = #measure-observation
* group[0].stratifier.component.criteria.language = #text/cql
* group[0].stratifier.component.criteria.expression = ""
//change to the question code not the answer code
* group[1].stratifier.component.code = #measure-observation
* group[1].stratifier.component.criteria.language = #text/cql
* group[1].stratifier.component.criteria.expression = ""