Class {
	#name : #AlceJinDAMPhase2Loader,
	#superclass : #Object,
	#instVars : [
		'loader',
		'project'
	],
	#category : #'Alce-Generator'
}

{ #category : #running }
AlceJinDAMPhase2Loader >> runOn: anAlceJinDAMTwoPhaseLoader [

	loader := anAlceJinDAMTwoPhaseLoader.
	project := loader alce instantiate: AlcixAccessProject.
	loader register: project for: loader dam.
	loader dam references do: [ :e | e accept: self ].
	loader dam allButReferences do: [ :e | e accept: self ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAccessModule: aJinDAMAccessModule [

	| alcixModule |
	alcixModule := loader instanceFor: aJinDAMAccessModule.
	project addModule: alcixModule.

	alcixModule types:
		(aJinDAMAccessModule types collect: [ :r | loader instanceFor: r ]).
	alcixModule references:
		(aJinDAMAccessModule dependencies collect: [ :r | 
			 loader instanceFor: r ]).
	alcixModule members:
		(aJinDAMAccessModule globals collect: [ :r | loader instanceFor: r ]).

	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAccessRead: aJinDAMAccessRead [

	| alcix |
	alcix := loader instanceFor: aJinDAMAccessRead.
	alcix candidates:
		(loader instanceFor: aJinDAMAccessRead readReference) candidates.
	(loader instanceFor: aJinDAMAccessRead readReference) arguments do: [ 
		:a | a ifNotNil: [ :a2 | a2 activation: alcix ] ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAccessWrite: aJinDAMAccessWrite [ 
	| alcix out | 
	alcix := loader instanceFor: aJinDAMAccessWrite .
	alcix addOutgoingAccess: (loader instanceFor: aJinDAMAccessWrite writeReference).
	out :=  (loader instancesFor: aJinDAMAccessWrite readReferences).
	alcix outgoingAccesses addAll: (out select: [ : o | o isKindOf: AlcixAccess  ]).

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAlias: aJinDAMAlias [

	| alcix |
	alcix := loader instanceFor: aJinDAMAlias.

	(aJinDAMAlias typeReference isNil or: [ 
		 aJinDAMAlias typeReference isUnknownReference ]) ifTrue: [ ^ self ].

	alcix type:
		(loader instanceFor: aJinDAMAlias typeReference) candidates first
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitArgument: aJinDAMArgument [ 
	 |arg |
	arg := loader instanceFor: aJinDAMArgument .
	arg outgoingAccesses:( (loader instancesFor: aJinDAMArgument reads) select: [: a | a isKindOf: AlcixAccess ])
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAttribute: aJinDAMAttribute [

	| alcix |
	alcix := loader instanceFor: aJinDAMAttribute.

	aJinDAMAttribute typeReference ifNotNil: [ 
		aJinDAMAttribute typeReference candidate ifNil: [ ^ self ].
		aJinDAMAttribute typeReference candidate isType
			ifFalse: [  ]
			ifTrue: [ 
				alcix type:
					(loader instanceFor: aJinDAMAttribute typeReference) candidates
						first ] ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAttributeAccessor: aJinDAMAttributeAccessor [

	^ self visitFunction: aJinDAMAttributeAccessor
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitClass: aJinDAMClass [

	| alcix invocables attributes types |
	alcix := loader instanceFor: aJinDAMClass.
	aJinDAMClass superClassReference ifNotNil: [ 
		alcix superclass:
			(loader instanceFor: aJinDAMClass superClassReference) candidates
				first ].

	alcix invocables: (loader instancesFor: aJinDAMClass invocables).
	alcix members: (loader instancesFor: aJinDAMClass attributes).
	alcix types: (loader instancesFor: aJinDAMClass types).
	^ alcix
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitCollection: aCollection [ 
	^ aCollection collect: [ : a | a accept: self  ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitConstant: aJinDAMConstant [

	self visitAttribute: aJinDAMConstant
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitEnum: aJinDAMEnum [ 
	| alcix |
	alcix := loader instanceFor: aJinDAMEnum .
	alcix enumValues: (loader instancesFor: aJinDAMEnum values)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitEnumValue: aJinDAMEnumValue [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitEvent: aJinDAMEvent [

	| alcix |
	alcix := loader instanceFor: aJinDAMEvent.
	alcix parameters: (loader instancesFor: aJinDAMEvent parameters)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitExpressionReference: aJinDAMExpressionReference [

	| alcix |
	alcix := loader instanceFor: aJinDAMExpressionReference.
	alcix addOutgoingAccess:
		(loader instanceFor: aJinDAMExpressionReference candidate).
	alcix arguments:
		(loader instancesFor: aJinDAMExpressionReference arguments)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitExternalFunction: aJinDAMExternalFunction [ 
	| alcix | 
	alcix := loader instanceFor: aJinDAMExternalFunction.
	alcix parameters: (loader instancesFor: aJinDAMExternalFunction parameters ).
	alcix type: (loader instanceFor: aJinDAMExternalFunction typeReference) candidates first 
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [

	| alcix |
	alcix := loader instanceFor: aJinDAMExternalSubProcedure.
	alcix parameters: (loader instancesFor: aJinDAMExternalSubProcedure parameters ).
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitForm: aJinDAMForm [

	^ self visitClass: aJinDAMForm
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitFunction: aJinDAMFunction [

	| alcix accesses |
	alcix := loader instanceFor: aJinDAMFunction.

	aJinDAMFunction typeReference ifNil: [  ] ifNotNil: [ 
		aJinDAMFunction typeReference candidate ifNotNil: [ 
			aJinDAMFunction typeReference candidate isType
				ifFalse: [ self halt ]
				ifTrue: [ 
					alcix type:
						(loader instanceFor: aJinDAMFunction typeReference) candidates
							first ] ] ].
	alcix parameters: (loader instancesFor: aJinDAMFunction parameters).
	alcix localVariables:
		((loader instancesFor: aJinDAMFunction localVariables) select: [ :a | 
			 a isKindOf: AlcixLocalVariable ]).
	accesses := loader instancesFor: aJinDAMFunction accesses.
	alcix assignments:
		(accesses select: [ :a | a isKindOf: AlcixAssignment ]).
	alcix outgoingAccesses addAll:
		(accesses reject: [ :a | a isKindOf: AlcixAssignment ])
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLibrary: aJinDAMLibrary [

	| alcix |
	alcix := loader instanceFor: aJinDAMLibrary.
	alcix types: (loader instancesFor: aJinDAMLibrary types).
	alcix invocables: (loader instancesFor: aJinDAMLibrary invocables).
	alcix members: (loader instancesFor: aJinDAMLibrary globals)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLibraryReference: aJinDAMLibraryReference [ 
	| alcix |
	alcix := loader instanceFor: aJinDAMLibraryReference  .
	alcix addCandidate: (loader instanceFor: aJinDAMLibraryReference candidate)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLiteralReference: aJinDAMLiteralReference [ 
	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLocalVariable: aJinDAMLocalVariable [

	| alcix |
	alcix := loader instanceFor: aJinDAMLocalVariable.

	aJinDAMLocalVariable typeReference ifNil: [  ] ifNotNil: [ 
		aJinDAMLocalVariable typeReference candidate ifNotNil: [ 
			aJinDAMLocalVariable typeReference candidate isType
				ifFalse: [ self halt ]
				ifTrue: [ 
					alcix type:
						(loader instanceFor: aJinDAMLocalVariable typeReference)
							candidates first ] ] ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitMemberReference: aJinDAMMemberReference [

	| alcix |
	alcix := loader instanceFor: aJinDAMMemberReference.
	alcix arguments:
		(loader instancesFor: aJinDAMMemberReference arguments).
	aJinDAMMemberReference candidate ifNotNil: [ 
		aJinDAMMemberReference candidate isCollection
			ifTrue: [ 
				alcix candidates:
					(loader instancesFor: aJinDAMMemberReference candidate) ]
			ifFalse: [ 
				alcix addCandidate:
					(loader instanceFor: aJinDAMMemberReference candidate) ] ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitModule: aJinDAMModule [

	^ self visitClass: aJinDAMModule
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitMultipleTypeReference: aJinDAMMultipleTypeReference [

	| alcix |
	alcix := loader instanceFor: aJinDAMMultipleTypeReference.
	alcix candidates:
		(loader instancesFor: aJinDAMMultipleTypeReference candidates)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitParameter: aJinDAMParameter [

	| alcix |
	alcix := loader instanceFor: aJinDAMParameter.
	aJinDAMParameter typeReference ifNil: [ ^ self ].
	aJinDAMParameter typeReference isUnknownReference ifFalse: [ 
		alcix type:
			(loader instanceFor: aJinDAMParameter typeReference) candidates
				first ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitPrimitiveType: aJinDAMPrimitiveType [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitReport: aJinDAMReport [

	^ self visitClass: aJinDAMReport
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitStructure: aJinDAMStructure [

	^ self visitUserType: aJinDAMStructure
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitSubProcedure: aJinDAMSubProcedure [

	| alcix accesses |
	alcix := loader instanceFor: aJinDAMSubProcedure.
	alcix parameters:
		(loader instancesFor: aJinDAMSubProcedure parameters).
	alcix localVariables:
		((loader instancesFor: aJinDAMSubProcedure localVariables) select: [ 
			 :a | a isKindOf: AlcixLocalVariable ]).
	accesses := loader instancesFor: aJinDAMSubProcedure accesses.
	alcix assignments:
		(accesses select: [ :a | a isKindOf: AlcixAssignment ]).
	alcix outgoingAccesses addAll:
		(accesses reject: [ :a | a isKindOf: AlcixAssignment ])
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTable: aJinDAMTable [

	self visitClass: aJinDAMTable
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	| alcix |
	alcix := loader instanceFor: aJinDAMTypeMemberReference.

	aJinDAMTypeMemberReference candidate ifNotNil: [ 
		alcix addCandidate:
			(loader instanceFor: aJinDAMTypeMemberReference candidate) ].

	alcix arguments:
		(loader instancesFor: aJinDAMTypeMemberReference arguments).
		
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTypeReference: aJinDAMTypeReference [

	| alcix |
	alcix := loader instanceFor: aJinDAMTypeReference.
	alcix addCandidate:
		(loader instanceFor: aJinDAMTypeReference candidate)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitUserType: aJinDAMUserType [

	| alcix |
	alcix := loader instanceFor: aJinDAMUserType.
	alcix members: (loader instancesFor: aJinDAMUserType attributes)
]
