Class {
	#name : #AlceASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#traits : 'AlceTypeConversions',
	#classTraits : 'AlceTypeConversions classTrait',
	#category : #'Alce-Importer'
}

{ #category : #anchor }
AlceASTCodeImporter >> codeAnchor: aString for: aVBModulePropertyNode [

	^ self state top anchor / aString / #'@src'
	  / aVBModulePropertyNode startPosition asString / #to
	  / aVBModulePropertyNode stopPosition asString
]

{ #category : #helper }
AlceASTCodeImporter >> ensureInContextOf: aClass [
	(self state top isKindOf: AlcixInvocable)
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'as yet unclassified' }
AlceASTCodeImporter >> ensureInContextOf: aClass or: aClass2 [

	({ 
		 aClass.
		 aClass2 } anySatisfy: [ :c | self state top isKindOf: c ]) 
		ifFalse: [ self error: 'Unexpected context' ]
]

{ #category : #'member access' }
AlceASTCodeImporter >> instantiateAccess: aMemberOrDictAccess [

	| read |
	read := self instantiateAccessForReference:
		        (self nodeToVariableReferenceName: aMemberOrDictAccess).
	read anchor:
		(self codeAnchor: read printString for: aMemberOrDictAccess).
	^ read
]

{ #category : #'member access' }
AlceASTCodeImporter >> instantiateAccessForReference: aReference [
	| access |
	access := self instantiate: AlcixAccessRead.
	access isWriting: false.
	access
		rightElementName: aReference.
	^ access
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateFlatInvocation: selector for: aCall [

	| call |
	call := self instantiate: AlcixInvocation.
	call selector: selector.
	call anchor:
		(self codeAnchor: (self nodeToString: aCall selector) for: aCall).
	aCall arguments ifNotNil: [ :r | 
		r arguments do: [ :a | 
			| arg |
			arg := self instantiate: AlcixArgument.
			arg value: (self nodeToString: a).
			call addArgument: arg ] ].
	self state top addOutgoingInvocation: call
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateInvocation: aCall [
	| selector |
	aCall selector ifNil: [ self flag: #ShouldManageArrayAccessInHere . ^ self ].
	selector := self nodeToInvocableReferenceName: aCall selector.
	selector selectorSeemsToBeMethodInvocation
		ifTrue: [ self instantiateMethodInvocation: selector for: aCall ]
		ifFalse: [ self instantiateFlatInvocation: selector for: aCall ]
]

{ #category : #invocations }
AlceASTCodeImporter >> instantiateMethodInvocation: selector for: aCall [

	| receiver call |
	receiver := self instantiateAccessForReference:
		            selector dropReceiverOutOfSelector.

	receiver anchor: (self codeAnchor: receiver printString for: aCall).
	self state top addAccess: receiver.
	call := self instantiate: AlcixMethodInvocation.
	call receiver: receiver.
	call selector: selector.
	call anchor: (self codeAnchor: selector printString for: aCall).

	aCall arguments ifNotNil: [ :col | col arguments do: [ :a | 
		| arg |
		arg := self instantiate: AlcixArgument.
		arg value: (self nodeToString: a).
		call addArgument: arg ].].
	self state top addOutgoingInvocation: call
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> instantiateVariable: aClass from: aVariable [

	| var |
	var := self instantiate: aClass.
	var name: (self nodeToString: aVariable name).
	var typeName: (self typeName: aVariable type).
	var instantiatesObjectOnDefinition:
		aVariable type class = VBAsTypeAndNewNode.
	var anchor: (self codeAnchor: var name for: aVariable).

	^ var
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> registerSpecialVariable: aName type: aType [
	| var |
	var := self instantiate: AlcixAttribute.
	var name: aName.
	var typeName: (self typeNameReference: aType name).
	var type: aType.
	var anchor: self state top anchor / #variables / var name.
	^ var
]

{ #category : #generated }
AlceASTCodeImporter >> visitComparisonOperation: aComparisonOperation [
	^ self visitProgram: aComparisonOperation.

]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitConstant: aConstant [

	| fn |
	(self state top isKindOf: AlcixModule)
		ifTrue: [ 
			fn := self instantiate: AlcixAttribute.
			fn visibility: #Public.
			self state top addMember: fn ]
		ifFalse: [ 
			(self state top isKindOf: AlcixInvocable)
				ifTrue: [ 
					fn := self instantiate: AlcixLocalVariable.
					self state top addLocalVariable: fn ]
				ifFalse: [ ^ self error: 'un expected ' ] ].


	fn name: (self nodeToString: aConstant constant).
	fn anchor: (self codeAnchor: fn name for: aConstant).

	fn isConstant: true.


	self state push: fn.
	super visitConstant: aConstant.
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
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	i := 0.
	aDefineEnum fields do: [ :d | 
		i := d value ifNil: [ i + 1 ] ifNotNil: [ :v | 
			     (v isKindOf: VBMemberAccessNode)
				     ifTrue: [ self nodeToString: v ]
				     ifFalse: [ 
					     (v isKindOf: VBNegatedOperationNode)
						     ifTrue: [ -1 * v value token value asNumber ]
						     ifFalse: [ 
							     [ v token value asNumber ]
								     on: Error
								     do: [  v source  ] ] ] ].


		en addEnumValue: ((self instantiate: AlcixEnumValue)
				 name: (self nodeToString: d name);
				 Value: i;
				 yourself) ]
]

{ #category : #'type definition' }
AlceASTCodeImporter >> visitDefineType: aDefineType [

	| en |
	en := self instantiate: AlcixUserType.
	en name: (self nodeToString: aDefineType name).
	en anchor: self state top anchor / #types / en name.
	self state top addType: en.
	aDefineType fields doWithIndex: [ :d :i | 
		| name |
		name := self nodeToString: d name.
		d type sizes ifNotEmpty: [ 
			name := name
			        ,
			        ('-' join:
				         (d type sizes collect: [ :d2 | self nodeToString: d2 ])) ].
		self assert: d type class = VBTypedThingNode.
		en addMember: ((self instantiate: AlcixAttribute)
				 anchor: (self codeAnchor: name for: d);
				 name: name;
				 typeName: (self nodeToTypeReferenceName: d type type);
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
	self ensureInContextOf: AlcixInvocable or: AlcixModule .
	(self state top isKindOf: AlcixInvocable) ifTrue: [ 
		aDimMultipleVariables variables variables do: [ :v | 
			var := self instantiateVariable: AlcixLocalVariable from: v.
			self state top addLocalVariable: var ] ].
	(self state top isKindOf: AlcixModule) ifTrue: [ 
		aDimMultipleVariables variables variables do: [ :v | 
			var := self instantiateVariable: AlcixAttribute from: v.
			var visibility: #Public.
			self state top addMember: var ].
		^ self ]
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitDimVariable: aDimVariable [

	| var |
	(self state top isKindOf: AlcixInvocable) ifTrue: [ 
		var := self
			       instantiateVariable: AlcixLocalVariable
			       from: aDimVariable variable.
		self state top addLocalVariable: var.
		^ self ].
	(self state top isKindOf: AlcixModule ) ifTrue: [ 
		var := self
			       instantiateVariable: AlcixAttribute
			       from: aDimVariable variable.
		var visibility: #Public.
		self state top addMember: var.
		^ self ].
	self error: 'Unexpected case .'
]

{ #category : #assignments }
AlceASTCodeImporter >> visitEquals: anAssignementOrEquals [

	| access |
	"
	Ensure that is an assignment: 
	"
	anAssignementOrEquals isAssignment
		ifTrue: [ 
			access := self instantiate: AlcixAccessWrite.
			access isReturn: anAssignementOrEquals isReturn.
			access anchor: (self
					 codeAnchor: (self writeStringSelector: anAssignementOrEquals)
					 for: anAssignementOrEquals).
			access isWriting: true.
			access leftElementName:
				(self nodeToVariableReferenceName: anAssignementOrEquals left).
			access rightElementName:
				(self nodeToVariableReferenceName: anAssignementOrEquals right).
			self state top addAccess: access ]
		ifFalse: [ anAssignementOrEquals left acceptVisitor: self ].
	anAssignementOrEquals right acceptVisitor: self
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitEvent: anEvent [
	| fn |
	
	fn := self instantiate: AlcixEvent.
	fn selector: (self nodeToString: anEvent selector).
	fn anchor: self state top anchor / #events / fn selector.
	self state top addInvocable: fn.
	self state push: fn.
	super visitEvent: anEvent.
	self state pop
]

{ #category : #assignments }
AlceASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [

	| access |
	access := self instantiate: AlcixAccessWrite.
	access isReturn: (anExplicitAssignement isReturn).
	access anchor: (self
			 codeAnchor: (self writeStringSelector: anExplicitAssignement)
			 for: anExplicitAssignement).
	access isWriting: true.
	access leftElementName:
		(self nodeToVariableReferenceName: anExplicitAssignement left).
	access rightElementName:
		(self nodeToVariableReferenceName: anExplicitAssignement right).
	access isNewObject: (anExplicitAssignement right isKindOf: VBNewClauseNode).
	self state top addAccess: access.
	anExplicitAssignement right acceptVisitor: self
]

{ #category : #invocations }
AlceASTCodeImporter >> visitExplicitCall: anExplicitCall [

	| param |
	param := anExplicitCall selector isIdentifier
		         ifTrue: [ anExplicitCall ]
		         ifFalse: [ anExplicitCall selector ].
	self instantiateInvocation: param.
	anExplicitCall arguments ifNotNil: [ :a | a acceptVisitor: self ]
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitExternalFunction: aDefinition [

	| fn |
	fn := self instantiate: AlcixExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.
	fn libraryName: (self nodeToString: aDefinition library).

	aDefinition alias ifNotNil: [ 
		fn alias: (self nodeToString: aDefinition alias) ].
	aDefinition visibility
		ifNil: [ fn visibility: #Public ]
		ifNotNil: [ 
		fn visibility: (self nodeToString: aDefinition visibility) ].

	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitExternalSub: aDefinition [

	| fn |
	fn := self instantiate: AlcixExternalFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.

	fn libraryName: (self nodeToString: aDefinition library).
	aDefinition alias ifNotNil: [ 
		fn alias: (self nodeToString: aDefinition alias) ].

	aDefinition visibility
		ifNil: [ fn visibility: #Public ]
		ifNotNil: [ 
		fn visibility: (self nodeToString: aDefinition visibility) ].


	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitFunctionDefinition: aDefinition [

	| fn return |
	fn := self instantiate: AlcixFunction.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor:
		self state top anchor / #functions / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString.
	" Addin a local variable with the name of the function to represent the 'returning assignation' "
	return := self instantiate: AlcixLocalVariable.
	return name: (self nodeToString: aDefinition selector).
	return instantiatesObjectOnDefinition: false.
	return anchor: self state top anchor / #return / return name.
	fn addLocalVariable: return.
	aDefinition type ifNotNil: [ 
		fn typeName: (self typeName: aDefinition type).
		fn typeAnchor: self state top anchor / #functions
			/ fn typeName adaptToAlceAnchorPathFragment / #'@src'
			/ aDefinition type startPosition asString / #to
			/ aDefinition type stopPosition asString.

		return typeName: (self typeName: aDefinition type) ].



	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self.
	aDefinition block acceptVisitor: self.
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

{ #category : #'type definition' }
AlceASTCodeImporter >> visitModule: aModule [
	(self state top isKindOf: AlcixClass) ifTrue: [ 
		self state top addMember:
			(self registerSpecialVariable: #Me type: self state top) ].
	^ self visitProgram: aModule
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
	fn typeName: (self typeName: aModuleProperty variable type).
	fn visibility: (aModuleProperty visibility
			 ifNil: [ #Private ]
			 ifNotNil: [ self nodeToString: aModuleProperty visibility ])
			asSymbol.
	fn isConstant: false.

	fn anchor: (self codeAnchor: fn name for: aModuleProperty).
	self state top addMember: fn
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [

	| acc statement kindSymbol attributeName |
	acc := self instantiate: AlcixAttributeAccessor.
	self state top addInvocable: acc.
	kindSymbol := aModulePropertyGet getToken ifNil: [ 
		              aModulePropertyGet setToken ].
	kindSymbol := kindSymbol ifNil: [ aModulePropertyGet letToken ].
	acc kind: kindSymbol value asSymbol.
	acc selector: (self nodeToString: aModulePropertyGet selector).

	acc anchor:
		self state top anchor / #accessors / acc selector / #'@src'
		/ aModulePropertyGet startPosition asString / #to
		/ aModulePropertyGet stopPosition asString.





	"Obtain property name from the body of the accessor "
	acc kind = #Get
		ifTrue: [ 
			aModulePropertyGet type ifNotNil: [ 
				acc typeName: (self typeName: aModulePropertyGet type).
				acc typeAnchor: self state top anchor / #accessors
					/ acc typeName adaptToAlceAnchorPathFragment / #'@src'
					/ aModulePropertyGet type startPosition asString / #to
					/ aModulePropertyGet type stopPosition asString ].



			statement := (aModulePropertyGet block statements select: [ :s | 
				              { 
					              VBExplicitAssignementNode.
					              VBEqualsNode } includes: s class ])
				             detect: [ :s | 
				             (self nodeToString: s left) = acc selector ]
				             ifNone: [ nil ].
			attributeName := statement ifNotNil: [ 
				                 self nodeToString: statement right ] ]
		ifFalse: [ 
			statement := (aModulePropertyGet block allNodesSelect: [ :s | 
				              { 
					              VBExplicitAssignementNode.
					              VBEqualsNode } includes: s class ])
				             detect: [ :s | 
					             (self nodeToString: s right) = (self nodeToString:
						              aModulePropertyGet parameters parameters first
							              name) ]
				             ifNone: [ nil ].
			attributeName := statement ifNotNil: [ 
				                 self nodeToString: statement left ] ].


	acc attribute: (attributeName ifNotNil: [ 
			 self state top members
				 detect: [ :p | p name = attributeName ]
				 ifNone: [ nil ] ]).
	self state push: acc.
	aModulePropertyGet parameters acceptVisitor: self.
	self state pop
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitParameter: aParameter [

	| param |
	param := self instantiate: AlcixParameter.
	param name: (self nodeToString: aParameter name).
	param typeName: (self typeName: aParameter type).
	param isOptional: aParameter isOptional.
	param anchor: (self codeAnchor: param name for: aParameter ).
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

	| call args sel |
	args := (aRaiseEvent selector class name asLowercase includesSubstring: 
		         'identifier')
		        ifTrue: [ 
			        sel := aRaiseEvent selector.
			        args := #(  ) ]
		        ifFalse: [ 
			        sel := aRaiseEvent selector selector.
			        args := aRaiseEvent selector arguments arguments ].
	call := self instantiate: AlcixRaiseEvent.
	call selector: (self nodeToInvocableReferenceName: sel).
	call anchor: (self codeAnchor: call selector for: aRaiseEvent).

	args do: [ :a | 
		| arg |
		arg := self instantiate: AlcixArgument.
		arg value: (self nodeToString: a).
		call addArgument: arg ].
	self state top addOutgoingInvocation: call.
	super visitRaiseEvent: aRaiseEvent
]

{ #category : #'properties - variables' }
AlceASTCodeImporter >> visitReDimVariable: aReDimVariable [

self state top localVariables detect: [ :a | 
		 a name = aReDimVariable variable name token value ] ifFound: [ : e | e redim:
		(self nodeToString: aReDimVariable variable type)] ifNone: [  ]
]

{ #category : #'member access' }
AlceASTCodeImporter >> visitSimpleIdentifier: aSimpleIdentifier [
	(self state top isKindOf: AlcixInvocable)
		ifTrue: [ self state top
				addAccess: (self instantiateAccess: aSimpleIdentifier) ]
]

{ #category : #'functions - subs - events' }
AlceASTCodeImporter >> visitSubDefinition: aDefinition [
	| fn |
	fn := self instantiate: AlcixSubProcedure.
	fn selector: (self nodeToString: aDefinition selector).
	fn anchor: self state top anchor / #subprocedures / fn selector / #'@src'
		/ aDefinition startPosition asString / #to
		/ aDefinition stopPosition asString..
	self state top addInvocable: fn.
	self state push: fn.
	aDefinition parameters acceptVisitor: self. 
	aDefinition block acceptVisitor: self.
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

{ #category : #assignments }
AlceASTCodeImporter >> writeStringSelector: anExplicitAssignement [

	^ (self nodeToString: anExplicitAssignement left) , '='
	  , (self nodeToString: anExplicitAssignement right)
]
