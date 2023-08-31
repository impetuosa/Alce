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
