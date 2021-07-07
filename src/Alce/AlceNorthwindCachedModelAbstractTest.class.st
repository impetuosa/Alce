Class {
	#name : #AlceNorthwindCachedModelAbstractTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'model',
		'kind',
		'nameOfFSTCitizen',
		'fixture'
	],
	#classInstVars : [
		'norwindCachedModel'
	],
	#category : #'Alce-Tests-Core'
}

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> hoovesModel [

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
					a modelName = 'norwind' ] ]
			ifFound: [ :sub | 
				[ ^ sub model ]
					on: Error
					do: [  ] ] ].
	^ nil
]

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> norwind [
	^ 'c:\Northwind.accdb' asFileReference
]

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> norwindCachedModel [

	self = AlceNorthwindCachedModelAbstractTest ifFalse: [ 
		^ AlceNorthwindCachedModelAbstractTest norwindCachedModel ].

	self hoovesModel ifNotNil: [ :m | ^ m ].
	^ norwindCachedModel ifNil: [ 
		  norwindCachedModel := AlcixModel importFromMSEStream:
			                        self cachedModelMSE readStream ]
]

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> regenerateCacheModel [

	<example>
	| importer |
	importer := AlceImporter new.
	importer provider
		importProjectElements;
		importGUIElements;
		importGUIControlElements;
		importCodeElements;
		importSyntacticElements;
		importLibraryReferences.

	norwindCachedModel := importer import: self norwind.

	self writeModelIntoFile: norwindCachedModel
]

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> resetNorwindCachedModel [
 	<example>
 	norwindCachedModel := nil.
]

{ #category : #'building suites' }
AlceNorthwindCachedModelAbstractTest class >> writeModelIntoFile: model [

	| stream |
	stream := 'norwindmodel.mse' asFileReference writeStream.
	model exportToMSEStream: stream.
	stream close.
	stream := 'norwindmodel.json' asFileReference writeStream.
	model exportToJSONStream: stream.
	stream close.
	stream := 'norwindmodel.fl' asFileReference writeStream.
	FLSerializer serialize: model on: stream.
	stream close. 
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> assert: actual equals: expected [
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
AlceNorthwindCachedModelAbstractTest >> assertIfFunction: aBlockClosure [
	^ self assertIfFunction: aBlockClosure ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #helpers }
AlceNorthwindCachedModelAbstractTest >> assertModel: aModel allAnchorsOfClass: aClass satisfy: aBlock [
	self
		assert:
			((aModel select: [ :element | element isKindOf: aClass ])
				allSatisfy: [ :e | aBlock cull: e cull: e anchor ])
]

{ #category : #helpers }
AlceNorthwindCachedModelAbstractTest >> assertModel: aModel loads: anAmount of: aClass [
	self
		assert: (aModel select: [ :element | element species =  aClass ]) size
		equals: anAmount
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> firstCitizen [
	^ model
		detect: [ :e | e name = nameOfFSTCitizen and: [ e class = kind ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> fixture: fx [
	fixture := fx asDictionary 
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> functionOrSub [
	^ self firstCitizen invocables
		detect: [ :i | i selector = (fixture at: #functionOrSub) ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> kind: aKind [
	kind := aKind
]

{ #category : #'as yet unclassified' }
AlceNorthwindCachedModelAbstractTest >> nameOfFSTCitizen: aName [
	 nameOfFSTCitizen := aName
]

{ #category : #helpers }
AlceNorthwindCachedModelAbstractTest >> setUp [
	super setUp.
	model := self class norwindCachedModel
]
