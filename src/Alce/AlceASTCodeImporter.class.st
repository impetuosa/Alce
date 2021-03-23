Class {
	#name : #AlceASTCodeImporter,
	#superclass : #JinASTCodeVisitor,
	#category : #'Alce-Importer-Jindao'
}

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
	fn name: aConstant constant token value.
	fn isConstant: true.
	fn
		anchor:
			self state top anchor / #constants
				/ aConstant constant token value.
	self state top addMember: fn.
	self state push: fn.
	super visitSubDefinition: aConstant.
	self state pop
]

{ #category : #generated }
AlceASTCodeImporter >> visitConstantList: aConstantList [
	^ self visitProgram: aConstantList.

]

{ #category : #generated }
AlceASTCodeImporter >> visitDefType: aDefType [
	^ self visitProgram: aDefType.

]

{ #category : #generated }
AlceASTCodeImporter >> visitDefineEnum: aDefineEnum [
	^ self visitProgram: aDefineEnum.

]

{ #category : #generated }
AlceASTCodeImporter >> visitDefineType: aDefineType [
	^ self visitProgram: aDefineType.

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
	fn selector: aDefinition selector token value.
	fn anchor: self state top anchor / #functions / aDefinition selector token value.
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
	fn name: aModuleProperty variable name token value.
	fn isConstant: false.
	fn
		anchor:
			self state top anchor / #attributes
				/ aModuleProperty variable name token value.
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
	acc selector: aModulePropertyGet selector token value.
	 
	self assert: acc kind = #Get.

	"Obtain property name from the body of the accessor "
	statement := (aModulePropertyGet block statements
		select: [ :s | 
			{VBExplicitAssignementNode.
			VBEqualsNode} includes: s class ])
		detect:
			[ :s | s left token value = aModulePropertyGet selector token value ].
	acc
		attribute:
			(self state top typedEntities
				detect: [ :p | p name = statement right token value ])
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
	fn selector: aDefinition selector token value.
	fn anchor: self state top anchor / #subprocedures / aDefinition selector token value.
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
