Class {
	#name : #AlceNorthwindClassBindingTest,
	#superclass : #AlceNorthwindCachedModelAbstractTest,
	#instVars : [
		'kind',
		'nameOfFSTCitizen',
		'fixture'
	],
	#category : #'Alce-Test-Bind'
}

{ #category : #'building suites' }
AlceNorthwindClassBindingTest class >> setupClassRecordsetWrapperAddNew [
	^ {(#kind -> AlcixClass).
	(#nameOfFSTCitizen -> #RecordsetWrapper).
	(#fixture -> {(#functionOrSub -> #GetRecordsetClone)})}
]

{ #category : #'building suites' }
AlceNorthwindClassBindingTest class >> testParameters [
	^ super testParameters addCase: self setupClassRecordsetWrapperAddNew
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> assert: actual equals: expected [
	"This method raises an AssertionFailure if actual is different (using #= message) from expected.
	 Else it does nothing and execution continues.
	"
"
	actual = expected
		ifFalse: [ (self class class methods
				detect: [ :m | 
					| sc |
					sc := m sourceCode.
					(sc includesSubstring: setup)
						and: [ sc includesSubstring: '#' , (fixture at: #functionOrSub) ] ])
				browse ]."
	^ self
		assert: actual = expected
		description: [ self comparingStringBetween: actual and: expected ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> assertIfFunction: aBlockClosure [
	^ self assertIfFunction: aBlockClosure ifFalse: [ true ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> assertIfFunction: aBlock ifFalse: otherBlock [
	self functionOrSub class = AlcixFunction
		ifFalse: [ ^self assert: otherBlock value ].
	self assert: aBlock value
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> firstCitizen [
	^ model
		detect: [ :e | e name = nameOfFSTCitizen and: [ e class = kind ] ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> fixture: fx [
	fixture := fx
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> functionOrSub [
	^ self firstCitizen invocables
		detect: [ :i | i selector = (fixture at: #functionOrSub) ]
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> kind: aKind [
	kind := aKind
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> nameOfFSTCitizen: aName [
	 nameOfFSTCitizen := aName
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> setUp [
	super setUp.
	AlceLinker link: model . 
]

{ #category : #'as yet unclassified' }
AlceNorthwindClassBindingTest >> testBoundedVariables [
	self
		assert: (self functionOrSub localVariables select: [ :s | s isBound ]) size
		equals: (fixture at: #boundLocalVar)
]
