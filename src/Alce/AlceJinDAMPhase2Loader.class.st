Class {
	#name : #AlceJinDAMPhase2Loader,
	#superclass : #Object,
	#instVars : [
		'loader',
		'project',
		'referenceResolver'
	],
	#category : #'Alce-Generator'
}

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> createAccess [
	^ loader createAccess 
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> createAssignment [

	^ loader createAssignment
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> createReturn [
	 ^ loader createReturn 
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> getAccessesAssignmentsAndInvocations: aJinDAMFunction [

	^ self referenceResolver resolveElements:
		  (aJinDAMFunction accesses ifNil: [ {  } ])
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> getTypeFromReference: aJinDAMTypeReference [

	^ self referenceResolver resolveType: aJinDAMTypeReference.
	
]

{ #category : #accessing }
AlceJinDAMPhase2Loader >> instanceFor: aJinDAMPrimitiveType [

	^ loader instanceFor: aJinDAMPrimitiveType
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> instancesFor: aCollection [

	^ loader instancesFor: aCollection
]

{ #category : #'instance creation' }
AlceJinDAMPhase2Loader >> newInvocation [

	^ loader newInvocation
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> referenceResolver [

	^ referenceResolver ifNil: [ 
		  referenceResolver := AlceReferenceGatherer new
			                       loader: self;
			                       yourself ]
]

{ #category : #running }
AlceJinDAMPhase2Loader >> runOn: anAlceJinDAMTwoPhaseLoader [

	loader := anAlceJinDAMTwoPhaseLoader.
	project := loader alce instantiate: AlcixAccessProject.
	loader register: project for: loader dam.
	"loader dam references do: [ :e | e accept: self ]."
	loader dam allButReferences do: [ :e | e accept: self ]
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> undefinedType [

	^ loader undefinedType
]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> unknownElement [
	 ^ loader unknownElement
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

	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAccessWrite: aJinDAMAccessWrite [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAlias: aJinDAMAlias [

	self visitTypedEntity: aJinDAMAlias
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitArgument: aJinDAMArgument [

	self visitWithAccesses: aJinDAMArgument
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAttribute: aJinDAMAttribute [

	self visitTypedEntity: aJinDAMAttribute
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitAttributeAccessor: aJinDAMAttributeAccessor [

	self visitFunction: aJinDAMAttributeAccessor.
	aJinDAMAttributeAccessor attribute ifNotNil: [ 
		(loader instanceFor: aJinDAMAttributeAccessor attribute) 
			addAttributeAccessor:
			(loader instanceFor: aJinDAMAttributeAccessor) ]
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitBinaryOperation: aJinDAMBinaryOperation [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitBlock: aJinDAMBlock [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitClass: aJinDAMClass [

	| alcix attrs sc |
	alcix := loader instanceFor: aJinDAMClass.
	aJinDAMClass superClassReference ifNotNil: [ 
		sc := self getTypeFromReference: aJinDAMClass superClassReference.

		sc := (sc isKindOf: AlcixAlias)
			      ifTrue: [ 
				      sc type ifNil: [ 
					      aJinDAMClass superClassReference candidate accept: self ].
				      sc type ]
			      ifFalse: [ sc ].
		alcix superclass: sc ].

	alcix invocables: (loader instancesFor: aJinDAMClass invocables).
	attrs := loader instancesFor: aJinDAMClass attributes.
	alcix members: (attrs select: [ :a | a isKindOf: AlcixAttribute ]).
	alcix constants: (attrs reject: [ :a | a isKindOf: AlcixAttribute ]).
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
AlceJinDAMPhase2Loader >> visitDBType: aJinDAMDBType [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitDoUntil: aJinDAMDoUntil [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitDoWhile: aJinDAMDoWhile [

	self visitWhile: aJinDAMDoWhile
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
AlceJinDAMPhase2Loader >> visitExit: aJinDAMExit [

	
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

	self visitTypedEntity: aJinDAMExternalFunction.
	self visitWithParameters: aJinDAMExternalFunction
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitExternalSubProcedure: aJinDAMExternalSubProcedure [

	| alcix |
	alcix := loader instanceFor: aJinDAMExternalSubProcedure.
	alcix parameters: (loader instancesFor: aJinDAMExternalSubProcedure parameters ).
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitFileLineInput: aJinDAMFileLineInput [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitFilePrintInto: aJinDAMFilePrintIntoClause [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitForEach: aJinDAMForEach [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitForNext: aJinDAMForNext [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitForm: aJinDAMForm [

	^ self visitClass: aJinDAMForm
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitFunction: aJinDAMFunction [

	self visitTypedEntity: aJinDAMFunction.
	self visitWithParameters: aJinDAMFunction.
	self visitWithLocalVariables: aJinDAMFunction.
	self visitWithAccesses: aJinDAMFunction
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitGoSub: aJinDAMGoSub [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitGoTo: aJinDAMGoTo [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitIf: aJinDAMIf [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitInfinityLoop: aJinDAMInfinityLoop [ 

]

{ #category : #'as yet unclassified' }
AlceJinDAMPhase2Loader >> visitInitializeProcess: aJinDAMInitializeProcess [
	self visitSubProcedure: aJinDAMInitializeProcess
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLabel: aJinDAMLabel [ 

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
	"| alcix |
	alcix := loader instanceFor: aJinDAMLibraryReference  .
	alcix addCandidate: (loader instanceFor: aJinDAMLibraryReference candidate)"
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLiteralReference: aJinDAMLiteralReference [ 
	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitLocalVariable: aJinDAMLocalVariable [

	self visitTypedEntity: aJinDAMLocalVariable
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitMemberReference: aJinDAMMemberReference [
"
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
					(loader instanceFor: aJinDAMMemberReference candidate) ] ]"
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitModule: aJinDAMModule [

	| alcix attrs  |
	alcix := loader instanceFor: aJinDAMModule.
	
	alcix invocables: (loader instancesFor: aJinDAMModule invocables).
	
	attrs := (loader instancesFor: aJinDAMModule attributes). 
	alcix members:( attrs select: [ :a | a isKindOf: AlcixAttribute  ]).
	alcix constants: ( attrs reject: [ :a | a isKindOf: AlcixAttribute  ]).
	alcix types: (loader instancesFor: aJinDAMModule types).
	^ alcix
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitMultipleTypeReference: aJinDAMMultipleTypeReference [
"
	| alcix |
	alcix := loader instanceFor: aJinDAMMultipleTypeReference.
	alcix candidates:
		(loader instancesFor: aJinDAMMultipleTypeReference candidates)"
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitNewExpression: aJinDAMNewExpression [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitOnError: aJinDAMOnError [

	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitOnErrorResumeNext: aJinDAMOnErrorResumeNext [

	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitOpenClause: aJinDAMFileOpenClause [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitParameter: aJinDAMParameter [

	self visitTypedEntity: aJinDAMParameter
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitParenthesis: aJinDAMParentesis [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitPrimitiveType: aJinDAMPrimitiveType [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitQuery: aJinDAMQuery [

	self visitTable: aJinDAMQuery
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitRenameFile: aJinDAMRenameFile [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitReport: aJinDAMReport [

	^ self visitClass: aJinDAMReport
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitResume: aJinDAMResume [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitResumeEmpty: aJinDAMResumeEmpty [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitReturnEmpty: aJinDAMReturnEmpty [ 

]

{ #category : #enumerating }
AlceJinDAMPhase2Loader >> visitSelect: aJinDAMSelect [ 
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitSelectCase: aJinDAMCase [ 
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitStructure: aJinDAMStructure [

	^ self visitUserType: aJinDAMStructure
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitSubProcedure: aJinDAMSubProcedure [

	self visitWithParameters: aJinDAMSubProcedure.
	self visitWithLocalVariables: aJinDAMSubProcedure.
	self visitWithAccesses: aJinDAMSubProcedure
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTable: aJinDAMTable [

	self visitClass: aJinDAMTable
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTableField: aJinDAMTableField [

	self visitTypedEntity: aJinDAMTableField
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTableRelation: aJinDAMTableRelation [

	
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTypeMemberReference: aJinDAMTypeMemberReference [

	"| alcix |
	alcix := loader instanceFor: aJinDAMTypeMemberReference.

	aJinDAMTypeMemberReference candidate ifNotNil: [ 
		alcix addCandidate:
			(loader instanceFor: aJinDAMTypeMemberReference candidate) ].

	alcix arguments:
		(loader instancesFor: aJinDAMTypeMemberReference arguments).
		"
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTypeReference: aJinDAMTypeReference [
"
	| alcix |
	alcix := loader instanceFor: aJinDAMTypeReference.
	alcix addCandidate:
		(loader instanceFor: aJinDAMTypeReference candidate)"
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitTypedEntity: aJinDAMAlias [

	| alcix type |
	alcix := loader instanceFor: aJinDAMAlias.


	type := self getTypeFromReference: aJinDAMAlias typeReference.

	alcix type: type
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitUnaryOperation: aJinDAMUnaryOperation [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitUserType: aJinDAMUserType [

	| alcix |
	alcix := loader instanceFor: aJinDAMUserType.
	alcix members: (loader instancesFor: aJinDAMUserType attributes)
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitWhile: aJinDAMWhile [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitWith: aJinDAMWith [ 

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitWithAccesses: aJinDAMFunction [

	| all access assignments returns  alcix |
	alcix := loader instanceFor: aJinDAMFunction.
	all := self getAccessesAssignmentsAndInvocations: aJinDAMFunction.
	
	access := (all select: [ :a | a isKindOf: AlcixAccess ]).
	access ifNotEmpty: [ alcix outgoingAccesses: access. ].
	
	assignments := all select: [ :a | a isKindOf: AlcixAssignment ].
	assignments ifNotEmpty: [ alcix assignments: assignments. ].
	
	returns := all select: [ :a | a isKindOf: AlcixReturn ].
	returns ifNotEmpty: [ alcix returns: returns ].

]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitWithLocalVariables: aJinDAMFunction [

	| alcix varsAndConsts |
	alcix := loader instanceFor: aJinDAMFunction.
	varsAndConsts := loader instancesFor: aJinDAMFunction localVariables.

	alcix localVariables:
		(varsAndConsts select: [ :a | a isKindOf: AlcixLocalVariable ]).
	alcix constants:
		(varsAndConsts reject: [ :a | a isKindOf: AlcixLocalVariable ])
]

{ #category : #visiting }
AlceJinDAMPhase2Loader >> visitWithParameters: aJinDAMFunction [

	| alcix parameters |
	alcix := loader instanceFor: aJinDAMFunction.
	alcix parameters: (loader instancesFor: aJinDAMFunction parameters)
]
