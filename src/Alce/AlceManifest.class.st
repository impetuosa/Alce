"
Alce is a Famix-Meta model describing Microsoft Access.
As microsoft access is not the same kind of language represneted with Famix, I choosed to not use the traits in the Famix generator.

## Tagging artifacts

One of the most complex obstacles to software migration is the tangling of architectural concerns: the spaghetti code. We expect the different artefacts to be tagged
to enable automatic architectural analysis. Each artefact must be labelled with its architectural concern.
We ask the user to label the different libraries and sub-projects with their related architectural concerns.
To ease the task of tagging, we contribute two tag propagation algorithms: one for the declaration elements and the latter for the reference elements.
All the tags assigned in part 1 are assigned manually by a user. 
All the tags in part 2 are inferred hierarchically by either belonging or inheritance in the case of Forms and Reports. 
All the tags in part 3 are inferred by usage. As the DAO library is catalogued as DataAccess, the usage of the method “OpenRecordset” is also labelled as DataAccess.

## Hierarchical tag propagation algorithm. 
This algorithm tells that the tag of a declared entity is either its particular tag or the tag of its direct container (library, module, etc.). In the case of Forms and Reports, they share the architectural tag of the Form and Report classes available in the library Access. In the case of Tables
and Queries, they share the architectural tag of the TableDef and QueryDef classes available in the library Access.
For this, a user can tag a specific library as UI, and all the elements defined within this library are considered UI unless the element is tagged with another tag.
This algorithm is used to know the tag of each declaration element. Because it assigns tags based on tree hierarchy, we call this algorithm hierarchical tag propagation.


## Usage tag propagation algorithm. 
Parallely we propose a usage tag propagation algorithm for tagging expressions. This algorithm only tags references: type usage
and expressions which refer to a tagged artefact. For doing so, it tells that the tag of an expression is the tag of the referred artefact. Because it assigns tags based
on the relation between definitions and usage, we call this algorithm the usage propagation algorithm.


## Hierarchically and Usage concerned elements. 
 All the elements in a method have a tag. We call hierarchically concerned elements (HCE) those elements tagged with the same tag as the method containing the code or with the tag Language. 
 Like this, any usage of, for example, a string library use is considered to be part of the concern that is to be solved by the analysed entity. We call usage-concerned elements (UCE) those that are not hierarchically concerned and calculated through the usage tag propagation algorithm.



"
Class {
	#name : #AlceManifest,
	#superclass : #PackageManifest,
	#category : #'Alce-Manifest'
}

{ #category : #examples }
AlceManifest class >> exampleLoadAlce [

	<example>
	| dam alce |
	
	"
	Alce model is built based on a DAM model. 
	To know how to build a DAM model, browse the example JinDAMManiest exampleImporterForAlce.
	
	1 - Create a DAM model
	"
	dam := JinDAMManiest exampleImporterForAlce.
	
	"
	2- Create an Alce model by using the TwoPhase loader
	"
	alce := AlceJinDAMTwoPhaseLoader new load: dam.
	
	^ alce.
	
	
	
	
	
		        
]

{ #category : #examples }
AlceManifest class >> exampleLoadAlceAndAutomaticallyTag [

	<example>
	| dam alce |
	
	"
	Alce model is built based on a DAM model. 
	To know how to build a DAM model, browse the example JinDAMManiest exampleImporterForAlce.
	
	1 - Create a DAM model
	"
	dam := JinDAMManiest exampleImporterForAlce.
	
	"
	2- Create an Alce model by using the TwoPhase loader
	"
	alce := AlceJinDAMTwoPhaseLoader new load: dam.
	
	"
	3- Create tags for artefacts, and tag them one at the time. 
	"
	alce createArtefactCategory. 
	
	
	"
	4- Create tags for the architecture.  
	"
	alce createArchitectureCategory.
	
	
	
	^ alce.
	
	
	
	
	
		        
]

{ #category : #load }
AlceManifest class >> loadAddBaseline [

	<load>
	| spec |
	spec
		baseline: 'Alce'
		with: [ 
		spec repository: 'gitlab://gitlab.forge.berger-levrault.com:bl-drit/bl.drit.experiments/software.engineering/microsoft-access-migration/Alce/src' ]
]

{ #category : #load }
AlceManifest class >> loadMetacello [

	<load>
	  Metacello new
    	repository: 'gitlab://gitlab.forge.berger-levrault.com:bl-drit/bl.drit.experiments/software.engineering/microsoft-access-migration/Alce/src';
    	baseline: 'Alce';
    	onWarningLog;
    	load
	

]
