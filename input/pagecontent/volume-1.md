
# Radiology Pathology Concordance (RPC)

**The Radiology Pathology Concordance (RPC) Profile describes how discrete data elements are collected from structured reports to create an integrated report, where concordance of results is assessed, and reports are shared to an EMR or system in use by a health facility.

The integrated report would extract data from structured radiology and pathology reports, compare the extracted results and assign a score based on the concordance of the results which will be included in a new integrated report.
Use cases include the correlation of structured reporting data for Breast, Prostate and Thyroid cancers, as well as the use of integrated diagnostic reports for radiologist training, as well as a tool in MCC’s and Tumor Board discussions to support decision making for patient care.**

## 1:X.1 RPC Actors, Transactions, and Content Modules <a name="actors-and-transactions"> </a>

* Actors

  - [Content Creator](#xx111-content-creator--)

  - [Content Consumer](#xx112-content-consumer--)

  - [Content Data Structure Creator](#xx113-content-data-structure-creator--)

  - [Content Data Structure Consumer](#xx114-content-data-structure-consumer--)
  
* Transactions

  - [LAB-90](LAB-90.html)

  - [LAB-91](LAB-91.html)

Actors and transactions are used to achieve this use-case...

<div>
{%include LAB-90.svg%}
</div>
<br clear="all">

**Figure: Use Case 1 Process Flow**

This section defines the actors and transactions in this implementation guide.

Figure below shows the actors directly involved in the RPC Profile and the relevant transactions between them.

<div>
{%include RPCActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure: RPC Actor Diagram**

Table XX.1-1: Profile Acronym Profile - Actors and Transactions

| Actors                           | Transactions       | Initiator or Responder | Optionality                | Reference       |
|---------                         |---------------     |------------------------|-----------------           |-----------------|
| Content Creator                  | Send Concordance Report [LAB-90]                          | Initiator | R | PaLM TF-2: 3.Y  |
| Content Consumer                 | Send Concordance Report Response [LAB-90]                 | Responder | R | PaLM TF-2: 3.Y |
| Content Data Structure Consumer  | Retrieve Concordance Report Definition [LAB-91]          | Initiator | R | PaLM TF-2: 3.Y2 |
| Content Data Structure Creator   | Retrieve Concordance Report Definition Response [LAB-91] | Responder | R | PaLM TF-2: 3.Y2 |

{: .grid}

### XX.1.1 Actors
The actors in this profile are described in more detail in the sections below.

#### XX.1.1.1 Content Creator <a name="Content Creator"> </a>

The Content Creator associates key data elements from the Pathology and Radiology structured reports, evaluates the identified data elements for concordance, and assigns a concordance score to the case and creates a concordance report. 

FHIR Capability Statement for [Content Creator](CapabilityStatement-IHE.RPC.ContentCreator.html)

#### XX.1.1.2 Content Consumer <a name="Content Consumer"> </a>

The Content Creator notifies the Content Consumer of the availability of the concordance report. Clinicians can log into the Content Consumer to retrieve the report and review for correlation and concordance.

FHIR Capability Statement for [Content Consumer](CapabilityStatement-IHE.RPC.ContentConsumer.html)

#### XX.1.1.3 Content Data Structure Creator <a name="Content Data Structure Creator"> </a>

The Content Data Structure creator defines a Measure Resource that would be exchanged between the Content Creator and Content Consumer. The implementing site would define the aggregate health data to be exchanged.

FHIR Capability Statement for [Content Data Structure Creator](CapabilityStatement-IHE.RPC.ContentDataStructureCreator.html)

#### XX.1.1.4 Content Data Structure Consumer <a name="Content Data Structure Consumer"> </a>

The Content Data Structure Consumer consumes a Measure Resource produced by a content data structure creator. The content creator or the content consumer may act as a Content Data Structure Consumer.

FHIR Capability Statement for [Content Data Structure Consumer](CapabilityStatement-IHE.RPC.ContentDataStructureConsumer.html)

### Transaction Descriptions
The transactions in this profile are summarized in the sections below.

#### Send Concordance Report [LAB-90]

This transaction describes how to send data from a Content Creator to a Content Consumer.

For more details see the detailed [LAB-90](LAB-90.html) description

#### Retrieve Concordance Report Definition [LAB-91]

This transaction is used to obtain the FHIR Measure to structure and validate a given FHIR MeasureReport. 

For more details see the detailed [LAB-91](LAB-91.html) description 

## XX.2 RPC Actor Options <a name="actor-options"> </a>

No options have been defined for this profile.

## XX.3 RPC Required Actor Groupings <a name="required-groupings"> </a>

RPC has no required actor groupings. Optional actor groupings are defined in Section X.1.

## XX.4 RPC Overview <a name="overview"> </a>

### XX.4.1 Concepts

The following concepts are used in this profile: 
* Measure: the FHIR resource which defines a correlation measure. 
* MeasureReport: the FHIR resource which specifies the data captured according to a Measure.

### XX.4.2 Use Cases

#### XX.4.2.1 Use Case \#1: Concordance Scoring for Radiologist Training

##### XX.4.2.1.1 Concordance Scoring for Radiologist Training Use Case Description 

In this use case Rad-Path concordance will be used as a training tool for Radiologists. The application will assess concordance in identified data elements extracted from structured radiology and pathology reports for Breast, Prostate, and Thyroid.

A report will be produced based on the extracted data and will be assigned a score based on how concordant the radiology report was to the pathology report.

This concordance score will then be shared back with the Radiologist issuing the radiology report for training and quality improvement purposes. The goal is to decrease the number of discordant results and improve accuracy of interpretation and reporting.

##### XX.4.2.1.2 simple name Process Flow

<div>
{%include RPCActorsAndTransactions.svg%}
</div>
<br clear="all">

Figure XX.4.2.1-2: Basic Process Flow in RPC Profile

#### XX.4.2.2 Use Case \#2: Rad-Path Concordance and Reporting for MCC/Tumor Board Review

##### XX.4.2.2.1 Rad-Path Concordance and Reporting for MCC/Tumor Board Review

In this use case an integrated diagnostic report will be created to facilitate discussions in a group setting such as Tumor Boards/ Multidisciplinary Cancer Conferences (MCC). Tumor Boards/ MCCs bring together a multidisciplinary group of clinicians and other care providers to review cancer cases, share knowledge and develop care plans for cancer patients. Radiology and pathology reports provide key information needed to make care plans and treatment decisions.

Radiology and Pathology data will be extracted from structured Radiology and Pathology reports based on identified key data elements. Extracted data will automatically be assessed for concordance and an integrated report will be issued.
An integrated diagnostic report would enable the clinicians in a group setting to more quickly and effectively make treatment or care decisions for a cancer patient.

#### XX.4.2.3 Use Case \#3: Breast Rad-Path Concordance

##### XX.4.2.3.1 Breast Rad-Path Concordance

In this use case an application extracts data from structured radiology and pathology reports to create an integrated diagnostic report for Breast lesions.

The Breast Imaging Reporting and Data System (BI-RADS) enables the structured and standardized collection of Mammography, Ultrasound, and MRI results through radiology information systems (RIS) or voice recognition systems.

The College of American Pathologists (CAP) Cancer Protocols for DCIS Biopsy and Invasive Breast Cancer Biopsy collect pathologic data in a structured format which is integrated with Laboratory Information Systems (LIS).

Data elements important to the diagnosis of Breast Cancer will be extracted from the LIS and RIS or Voice Recognition System through an application, to create an integrated diagnostic report that correlates radiology and pathology results. In particular it is the correlation of ‘Masses’ ‘Calcifications’ and ‘Laterality’ in BI-RADS and ‘Histologic Type’, ‘ Microcalcifications’ and ‘Specimen Laterality’ within the CAP Cancer Protocols that is required as part of an integrated diagnostic report to confirm diagnosis.

###### Proposed Data Element Mapping

| BIRADS Mammo |	BIRADS Ultrasound |	BIRADS MRI | CAP DCIS Biopsy |	CAP Invasive Breast Biopsy |	Equivalent |	Cardinality	| Notes |
| ------------ | ------------------ | ---------- | --------------- | -------------------------- | ----------- | ------------ | ----- |
| Masses |	Masses |	Masses |	Histologic Type |	Histologic Type |	Histologic Type; Related To Masses	| 1..* |	May be valuable as a description of Mass |
| Calcifications | Calcifications |	     |      | Microcalcifications |	Inexact |	*..1 | Comparing presence or not in Pathology. Radiology specifies |
| Laterality | Laterality |	Laterality | Specimen Laterality |	Specimen Laterality |	Equal |	1..1 | For Quality Check |


#### XX.4.2.4 Use Case \#4: Prostate Rad-Path Concordance

##### XX.4.2.4.1 Prostate Rad-Path Concordance

In this use case an application extracts data from structured radiology and pathology reports to create an integrated diagnostic report for Prostate lesions.

The Prostate Imaging Reporting and Data System (PI-RADS) enables the structured and standardized collection of prostate MRI results and reporting through radiology information systems (RIS) or voice recognition systems.

The College of American Pathologists (CAP) Cancer Protocols for Radical Prostatectomy collect pathologic data in a structured format which is integrated with laboratory information systems. 

Data elements important to the diagnosis of Prostate Cancer will be extracted from the LIS, and RIS or voice recognition system through an application, to create an integrated diagnostic report that correlates radiology and pathology results. 

###### Proposed Data Element Mapping

| PI-RADS | CAP Radical Prostatectomy Protocol |	Equivalent |	Cardinality |
| ----- | ------------------------------------ | ---------- | -----------|
| Prostate Size	| Prostate Size: Size (centimeters)	| Equal	| 1..1 |
| Lesion Size |	Tumor size (dominant nodule, if present):|	Equivalent |	1..1 |
|Tumor Location	| Location of dominant nodule	| Equivalent	| 1..1 |
| Extracapsular extension	| Extraprostatic Extension (EPE)	|Equal	| 1..1 |
| Seminal vesicle invasion |	Seminal Vesicle Invasion | Equal |	1..1 |



#### XX.4.2.5 Use Case \#5: Thyroid Rad-Path Concordance

##### XX.4.2.5.1 Thyroid Rad-Path Concordance

In this use case an application extracts data from structured radiology and pathology reports to create an integrated diagnostic report for Thyroid tumors.

The Thyroid Imaging Reporting and Data System (TI-RADS) enables the structured and standardized collection of Ultrasound results and reporting through radiology information systems (RIS) or voice recognition systems.

The College of American Pathologists (CAP) ‘Protocol for Examination of Specimens from Patients with Carcinomas of the Thyroid Gland’ collect pathologic data in a structured format which is integrated with laboratory information systems.

Data elements important to the diagnosis of Thyroid Cancer will be extracted from the LIS, and RIS or Voice Recognition System through an application, to create an integrated diagnostic report that correlates radiology and pathology results. In particular it is the correlation of ‘Shape’ and ‘Margin’ in TI-RADS and ‘Tumor Size’ and ‘Margins’ and within the CAP Cancer Protocols that is required as part of an integrated diagnostic report to confirm diagnosis.

## XX.5 RPC Security Considerations <a name="security-considerations"> </a>

PaLM defines a number of security considerations. Implementers are expected to follow all security best practices in order to safeguard patient data. 
See PaLM Security Environment Considerations in PaLM TF-1: Appendix A.
See ATNA Security considerations in ITI TF-1: 9.5
See IUA Security considerations in ITI IUA Supplement Section TF-1: 34.5

## XX.6 RPC Cross-Profile Considerations <a name="other-grouping"> </a>

## XX.6.1 SDC - Structured Data Capture

A Form Filler may be grouped with a Content Creator to push data to a Content Consumer. A Form Filler would generate structured data which is capable of being transformed to a FHIR message compliant with this profile.

## XX.6.2 APSR - Anatomic Pathology Structured Report

An APSR Content Creator may create content that an RPC Content Creator can send to an RPC Content Consumer. The APSR content could be structured in a FHIR message much like the data captured by an SDC Form Filler. 



