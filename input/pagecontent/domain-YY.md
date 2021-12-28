This section corresponds to transaction [LAB-Y] of the IHE Technical Framework. Transaction [LAB-Y] is used by the Content Creator and Content Consumer Actors. The [LAB-Y] transaction describes how to send data from a Content Creator to a Content Consumer.

### Scope

The Send Concordance Report [LAB-Y] transaction is used to transfer a structured concordance report from a Content Creator to the Content Consumer

### Actors Roles

**Table: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Content Creator](volume-1.html#contentcreator)    | The Content Creator is responsible for the creation of a FHIR MeasureReport containing correlated radiology and pathology data |
| [Content Consumer](volume-1.html#contentconsumer) | The Content Consumer receives the concordance report containing correlated results |

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include domain-Y-seq.svg%}
</div>
<br clear="all">

**Figure: Send Concordance Report Interactions**


#### Send Concordance Report Message
This transaction transmits RPC-conformant messages containing correlated results from the content creator to the content consumer. 
The Send Concordance Report is implemented as a FHIR create Transaction defined in the RESTful API implementation guide: https://www.hl7.org/fhir/http.html#create 

The format for this transaction is as follows:
POST/PUT [base]/MeasureReport 


##### Trigger Events

Examples of events which might trigger a Send Concordance Report transaction include, but are not limited to: 
- Completion of a radiology and pathology report where results are collected and a concordance report is created immediately
- An overnight batch job where the report is created whenever the function is run 

##### Message Semantics

The Content Creator creates an RPC conformant message containing correlated results that meets the requirements of the RPC Measure. The Content Creator SHALL send the message using Send Concordance Report and the Content Consumer SHALL consume the message according to the RPC Measure. The table below describes the request. 

|             | Description |
| ----------- | ----------- |
| URL         | The RPC Profile does not prescribe the form of the URL to be advertised by a 
                Content Consumer except that the scheme of the URL SHALL be “https.” |
| Headers     | The Update request SHALL contain a Content-type header identifying the payload
                Type:Content-type: application/fhir+xml
                Type:Content-type: application/fhir+json
                The request MAY contain any additional headers. For example, a Content Consumer may require an Authorization header. |
|             | A Content Consumer MAY support additional parameters |
| BODY        | The body of a RPC Send Concordance Report request SHALL contain a valid RPC data payload as described in Section 8.2 of this profile. |

The report SHALL contain the following elements: 
subject 
    A required patient or group reference
period
    The start and end of the reporting period
group.coding.code 
    A required reference for a valid report
stratifier.stratum.value
    A required value for each report


##### Expected Actions

The Content Consumer SHALL processes the RPC message received and return the status of the transaction as a Send Concordance Report Result as defined in Section 3.Y.4.2.

#### Send Concordance Report Response Message

This transaction is an acknowledgement of RPC POST Content transaction from the Content Consumer to the Content Creator.
The Send Concordance Report Response is implemented as an HTTP response. It is expected to be made synchronously.

##### Trigger Events

A Content Consumer sends a Send Concordance Report Response when the Concordance report is received from the Content Creator. 

##### Message Semantics

The Send Concordance Report Result is implemented as an HTTP Response. The response may include content in the body to provide an implementation specific informative message on the completed status of the transaction. The response shall contain an HTTP status code. The table below describes the codes which may be produced by the Content Consumer which have a specific meaning related to the transaction.
Note that a Content Creator should be prepared to handle additional status codes not particular to the transaction, such as authorization, server or network error codes. HTTP status codes correspond to FHIR HTTP 3.1.0.4.2 Rejecting Updates (https://www.hl7.org/fhir/http.html#rejecting-updates). 

Table 3.Y.4.2.2-1: Send Concordance Report Result status codes

| HTTP Status Code | Interpretation |
| ---------------- | -------------- |
| 200              | Send Concordance Report Request was successfully processed |
| 202              | Send Concordance Report Request has been accepted for processing, but the processing has not been completed. The request might or might not be eventually acted upon, and may be disallowed when processing occurs. |
| 303              | The response to the Send Concordance Report when the task is complete can be retrieved from another URL. When received in response to a Send Concordance Report, the client should presume that the server has received the data and should issue a redirect with a separate GET message. |
| 400              | Bad Request - message content is badly formed or invalid |
| 401              | Not authorized - authorization is required for the interaction that was attempted |
| 404              | Not found - resource type is not supported |
| 405              | Method not allowed - the resource did not exist prior to the update, and the server does not allow client defined ids |
| 409/412          | Conflict - invalid identifier in the message content. |
| 415              | Unsupported content-type or media |
| 422              | Unprocessable entity - The MeasureReport does not adhere to RPC Profile on the required fields, etc. |
| 501              | The request method is not implemented. |

##### Expected Actions

A Content Consumer SHALL respond with appropriate error codes in the event of receiving an invalid MeasureReport according to the FHIR 3.1.0.4.2 Rejecting Updates. This response should include the appropriate code detailed in Table 3.Y.4.2.2-1 in a FHIR OperationOutcome resource. 


### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Client](CapabilityStatement-IHE.FooBar.client.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.FooBar.server.html)

### Security Considerations

See [MHD Security Considerations](volume-1.html#security-considerations)

This profile is assumed to use patient data. The appropriate security precautions are expected to be taken to protect PHI, these should include the precautions outlined in the PaLM Security Environment Considerations in PaLM TF-1: Appendix A.
Transport of RPC data SHOULD be safeguarded according to jurisdictional guidelines. To protect data integrity these SHOULD include encryption of the transport layer and the use of an appropriate mutual authentication mechanism which meets these guidelines. 
Content Consumers should also take adequate account of security considerations related to the generic processing of RPC documents.

#### Security Audit Considerations

There is no specific ATNA security audit event that is associated with this transaction. 

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''




This section corresponds to transaction [LAB-Y2] of the IHE Technical Framework. Transaction [LAB-Y2] is used by the Content Data Structure Consumer and Content Data Structure Creator Actors. The [LAB-Y2] transaction describes how to retrieve a definition of a concordance report so that a concordance report can be created and/or validated. 

### Scope

The Retrieve Concordance Report Definition [Lab-Y2] transaction is used to obtain the FHIR Measure to structure and validate a given FHIR MeasureReport.

### Actors Roles

**Table: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Content Data Structure Creator](volume-1.html#contentdatastructurecreator)    | The Content Data Structure Creator is responsible for the creation of a Measure Resource, which specifies the structure of a given MeasureReport |
| [Content Data Structure Consumer](volume-1.html#contentdatastructureconsumer) | A Content Data Structure Consumer is responsible for receiving the Measure Resource and validating its messages |

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include domain-Y-seq.svg%}
</div>
<br clear="all">

**Figure: Retrieve Concordance Report Definition Interactions**


#### Retrieve Concordance Report Definitision Message
This transaction details the Content Data Structure Consumer requesting an RPC Measure from a Content Data Structure Creator. The Measure MAY be used by the Content Consumer to validate their RPC messages upon receipt. As such, it is expected that the Content Consumer and Content Data Structure Consumer MAY be bundled in most use cases.

The Retrieve Concordance Report Definition [LAB-Y2] is implemented as a FHIR Read transaction defined in the RESTful API implementation guide: https://www.hl7.org/fhir/http.html#read. 

The format for this transaction is as follows:
GET [base]/Measure/[id]



##### Trigger Events

A Content Data Structure Consumer sends a Retrieve Concordance Report Definition [LAB-Y2] as a request for a given Measure from a Content Data Structure Creator.

##### Message Semantics

The following table describes the messaging semantics for a Concordance Report Definition.

|             | Description |
| ----------- | ----------- |
| URL         | The RPC Profile does not prescribe the form of the URL to be advertised by a Content Consumer except that the scheme of the URL SHALL be “https”. |
| Headers     | The Read request SHALL contain a Content-type header identifying the payload
    Type:Content-type: application/ fhir+xml
    Type:Content-type: application/fhir+json
    The request MAY contain any additional headers. For example, a Content Creator may require an Authorization header. |
| BODY        | The body of an RPC Retrieve Data Structure request SHALL contain the ID of the requested Measure resource. |

##### Expected Actions

The Content Data Structure Consumer SHALL send a request for a given Measure from the Content Data Structure Creator. 

#### Retrieve Concordance Report Definition Response Message

This transaction defines the response given by a Content Data Structure Creator to a Content Data Structure Consumer. 
The Retrieve Concordance Report Definition [PALM-Y2] Response is implemented as a FHIR Read transaction defined in the RESTful API implementation guide: https://www.hl7.org/fhir/http.html#read. 

An example Measure is provided in PaLM TF-3: Appendix A.1.

##### Trigger Events

A Content Data Structure Creator SHALL return a Report Concordance Definition Response if a Content Consumer has sent a Retrieve Concordance Report Definition Request. 

##### Message Semantics

The Content Data Structure Creator SHALL conform to HTTPS standards and respond to the Retrieve Concordance Report Definition Request with the appropriate status code outlined in the table below.

Table 3.Y2.4.2.2-1: Retrieve Concordance Report Definition Result Status Codes

| HTTP Status Code | Interpretation |
| ---------------- | -------------- |
| 200              | Retrieve Concordance Report Definition Request was successfully processed |
| 202              | Retrieve Concordance Report Definition Request has been accepted for processing, but the processing has not been completed. The request might or might not be eventually acted upon, and may be disallowed when processing occurs. |
| 303              | The response to the Retrieve Concordance Report Definition Request when the task is complete can be retrieved from another URL. When received in response to a Retrieve Concordance Report Definition, the client should presume that the server has received the data and should issue a redirect with a separate GET message. |
| 400              | Bad Request - message content is badly formed or invalid. |
| 401              | Not authorized - authorization is required for the interaction that was attempted. |
| 404              | Not found - The referenced Measure resource was not found. |
| 405              | Method not allowed - the resource did not exist prior to the update, and the server does not allow client defined ids. |
| 409/412          | Conflict - invalid identifier in the message content. |
| 415              | Unsupported content-type or media |
| 422              | Unprocessable entity - The referenced Measure resource does not adhere to the message semantics. |
| 501              | The request method is not implemented. |

The HL7 FHIR Measure SHALL contain the following elements: 
title
	The name for this concordance report.
status
	The publication status of this Measure.
group.code
	The meaning of the group.
group.stratifier
	The criteria for the measure.
group.straifier.code
	The meaning of the stratifier.
group.component 
	A separator for multiple stratifiers part of a single group.
group.component.criteria
The criteria for the group including the language and expression for where to find the data in a given patient record in order to build the MeasureReport.


##### Expected Actions

The Content Data Structure Creator SHALL return the requested Measure in the Concordance Report Definition Response to the Content Data Structure Consumer.

### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Client](CapabilityStatement-IHE.FooBar.client.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.FooBar.server.html)

### Security Considerations

See [MHD Security Considerations](volume-1.html#security-considerations)

This profile is assumed to use patient data. The appropriate security precautions are expected to be taken to protect PHI, these should include the precautions outlined in the PaLM Security Environment Considerations in PaLM TF-1: Appendix A.
Transport of RPC data SHOULD be safeguarded according to jurisdictional guidelines. To protect data integrity these SHOULD include encryption of the transport layer and the use of an appropriate mutual authentication mechanism which meets these guidelines. 
Content Consumers should also take adequate account of security considerations related to the generic processing of RPC documents.

#### Security Audit Considerations

TThere are no specific security considerations for FHIR Measures, as they should not contain PHI.

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''