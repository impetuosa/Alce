Class {
	#name : #AlceProjectImporter,
	#superclass : #JinProjectVisitor,
	#instVars : [
		'project',
		'phase',
		'processedReferences',
		'projects'
	],
	#category : #'Alce-Importer'
}

{ #category : #'visit-first-objects' }
AlceProjectImporter >> assertIf: abool [ 
	self assert: abool
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> initialize [

	super initialize.
	processedReferences := Dictionary new.
	projects := Stack new.
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> phaseFinished [

	phase := phase + 1.
	self savingPhases ifTrue: [ 
		Smalltalk saveAs:
			Smalltalk changesFile basenameWithoutExtension , '.'
			, phase asString.
		projects top reopen ]
]

{ #category : #accessing }
AlceProjectImporter >> projects [
	^ projects
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitCollection: aCollectionBlock [

	| size |
	size := aCollectionBlock value size.
	1 to: size do: [ :i | (aCollectionBlock value at: i) acceptVisitor: self ].
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitProject: aJinAccessProject [

	| ret |
	
	
	
	
	projects push: aJinAccessProject.

	phase := 0.


	self state ifEmpty: [ 
		self state push: (self instantiate: AlcixAccessModule) ].
	ret := self state top.
	
	
	self state top name: aJinAccessProject name.
	self state top anchor: (AlceAnchor on: #/) / aJinAccessProject name.
	self state top addReference: self sdkLibrary.
	self state top path: aJinAccessProject projectPath fullName. 
	
	processedReferences
		at:aJinAccessProject projectPath fullName asLowercase ifAbsentPut: [ self state top ].
	
	self visitCollection: [ 
		aJinAccessProject
			ensureIsOpen;
			modules ].
	self phaseFinished.
	self visitCollection: [ 
		aJinAccessProject
			ensureIsOpen;
			reports ].
	"self phaseFinished.
	self visitCollection: aJinAccessProject tables.
	self phaseFinished.
	self visitCollection: aJinAccessProject queries.
	self phaseFinished.
	self visitCollection: aJinAccessProject relations.
	self phaseFinished.
	self visitCollection: aJinAccessProject macros."
	self phaseFinished.
	self visitCollection: [ 
		aJinAccessProject
			ensureIsOpen;
			forms ].
	self phaseFinished.
	self visitCollection: [ 
		aJinAccessProject
			ensureIsOpen;
			references ].
	self phaseFinished.
	projects pop.
	self assertIf: ret = self state top.



	^ ret
]

{ #category : #'visit-first-objects' }
AlceProjectImporter >> visitReference: aJinReference [

	| ref |
	processedReferences
		at: aJinReference path fullName asLowercase
		ifPresent: [ :a | 
			self state top addSecondary: a.
			^ self ].

	aJinReference isAccessProject
		ifTrue: [ ref := self instantiate: AlcixAccessModule ]
		ifFalse: [ 
			ref := self instantiate: AlcixLibrary.
			ref isBuiltIn: aJinReference isBuiltIn ].


	processedReferences
		at: aJinReference path fullName asLowercase
		put: ref.



	ref anchor: self state top anchor / #references / aJinReference name.
	ref path: aJinReference path fullName.
	ref name: aJinReference name.
	self state top addReference: ref.
	self state top addSecondary: ref.
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
