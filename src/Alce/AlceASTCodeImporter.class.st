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

{ #category : #'member access' }
AlceASTCodeImporter >> instantiateAccess: aMemberOrDictAccess [
	| access receiver parts |
	receiver := aMemberOrDictAccess receiver
		ifNil: [ self nodeToString: aMemberOrDictAccess enclosingWith with ]
		ifNotNil: [ self nodeToString: aMemberOrDictAccess receiver ].
	parts := '.'
		split:
			('.'
				join:
					{receiver.
					(self nodeToString: aMemberOrDictAccess member)}).
	access := self instantiate: AlcixAccess.
	access isWriting: false.
	access attributeName: parts first.
	access memberSelectors: parts allButFirst.
	^ access
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateFlatInvocation: selector for: aCall [
	| call |
	call := self instantiate: AlcixInvocation.
	call selector: selector.
	call anchor: self state top anchor / #invocation / call selector.
	aCall arguments arguments
		do: [ :a | 
			| arg |
			arg := self instantiate: AlcixArgument.
			arg value: (self nodeToString: a).
			call addArgument: arg ].
	self state top addOutgoingInvocation: call
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateInvocation: aCall [
	| selector |
	selector := self nodeToString: aCall selector.
	(selector indexOf: $.) = 0
		ifTrue: [ self instantiateFlatInvocation: selector for: aCall ]
		ifFalse: [ self instantiateMethodInvocation: selector for: aCall ]
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateMethodInvocation: selector for: aCall [

	| receiver call |
	receiver := self instantiateAccess: aCall selector.
	self state top addAccess: receiver.
	receiver memberSelectors isEmptyOrNil ifTrue: [ self halt ].
	call := self instantiate: AlcixMethodInvocation.
	call receiver: receiver.
	call selector: selector.
	call anchor: self state top anchor / #invocation / call selector.
	aCall arguments arguments do: [ :a | 
		| arg |
		arg := self instantiate: AlcixArgument.
		arg value: (self nodeToString: a).
		call addArgument: arg ].
	self state top addOutgoingInvocation: call
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
	| str |
	str := self stringConverter toString: aNode.
	
	^ str
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> registerSpecialVariable: aName type: aType [
	| var |
	var := self instantiate: AlcixAttribute.
	var name: aName.
	var typeName: aType name.
	var type: aType.
	var anchor: self state top anchor / #variables / var name.
	^ var
]

{ #category : #helper }
AlceASTCodeImporter >> stringConverter [
	^ stringConverter
		ifNil: [ stringConverter := AlceVBVisitorToString new ]
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> typeName: aTypeOrNil [
	^ aTypeOrNil
		ifNil: [ #Undefined ]
		ifNotNil: [ self nodeToString: aTypeOrNil ]
]

{ #category : #generated }
AlceASTCodeImporter >> visitComparisonOperation: aComparisonOperation [
	^ self visitProgram: aComparisonOperation.

]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitConstant: aConstant [
	| fn |
	fn := self instantiate: AlcixAttribute.
	fn visibility: #Public.
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
	| en i |
	en := self instantiate: AlcixEnum.
	en name: (self nodeToString: aDefineEnum name).
	en anchor: self state top anchor / #src / #types / en name.
	self state top addType: en.
	i := 0.
	aDefineEnum fields
		do: [ :d | 
			i := d value ifNil: [ i + 1 ] ifNotNil: [ :v | v token value asNumber ].
			en
				addEnumValue:
					((self instantiate: AlcixEnumValue)
						name: (self nodeToString: d name);
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
						visibility: #Public;
						yourself) ]
]

{ #category : #'member access' }
AlceASTCodeImporter >> visitDictionaryAccess: aDictionaryAccess [
	self state top addAccess: (self instantiateAccess: aDictionaryAccess)
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
	anAssignementOrEquals isReturn
		ifFalse: [ anAssignementOrEquals isAssignment
				ifTrue: [ access := self instantiate: AlcixAccess.
					access isWriting: true.
					access
						attributeName: (self nodeToString: anAssignementOrEquals left).
					self state top addAccess: access ] ].
	super visitEquals: anAssignementOrEquals
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
	anExplicitAssignement isReturn
		ifFalse: [ access := self instantiate: AlcixAccess.
			access isWriting: true.
			access
				attributeName: (self nodeToString: anExplicitAssignement left).
			self state top addAccess: access ].
	super visitExplicitAssignement: anExplicitAssignement
]

{ #category : #invocations }
AlceASTCodeImporter >> visitExplicitCall: anExplicitCall [
	self instantiateInvocation: anExplicitCall.
	anExplicitCall arguments acceptVisitor: self
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitExternalFunction: aDefinition [
	| fn |
	fn := self instantiate: AlcixExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #functions / fn selector.
	self shouldBeImplemented.
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
	self shouldBeImplemented.
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
	fn typeName: (self typeName: aDefinition type).
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

{ #category : #invocations }
AlceASTCodeImporter >> visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall [
	self instantiateInvocation: anImplicitParenthesesLessCall.
	anImplicitParenthesesLessCall arguments acceptVisitor: self
]

{ #category : #'member access' }
AlceASTCodeImporter >> visitMemberAccess: aMemberAccess [
	self state top addAccess: (self instantiateAccess: aMemberAccess)
]

{ #category : #generated }
AlceASTCodeImporter >> visitModule: aModule [
	(self state top isKindOf: AlcixClass) ifTrue: [  
		self registerSpecialVariable: #Me type: self state top. 
	 ].
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
	fn visibility: (aModuleProperty visibility
			 ifNil: [ #Private ]
			 ifNotNil: [ self nodeToString: aModuleProperty visibility ]).
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

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitParameter: aParameter [
	| param |
	param := self instantiate: AlcixParameter.
	param name: (self nodeToString: aParameter name).
	param typeName: (self typeName: aParameter).
	self state top addParameter: param
]

{ #category : #invocations }
AlceASTCodeImporter >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [
	self instantiateInvocation: aProcedureCallOrArrayAccess.
	aProcedureCallOrArrayAccess arguments acceptVisitor: self
]

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #invocations }
AlceASTCodeImporter >> visitRaiseEvent: aRaiseEvent [
	| call |
	call := self instantiate: AlcixRaiseEvent.
	call selector: (self nodeToString: aRaiseEvent selector).
	call anchor: self state top anchor / #invocation / call selector.

	self state top addOutgoingInvocation: call.
	super visitRaiseEvent: aRaiseEvent.

]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitReDimVariable: aReDimVariable [
	self shouldBeImplemented 
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
