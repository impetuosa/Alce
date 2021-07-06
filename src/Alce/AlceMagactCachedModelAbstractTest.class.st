Class {
	#name : #AlceMagactCachedModelAbstractTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'model',
		'kind',
		'nameOfFSTCitizen',
		'fixture'
	],
	#classInstVars : [
		'magactCachedModel'
	],
	#category : #'Alce-Tests-Core'
}

{ #category : #'building suites' }
AlceMagactCachedModelAbstractTest class >> hoovesModel [

	" 
	
	This is really hacky. should change to something cleaner: 
	It checks that hoovesstore exists. 
	It looks for a model subscriber that is working on the norwind model. 
	If there is a such model, we use it. 
	
	"

	Smalltalk at: #HoovesStore ifPresent: [ :s | 
		s instance applications
			detect: [ :a | 
				a class name = #HoovesModelSubscriber and: [ 
					a modelName = 'magact' ] ]
			ifFound: [ :sub | 
				[ ^ sub model ]
					on: Error
					do: [  ] ] ].
	^ nil
]

{ #category : #'building suites' }
AlceMagactCachedModelAbstractTest class >> magact [
	^ 'C:\WMagnus\magact.accdb' asFileReference
]

{ #category : #'building suites' }
AlceMagactCachedModelAbstractTest class >> magactCachedModel [

	self = AlceMagactCachedModelAbstractTest ifFalse: [ 
		^ AlceMagactCachedModelAbstractTest magactCachedModel ].

	self hoovesModel ifNotNil: [ :m | ^ m ].
	^ magactCachedModel ifNil: [ 
		  magactCachedModel := AlcixModel importFromMSEStream:
			                        self cachedModelMSE readStream ]
]

{ #category : #'building suites' }
AlceMagactCachedModelAbstractTest class >> regenerateCacheModel [

	<example>
	| importer model stream |
	importer := AlceImporter new.
	importer provider
		savingPhases: true;
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importSyntacticElements;
		importLibraryReferences;
		importAccessReferences.

	model := importer import: self magact.
	stream := '' writeStream.
	model exportToMSEStream: stream.
	self class compile: ('
cachedModelMSE
 ^ ''{1}''' format: { (stream contents
				  copyReplaceAll: $' asString
				  with: $' asString , $' asString) }).
	magactCachedModel := model
]

{ #category : #'building suites' }
AlceMagactCachedModelAbstractTest class >> resetMagactCachedModel [
 	<example>
 	magactCachedModel := nil.
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"
"
	actual = expected
		ifFalse: [ (self class class methods
				detect: [ :m | 
					| sc |
					sc := m sourceCode.
					(sc includesSubstring: 'setup')
						and: [ sc includesSubstring: '#' , (fixture at: #functionOrSub) ] ])
				browse ]."
	^ self
		assert: actual = expected
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> assertIfFunction: aBlockClosure [
	^ self assertIfFunction: aBlockClosure ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #helpers }
AlceMagactCachedModelAbstractTest >> assertModel: aModel allAnchorsOfClass: aClass satisfy: aBlock [
	self
		assert:
			((aModel select: [ :element | element isKindOf: aClass ])
				allSatisfy: [ :e | aBlock cull: e cull: e anchor ])
]

{ #category : #helpers }
AlceMagactCachedModelAbstractTest >> assertModel: aModel loads: anAmount of: aClass [
	self
		assert: (aModel select: [ :element | element species =  aClass ]) size
		equals: anAmount
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> firstCitizen [
	^ model
		detect: [ :e | e name = nameOfFSTCitizen and: [ e class = kind ] ]
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> fixture: fx [
	fixture := fx asDictionary 
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> functionOrSub [
	^ self firstCitizen invocables
		detect: [ :i | i selector = (fixture at: #functionOrSub) ]
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> kind: aKind [
	kind := aKind
]

{ #category : #'as yet unclassified' }
AlceMagactCachedModelAbstractTest >> nameOfFSTCitizen: aName [
	 nameOfFSTCitizen := aName
]

{ #category : #helpers }
AlceMagactCachedModelAbstractTest >> setUp [
	super setUp.
	model := self class norwindCachedModel
]
