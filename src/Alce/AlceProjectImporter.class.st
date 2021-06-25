Class {
	#name : #AlceProjectImporter,
	#superclass : #JinProjectVisitor,
	#instVars : [
		'project',
		'phase'
	],
	#category : #'Alce-Importer'
}

{ #category : #'visit-first-objects' }
AlceProjectImporter >> phaseFinished [

	phase := phase + 1.
	self savingPhases ifTrue: [ 
		Smalltalk saveAs:
			Smalltalk changesFile basenameWithoutExtension , '.'
			, phase asString.
		project reopen ]
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitCollectionBlock: aCollectionBlock reseting: aProject [ 

	| batch |
	batch := aCollectionBlock value size / 5.

	1 to: batch do: [ :i | 
		aProject reopen.
		i to: (i + 5 min: aCollectionBlock value size) do: [ :e | 
		(aCollectionBlock value at: e) acceptVisitor: self ].
	 ]
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitProject: aJinAccessProject [

	project := aJinAccessProject.
	phase := 0.

	self state push: (self instantiate: AlcixAccessModule).
	self state top name: aJinAccessProject name.
	self state top anchor: (AlceAnchor on: #/) / aJinAccessProject name.
	self state top addReference: self sdkLibrary.

	self visitCollection: aJinAccessProject modules.
	self phaseFinished.
	self visitCollection: aJinAccessProject reports.
	self phaseFinished.
	self visitCollection: aJinAccessProject references.
	self phaseFinished.
	self visitCollection: aJinAccessProject tables.
	self phaseFinished.
	self visitCollection: aJinAccessProject queries.
	self phaseFinished.
	self visitCollection: aJinAccessProject relations.
	self phaseFinished.
	self visitCollection: aJinAccessProject macros.
	self phaseFinished.
	self visitCollection: aJinAccessProject forms
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitReference: aJinReference [

	| ref |
	aJinReference isAccessProject
		ifTrue: [ ref := self instantiate: AlcixAccessModule ]
		ifFalse: [ 
			ref := self instantiate: AlcixLibrary.
			ref isBuiltIn: aJinReference isBuiltIn ].
	ref anchor: self state top anchor / #references / aJinReference name.
	ref path: aJinReference path fullName.
	ref name: aJinReference name.
	self state top addReference: ref.
	self state push: ref.
	aJinReference isAccessProject
		ifTrue: [ 
			self referenceAccess ifNotNil: [ :r | 
				r visitReference: aJinReference ] ]
		ifFalse: [ 
			self referenceLibrary ifNotNil: [ :r | 
				r visitReference: aJinReference ] ].
	self state pop
]
