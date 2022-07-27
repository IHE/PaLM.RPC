Instance: MeasureGleason
InstanceOf: Measure
Title: "RadPathMeasureGleasonEx0"
Usage: #example

* name = "Gleason Score Rad Path Correlation"
* status = #draft
* experimental = true
* library = "http://OUR-PLACEHOLDER-URL.com/Library/RadPathGleasonCorrelation"
* group[0].stratifier.code = #measure-observation
* group[0].stratifier.component.criteria.language = #text/cql
// replace with CQL statement that searches for Rad specific element 
* group[0].stratifier.component.criteria.expression = "Rads clinically significant prostate cancer"
* group[1].stratifier.component.code = #measure-observation
* group[1].stratifier.component.criteria.language = #text/cql
// replace with CQL statement that searches for Path specific element
* group[1].stratifier.component.criteria.expression = "Path Score of 7"