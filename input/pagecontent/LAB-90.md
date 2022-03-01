This section corresponds to transaction [LAB-90] of the IHE Technical Framework. Transaction [LAB-90] is used by the Content Creator and Content Consumer Actors. The [LAB-90] transaction describes how to send data from a Content Creator to a Content Consumer.

### Scope

The Send Concordance Report [LAB-90] transaction is used to transfer a structured concordance report from a Content Creator to the Content Consumer

### Actors Roles

**Table: Actor Roles**

|Actor              | Role |
|-------------------|--------------------------|
| [Content Creator](volume-1.html#contentcreator)    | The Content Creator is responsible for the creation of a FHIR MeasureReport containing correlated radiology and pathology data |
| [Content Consumer](volume-1.html#contentconsumer) | The Content Consumer receives the concordance report containing correlated results |

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include LAB-90.svg%}
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
|-------------|-----------|
| URL         | The RPC Profile does not prescribe the form of the URL to be advertised by a Content Consumer except that the scheme of the URL SHALL be “https.” |
| Headers     | The Update request SHALL contain a Content-type header identifying the payload Type:Content-type: application/fhir+xml ; Type:Content-type: application/fhir+json The request MAY contain any additional headers. For example, a Content Consumer may require an Authorization header. |
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

###### Table 3.Y.4.2.2-1: Send Concordance Report Result status codes

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
* Requirements CapabilityStatement for [Content Creator](CapabilityStatement-IHE.RPC.contentcreator.html)
* Requirements CapabilityStatement for [Content Consumer](CapabilityStatement-IHE.RPC.contentconsumer.html)

### Security Considerations

See [RPC Security Considerations](volume-1.html#security-considerations)

This profile is assumed to use patient data. The appropriate security precautions are expected to be taken to protect PHI, these should include the precautions outlined in the PaLM Security Environment Considerations in PaLM TF-1: Appendix A.
Transport of RPC data SHOULD be safeguarded according to jurisdictional guidelines. To protect data integrity these SHOULD include encryption of the transport layer and the use of an appropriate mutual authentication mechanism which meets these guidelines. 
Content Consumers should also take adequate account of security considerations related to the generic processing of RPC documents.

#### Security Audit Considerations

There is no specific ATNA security audit event that is associated with this transaction. 

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''




