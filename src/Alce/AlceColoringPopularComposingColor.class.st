Class {
	#name : #AlceColoringPopularComposingColor,
	#superclass : #Object,
	#instVars : [
		'visited',
		'colors'
	],
	#category : #'Alce-Coloring'
}

{ #category : #accessing }
AlceColoringPopularComposingColor >> colorFor: anEntity [

	colors := OrderedCollection new.
	visited := OrderedCollection new.

	anEntity accept: self.
	colors := colors reject: [ :c | c = anEntity color ].
	^ self popularEntry: colors or: anEntity color
]

{ #category : #'as yet unclassified' }
AlceColoringPopularComposingColor >> popularEntry: aCollection [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
AlceColoringPopularComposingColor >> popularEntry: source or: aColor [
	| ranking | 
	ranking := (source groupedBy: #yourself) associations sort: [ :a :b | 
		a value size > b value size ].
	^ ranking ifEmpty: [ aColor ] ifNotEmpty: [ ranking first key ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccessRead: anAlcixAccessRead [

	anAlcixAccessRead rightElement ifNotNil: [ :e | e accept: self ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccessWrite: anAlcixAccessWrite [

	anAlcixAccessWrite rightElement ifNotNil: [ :e | e accept: self ].
	anAlcixAccessWrite leftElement ifNotNil: [ :e | e accept: self ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAlias: anAlcixAlias [

	self visitLocalVariable: anAlcixAlias
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitArgument: anAlcixArgument [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAttribute: anAlcixAttribute [ 
	self visitLocalVariable: anAlcixAttribute
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAttributeAccessor: anAlcixAttributeAccessor [

	self visitFunction: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitClass: anAlcixClass [

	self visitModule: anAlcixClass
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitCollection: aCollection [

	aCollection do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitContainer: anAlcixClass [

	self visitUserType: anAlcixClass.
	self visitCollection: anAlcixClass types
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitEnum: anAlcixEnum [

	
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitForm: anAlcixForm [

	self visitClass: anAlcixForm
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitFunction: anAlcixAttributeAccessor [

	self visitInvocable:  anAlcixAttributeAccessor.
	self visitLocalVariable: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitInvocable: anAlcixAttributeAccessor [

	self visitCollection: anAlcixAttributeAccessor parameters.
	self visitCollection: anAlcixAttributeAccessor accesses.
	self visitCollection: anAlcixAttributeAccessor localVariables.
	self visitCollection: anAlcixAttributeAccessor outgoingInvocations
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitInvocation: anAlcixInvocation [

	self visitCollection: anAlcixInvocation arguments.
	anAlcixInvocation candidate ifNotNil: [ 
		colors add: anAlcixInvocation candidate color.
		(anAlcixInvocation candidate isKindOf: AlcixFunction) ifTrue: [ 
			self visitLocalVariable: anAlcixInvocation candidate ] ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitLibrary: anAlcixLibrary [

	self visitContainer: anAlcixLibrary
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitLocalVariable: anAlcixLocalVariable [ 
	^ self visitParameter: anAlcixLocalVariable 
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitMethodInvocation: anAlcixMethodInvocation [

	self visitInvocation: anAlcixMethodInvocation.
	anAlcixMethodInvocation receiver accept: self
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitModule: anAlcixClass [

	self visitContainer: anAlcixClass.
	self visitCollection: anAlcixClass globalVariables
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitParameter: anAlcixParameter [

	anAlcixParameter type ifNotNil: [ :t | colors add: t color ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitPrimitiveType: anAlcixPrimitiveType [ 
	 colors add: anAlcixPrimitiveType color 
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitReport: anAlcixReport [

	self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitSubProcedure: anAlcixAttributeAccessor [ 
	 self visitInvocable: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitUserType: anAlcixClass [

	self visitCollection: anAlcixClass members.
	self visitCollection: anAlcixClass invocables
]
