Class {
	#name : #AlceReferenceGatherer,
	#superclass : #Object,
	#instVars : [
		'references',
		'loader',
		'undefinedType',
		'inWriteContext',
		'unknownElement',
		'unknownType'
	],
	#category : #'Alce-Generator'
}

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> adaptToAccess: aCollection [

	^ aCollection collect: [ :a | 
		  (a isKindOf: AlcixAccess)
			  ifFalse: [ 
				  loader createAccess
					  addCandidate: a;
					  yourself ]
			  ifTrue: [ a ] ]
]

{ #category : #enumerating }
AlceReferenceGatherer >> inWriteContextDo: aFullBlockClosure [ 
	inWriteContext := true.
	aFullBlockClosure value. 
	inWriteContext := false. 
]

{ #category : #accessing }
AlceReferenceGatherer >> loader: anAlceJinDAMPhase2Loader [ 
	loader := anAlceJinDAMPhase2Loader 
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> registerUndefinedElement [
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> registerUndefinedType [
	 references add: self undefinedType .
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> registerUnknownElement [
	 references add: (self unknownElement )
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> registerUnknownType [
	references add: (self unknownType)
]

{ #category : #resolving }
AlceReferenceGatherer >> resolve: aJinDAMTypeReference ifNil: aBlock [
	inWriteContext := false. 
	references := OrderedCollection new.
	aJinDAMTypeReference
		ifNil: [ aBlock value ]
		ifNotNil: [ aJinDAMTypeReference accept: self ].
	references size = 1 ifTrue: [ ^ references first ].

	self halt
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> resolveElements: aCollection [

	^ self resolveMany: aCollection
]

{ #category : #resolving }
AlceReferenceGatherer >> resolveMany: aCollection [

	^ self resolveMany: aCollection ifEmpty: [{}  ]
]

{ #category : #resolving }
AlceReferenceGatherer >> resolveMany: aCollection ifEmpty: aBlock [
	inWriteContext := false. 
	aCollection ifEmpty: [ ^ aBlock value ].

	references := OrderedCollection new.

	self visitCollection: aCollection.
	self assert: references isNotEmpty.
	^ references
]

{ #category : #resolving }
AlceReferenceGatherer >> resolveType: aJinDAMTypeReference [

	^ self
		  resolve: aJinDAMTypeReference
		  ifNil: [ self registerUndefinedType ]
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> undefinedType [

	^ undefinedType ifNil: [ undefinedType := loader undefinedType ]
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> unknownElement [

	^ unknownElement ifNil: [ unknownElement := loader unknownElement ]
]

{ #category : #'as yet unclassified' }
AlceReferenceGatherer >> unknownType [

	^ unknownType ifNil: [ unknownType := loader unknownElement ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAccessModule: aJinDAMAccessModule [ 
	self visitAccessibleElement: aJinDAMAccessModule
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAccessRead: aJinDAMAccessRead [

	| refs access accesses |
	inWriteContext ifFalse: [ 
		refs := references.
		references := OrderedCollection new ].

	aJinDAMAccessRead readReference accept: self.
	inWriteContext ifTrue: [ ^ self ].

	accesses := references reject: [ :r | r isKindOf: AlcixAccess ].
	references removeAll: accesses.

	accesses ifNotEmpty: [ 
		access := loader createAccess.
		access candidates: accesses.
		references add: access ].
	refs addAll: references.
	references := refs
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAccessWrite: aJinDAMAccessWrite [

	| write refs leftRefs rightRefs |
	self inWriteContextDo: [ 
		refs := references.
		references := OrderedCollection new.
		aJinDAMAccessWrite writeReference accept: self.
		leftRefs := references.
		references := OrderedCollection new.
		self visitCollection: aJinDAMAccessWrite readReferences.
		rightRefs := references.
		references := refs.
		write := loader createAssignment.
		write writeElement: (self adaptToAccess: leftRefs).
		write readElements: (self adaptToAccess: rightRefs).
		references add: write ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAccessibleElement: aJinDAMEnumValue [

	references add: (loader instanceFor: aJinDAMEnumValue)
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAlias: aJinDAMAlias [

	^ self visitType:  aJinDAMAlias
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAttribute: aJinDAMAttribute [

	self visitAccessibleElement: aJinDAMAttribute
]

{ #category : #visiting }
AlceReferenceGatherer >> visitAttributeAccessor: aJinDAMAttributeAccessor [

	^ self visitFunction: aJinDAMAttributeAccessor
]

{ #category : #visiting }
AlceReferenceGatherer >> visitClass: aJinDAMClass [

	^ self visitType: aJinDAMClass
]

{ #category : #visiting }
AlceReferenceGatherer >> visitCollection: aCollection [

	aCollection do: [ :a | a accept: self ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitConstant: aJinDAMConstant [

	references add: (loader instanceFor: aJinDAMConstant)
]

{ #category : #visiting }
AlceReferenceGatherer >> visitDBType: aJinDAMDBType [

	^ self visitType: aJinDAMDBType
]

{ #category : #visiting }
AlceReferenceGatherer >> visitEnum: aJinDAMEnum [

	self visitType: aJinDAMEnum
]

{ #category : #visiting }
AlceReferenceGatherer >> visitEnumValue: aJinDAMEnumValue [
	self visitAccessibleElement: aJinDAMEnumValue
	
]

{ #category : #visiting }
AlceReferenceGatherer >> visitEvent: aJinDAMEvent [

	^ self visitFunction: aJinDAMEvent
]

{ #category : #visiting }
AlceReferenceGatherer >> visitExternalFunction: aJinDAMExternalFunction [

	self visitFunction: aJinDAMExternalFunction
]

{ #category : #visiting }
AlceReferenceGatherer >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [

	self visitSubProcedure: aJinDAMExternalSubProcedure
]

{ #category : #visiting }
AlceReferenceGatherer >> visitForm: aJinDAMForm [

	^ self visitClass: aJinDAMForm
]

{ #category : #visiting }
AlceReferenceGatherer >> visitFunction: aJinDAMFunction [

	^ self visitInvocable: aJinDAMFunction
]

{ #category : #visiting }
AlceReferenceGatherer >> visitInvocable: aJinDAMFunction [

	| invocation |
	invocation := loader newInvocation
		              addCandidate: (loader instanceFor: aJinDAMFunction);
		              yourself.
	references add: invocation
]

{ #category : #visiting }
AlceReferenceGatherer >> visitLibrary: aJinDAMLibrary [ 
	self visitAccessibleElement: aJinDAMLibrary
]

{ #category : #visiting }
AlceReferenceGatherer >> visitLibraryReference: aJinDAMLibraryReference [ 
	aJinDAMLibraryReference candidate accept: self 
]

{ #category : #visiting }
AlceReferenceGatherer >> visitLiteralReference: aJinDAMLiteralReference [

	self visitAccessibleElement: aJinDAMLiteralReference
]

{ #category : #visiting }
AlceReferenceGatherer >> visitLocalVariable: aJinDAMLocalVariable [

	self visitAccessibleElement: aJinDAMLocalVariable
]

{ #category : #visiting }
AlceReferenceGatherer >> visitMemberReference: aJinDAMMemberReference [

	| rs l |
	aJinDAMMemberReference candidate ifNil: [ 
		^ aJinDAMMemberReference context isReference
			  ifTrue: [ aJinDAMMemberReference context accept: self ]
			  ifFalse: [ self registerUnknownElement ] ].
	rs := references size.

	aJinDAMMemberReference candidate isCollection
		ifTrue: [ 
			(aJinDAMMemberReference candidate
				 detect: [ :c | c isAttributeGetter ]
				 ifNone: [ aJinDAMMemberReference candidate first ]) accept: self ]
		ifFalse: [ aJinDAMMemberReference candidate accept: self ].


	self assert: rs + 1 = references size.
	l := references last.
	aJinDAMMemberReference arguments ifNotEmpty: [ 
		(l respondsTo: #arguments) ifTrue: [ 
			l arguments:
				(loader instancesFor: aJinDAMMemberReference arguments) ] ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitModule: aJinDAMModule [

	self visitType: aJinDAMModule
]

{ #category : #visiting }
AlceReferenceGatherer >> visitMultipleTypeReference: aJinDAMMultipleTypeReference [

	aJinDAMMultipleTypeReference isUnknownReference
		ifTrue: [ self registerUnknownType ]
		ifFalse: [ 
			aJinDAMMultipleTypeReference candidates ifEmpty: [ self halt ].
			aJinDAMMultipleTypeReference candidates do: [ :c | c accept: self ] ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitParameter: aJinDAMParameter [

	references add: (loader instanceFor: aJinDAMParameter)
]

{ #category : #visiting }
AlceReferenceGatherer >> visitPrimitiveType: aJinDAMPrimitiveType [

	self visitType: aJinDAMPrimitiveType
]

{ #category : #visiting }
AlceReferenceGatherer >> visitReport: aJinDAMReport [

	^ self visitClass: aJinDAMReport
]

{ #category : #visiting }
AlceReferenceGatherer >> visitSubProcedure: aJinDAMSubProcedure [

	^ self visitInvocable: aJinDAMSubProcedure
]

{ #category : #visiting }
AlceReferenceGatherer >> visitType: aJinDAMPrimitiveType [

	references add: (loader instanceFor: aJinDAMPrimitiveType)
]

{ #category : #visiting }
AlceReferenceGatherer >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	aJinDAMTypeMemberReference candidate ifNotNil: [ 
		aJinDAMTypeMemberReference candidate accept: self ].
	self assert: aJinDAMTypeMemberReference argument isNotNil.
	aJinDAMTypeMemberReference argument reads first readReference 
		accept: self
]

{ #category : #visiting }
AlceReferenceGatherer >> visitTypeReference: aJinDAMTypeReference [

	aJinDAMTypeReference isNull ifTrue: [ 
		^ self registerUndefinedType ].
	aJinDAMTypeReference isUnknownReference
		ifTrue: [ self registerUnknownType ]
		ifFalse: [ 
			aJinDAMTypeReference candidate ifNil: [ self halt ].
			aJinDAMTypeReference candidate accept: self ]
]

{ #category : #visiting }
AlceReferenceGatherer >> visitUserType: aJinDAMUserType [

	self visitType: aJinDAMUserType
]
