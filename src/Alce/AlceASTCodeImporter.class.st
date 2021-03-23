Class {
	#name : #AlceASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#instVars : [
		'stringConverter'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #implemented }
AlceASTCodeImporter >> nodeToString: aNode [
	^ self stringConverter toString: aNode
]

{ #category : #implemented }
AlceASTCodeImporter >> stringConverter [
	^ stringConverter
		ifNil: [ stringConverter := AlceVBVisitorToString new ]
]

{ #category : #generated }
AlceASTCodeImporter >> visitAssignementOrEquals: anAssignementOrEquals [
	^ self visitProgram: anAssignementOrEquals.

]

{ #category : #generated }
AlceASTCodeImporter >> visitComparisonOperation: aComparisonOperation [
	^ self visitProgram: aComparisonOperation.

]

{ #category : #implemented }
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

{ #category : #implemented }
AlceASTCodeImporter >> visitDefType: aDefType [
	^ self error: ' Def type is a really really really crappy thing '

]

{ #category : #implemented }
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

{ #category : #implementing }
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

{ #category : #generated }
AlceASTCodeImporter >> visitDimMultipleVariables: aDimMultipleVariables [
	^ self visitProgram: aDimMultipleVariables.

]

{ #category : #generated }
AlceASTCodeImporter >> visitDimVariable: aDimVariable [
	^ self visitProgram: aDimVariable.

]

{ #category : #generated }
AlceASTCodeImporter >> visitEquals: anEquals [
	^ self visitProgram: anEquals.

]

{ #category : #implemented }
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

{ #category : #generated }
AlceASTCodeImporter >> visitExplicitAssignement: anExplicitAssignement [
	^ self visitProgram: anExplicitAssignement.

]

{ #category : #generated }
AlceASTCodeImporter >> visitExplicitCall: anExplicitCall [
	^ self visitProgram: anExplicitCall.

]

{ #category : #generated }
AlceASTCodeImporter >> visitExternalFunction: aDefinition [
	^ self visitProgram: aDefinition.

]

{ #category : #generated }
AlceASTCodeImporter >> visitExternalSub: aDefinition [
	^ self visitProgram: aDefinition.

]

{ #category : #implemented }
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

{ #category : #generated }
AlceASTCodeImporter >> visitImplicitParenthesesLessCall: anImplicitParenthesesLessCall [
	^ self visitProgram: anImplicitParenthesesLessCall.

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

{ #category : #implemented }
AlceASTCodeImporter >> visitModuleProperty: aModuleProperty [
	| fn |
	fn := self instantiate: AlcixAttribute.
	fn name: (self nodeToString: aModuleProperty variable name).
	fn isConstant: false.
	fn anchor: self state top anchor / #attributes / fn name.
	self state top addMember: fn.
	self state push: fn.
	super visitSubDefinition: aModuleProperty.
	self state pop
]

{ #category : #implemented }
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

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseEvent: aRaiseEvent [
	^ self visitProgram: aRaiseEvent.

]

{ #category : #implemented }
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
