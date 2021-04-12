Class {
	#name : #AlceASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#instVars : [
		'stringConverter'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #helper }
AlceASTCodeImporter >> ensureInContextOf: aClass [
	(self state top isKindOf: AlcixInvocable)
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> instantiateVariable: aClass from: aVariable [
	| var |
	var := self instantiate: aClass.
	var name: (self nodeToString: aVariable name).
	var typeName: (self nodeToString: aVariable type type).
	var anchor: self state top anchor / #variables / var name.
	^ var
]

{ #category : #helper }
AlceASTCodeImporter >> nodeToString: aNode [
	^ self stringConverter toString: aNode
]

{ #category : #helper }
AlceASTCodeImporter >> stringConverter [
	^ stringConverter
		ifNil: [ stringConverter := AlceVBVisitorToString new ]
]

{ #category : #generated }
AlceASTCodeImporter >> visitComparisonOperation: aComparisonOperation [
	^ self visitProgram: aComparisonOperation.

]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitConstant: aConstant [
	| fn |
	fn := self instantiate: AlcixAttribute.
	fn name: (self nodeToString: aConstant constant).
	fn isConstant: true.
	fn
		anchor:
			self state top anchor / #attributes
				/ fn name.
	self state top addMember: fn.
	self state push: fn.
	super visitSubDefinition: aConstant.
	self state pop
]

{ #category : #generated }
AlceASTCodeImporter >> visitConstantList: aConstantList [
	^ self visitProgram: aConstantList.

]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitDefType: aDefType [
	^ self error: ' Def type is a really really really crappy thing '

]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitDefineEnum: aDefineEnum [
	| en |
	en := self instantiate: AlcixEnum.
	en name: (self nodeToString: aDefineEnum name).
	en anchor: self state top anchor / #src / #types / en name.
	self state top addType: en.
	aDefineEnum fields
		doWithIndex: [ :d :i | 
			en
				addEnumValue:
					((self instantiate: AlcixEnumValue)
						name:  (self nodeToString: d name );
						Value: i;
						yourself) ]
]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitDefineType: aDefineType [
	| en |
	en := self instantiate: AlcixUserType.
	en name: (self nodeToString: aDefineType name).
	en anchor: self state top anchor / #src / #types / en name.
	self state top addType: en.
	aDefineType fields
		doWithIndex: [ :d :i | 
			self assert: d type class = VBTypedThingNode.
			self assert: d type sizes isEmpty.
			en
				addMember:
					((self instantiate: AlcixAttribute)
						name: (self nodeToString: d name);
						typeName: (self nodeToString: d type type);
						yourself) ]
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitDimMultipleVariables: aDimMultipleVariables [
	| var |
	self ensureInContextOf: AlcixInvocable.
	aDimMultipleVariables variables
		do: [ :v | 
			var := self instantiateVariable: AlcixLocalVariable from: v.
			self state top addLocalVariable: var ]
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitDimVariable: aDimVariable [
	| var |
	self ensureInContextOf: AlcixInvocable.
	var := self
		instantiateVariable: AlcixLocalVariable
		from: aDimVariable variable.
	self state top addLocalVariable: var
]

{ #category : #assignments }
AlceASTCodeImporter >> visitEquals: anAssignementOrEquals [
	| access |
	"
	Ensure that is an assignment: 
"
	anAssignementOrEquals isAssignment
		ifTrue: [ access := self instantiate: AlcixAccess.
			access isWriting: true.
			access
				attributeName: (self nodeToString: anAssignementOrEquals left).
			self state top addAccess: access ].
	super visitAssignementOrEquals: anAssignementOrEquals
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitEvent: anEvent [
	| fn |
	fn := self instantiate: AlcixEvent.
	fn selector: anEvent name.
	fn anchor: self state top anchor / #events / anEvent name.
	self state top addInvocable: fn.
	self state push: fn.
	super visitEvent: anEvent.
	self state pop
]

{ #category : #assignments }
AlceASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [
	| access |
	access := self instantiate: AlcixAccess.
	access isWriting: true.
	access attributeName: (self nodeToString: anExplicitAssignement left).
	self state top addAccess: access.
	super visitExplicitAssignement: anExplicitAssignement.
]

{ #category : #implementing }
AlceASTCodeImporter >> visitExplicitCall: anExplicitCall [
	| call arguments |
	call := self instantiate: AlcixInvocation .
	call selector: (self nodeToString: anExplicitCall selector).
	call anchor: self state top anchor / #invocation / call selector.
	self halt. 
	arguments := anExplicitCall arguments collect: [ :a | self nodeToString: a  ]..
	
	call arguments: arguments. 
	self state top addInvocation: call.
	self state push: call.
	super visitExplicitCall: anExplicitCall.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitExternalFunction: aDefinition [
	| fn |
	fn := self instantiate: AlcixExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #functions / fn selector.
	self halt. 
	self state top addInvocable: fn.
	self state push: fn.
	super visitExternalFunction: aDefinition.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitExternalSub: aDefinition [
	| fn |
	fn := self instantiate: AlcixExternalSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #subprocedures / fn selector.
	self halt.
	self state top addInvocable: fn.
	self state push: fn.
	super visitExternalSub: aDefinition.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitFunctionDefinition: aDefinition [
	| fn |
	fn := self instantiate: AlcixFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #functions / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	super visitFunctionDefinition: aDefinition.
	self state pop
]

{ #category : #generated }
AlceASTCodeImporter >> visitHeader: aHeader [
	^ self visitProgram: aHeader.

]

{ #category : #generated }
AlceASTCodeImporter >> visitImplements: anImplements [
	^ self visitProgram: anImplements.

]

{ #category : #implementing }
AlceASTCodeImporter >> visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall [
	| call arguments |
	call := self instantiate: AlcixInvocation .
	call selector: (self nodeToString: anImplicitParenthesesLessCall selector).
	call anchor: self state top anchor / #invocation / call selector.
	self halt. 
	arguments := anImplicitParenthesesLessCall arguments collect: [ :a | self nodeToString: a  ]..
	
	call arguments: arguments. 
	self state top addInvocation: call.
	self state push: call.
	super visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall.
	self state pop

]

{ #category : #generated }
AlceASTCodeImporter >> visitModule: aModule [
	^ self visitProgram: aModule.

]

{ #category : #generated }
AlceASTCodeImporter >> visitModuleAttribute: aModuleAttribute [
	^ self visitProgram: aModuleAttribute.

]

{ #category : #generated }
AlceASTCodeImporter >> visitModuleConstant: aModuleConstant [
	^ self visitProgram: aModuleConstant.

]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitModuleProperty: aModuleProperty [
	| fn |
	fn := self instantiate: AlcixAttribute.
	fn name: (self nodeToString: aModuleProperty variable name).
	fn typeName: (self nodeToString: aModuleProperty variable type type).
	fn isConstant: false.
	fn anchor: self state top anchor / #attributes / fn name.
	self state top addMember: fn
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [
	| acc statement |
	acc := self instantiate: AlcixAttributeAccessor.
	acc kind: aModulePropertyGet getToken value asSymbol.
	acc selector: (self nodeToString: aModulePropertyGet selector).
	self assert: acc kind = #Get.

	"Obtain property name from the body of the accessor "
	statement := (aModulePropertyGet block statements
		select: [ :s | 
			{VBExplicitAssignementNode.
			VBEqualsNode} includes: s class ])
		detect: [ :s | (self nodeToString: s left) = acc selector ].
	acc
		attribute:
			(self state top members
				detect: [ :p | p name = (self nodeToString: statement right) ])
]

{ #category : #implementing }
AlceASTCodeImporter >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [
	^ self visitProgram: aProcedureCallOrArrayAccess
]

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #implementing }
AlceASTCodeImporter >> visitRaiseEvent: aRaiseEvent [
	| call |
	call := self instantiate: AlcixRaiseEvent.
	call selector: (self nodeToString: aRaiseEvent selector).
	call anchor: self state top anchor / #invocation / call selector.
	self halt.
	self state top addInvocation: call.
	self state push: call.
	super visitRaiseEvent: aRaiseEvent.
	self state pop
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitReDimVariable: aReDimVariable [
	self halt
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitSubDefinition: aDefinition [
	| fn |
	fn := self instantiate: AlcixSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #subprocedures / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	super visitSubDefinition: aDefinition.
	self state pop
]

{ #category : #generated }
AlceASTCodeImporter >> visitVariable: aVariable [
	^ self visitProgram: aVariable.

]

{ #category : #generated }
AlceASTCodeImporter >> visitVariableList: aVariableList [
	^ self visitProgram: aVariableList.

]
