Class {
	#name : #AlceColoringPopularComposingColor,
	#superclass : #Object,
	#instVars : [
		'visited',
		'colors'
	],
	#category : #'Alce-Coloring'
}

{ #category : #visiting }
AlceColoringPopularComposingColor >> askForAcceptTo: a [

	(visited includes: a) ifFalse: [ 
		visited add: a.
		a accept: self ]
]

{ #category : #accessing }
AlceColoringPopularComposingColor >> colorFor: anEntity [

	anEntity ifNil: [ ^ Color transparent ].
	colors := OrderedCollection new.
	visited := OrderedCollection new.

	self askForAcceptTo: anEntity.

	colors := colors reject: [ :c | c = anEntity color ].
	^ self popularEntry: colors or: anEntity color
]

{ #category : #'as yet unclassified' }
AlceColoringPopularComposingColor >> colorsFor: anEntity [

	anEntity ifNil: [ ^ { Color transparent } ].
	colors := OrderedCollection new.
	visited := OrderedCollection new.

	self askForAcceptTo: anEntity.

	^ (colors reject: [ :c | c = anEntity color ]) removeDuplicates
]

{ #category : #'as yet unclassified' }
AlceColoringPopularComposingColor >> popularEntry: source or: aColor [
	| ranking | 
	ranking := (source groupedBy: #yourself) associations sort: [ :a :b | 
		a value size > b value size ].
	^ ranking ifEmpty: [ aColor ] ifNotEmpty: [ ranking first key ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccess: anAlcixAccess [ 

	anAlcixAccess candidate ifNotNil: [ :e | self askForAcceptTo: e]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccessModule: anAlcixAccessModule [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccessRead: anAlcixAccessRead [

	anAlcixAccessRead candidate ifNotNil: [ :e | self askForAcceptTo: e]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAccessWrite: anAlcixAccessWrite [

	anAlcixAccessWrite rightElement ifNotNil: [ :e | self askForAcceptTo: e ].
	anAlcixAccessWrite leftElement ifNotNil: [ :e |self askForAcceptTo: e]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAlias: anAlcixAlias [

	self visitLocalVariable: anAlcixAlias
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitArgument: anAlcixArgument [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitAssignment: anAlcixAssignment [

	anAlcixAssignment readElements do: [ :e | self askForAcceptTo: e ].
	anAlcixAssignment writeElement do: [ :e | self askForAcceptTo: e ]
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

	aCollection do: [ :a | self askForAcceptTo: a ]
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitConstant: anAlcixConstant [ 
	self visitLocalVariable: anAlcixConstant 
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
AlceColoringPopularComposingColor >> visitEnumValue: anAlcixEnumValue [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitEvent: anAlcixEvent [

	self visitInvocable: anAlcixEvent
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitExternalFunction: anAlcixExternalFunction [ 
	 self visitFunction: anAlcixExternalFunction 
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitExternalSubProcedure: anAlcixExternalSubProcedure [

	self visitSubProcedure: anAlcixExternalSubProcedure
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
	self visitCollection: anAlcixAttributeAccessor outgoingAccesses.
	self visitCollection: anAlcixAttributeAccessor assignments. 
	self visitCollection: anAlcixAttributeAccessor localVariables.
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
AlceColoringPopularComposingColor >> visitLiteral: anAlcixLiteral [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitLocalVariable: anAlcixLocalVariable [ 
	^ self visitParameter: anAlcixLocalVariable 
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitMethodInvocation: anAlcixMethodInvocation [

	self visitInvocation: anAlcixMethodInvocation.
	self askForAcceptTo: anAlcixMethodInvocation receiver
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
AlceColoringPopularComposingColor >> visitQuery: anAlcixQuery [

	
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitReport: anAlcixReport [

	self visitClass: anAlcixReport
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitStructure: anAlcixStructure [ 
	self visitUserType: anAlcixStructure 
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitSubProcedure: anAlcixAttributeAccessor [ 
	 self visitInvocable: anAlcixAttributeAccessor
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitTable: anAlcixTable [

	
]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitUnknownElement: anAlcixUnknownElement [ 

]

{ #category : #visiting }
AlceColoringPopularComposingColor >> visitUserType: anAlcixClass [

	self visitCollection: anAlcixClass members.
	self visitCollection: anAlcixClass invocables
]
