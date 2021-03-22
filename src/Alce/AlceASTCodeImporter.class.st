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

{ #category : #generated }
AlceASTCodeImporter >> visitConstant: aConstant [
	^ self visitProgram: aConstant.

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

{ #category : #generated }
AlceASTCodeImporter >> visitEvent: anEvent [
	^ self visitProgram: anEvent.

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

{ #category : #generated }
AlceASTCodeImporter >> visitFunctionDefinition: aDefinition [
	^ self visitProgram: aDefinition.

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

{ #category : #generated }
AlceASTCodeImporter >> visitModuleProperty: aModuleProperty [
	^ self visitProgram: aModuleProperty.

]

{ #category : #generated }
AlceASTCodeImporter >> visitModulePropertyGet: aModulePropertyGet [
	^ self visitProgram: aModulePropertyGet.

]

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseError: aRaiseError [
	^ self visitProgram: aRaiseError.

]

{ #category : #generated }
AlceASTCodeImporter >> visitRaiseEvent: aRaiseEvent [
	^ self visitProgram: aRaiseEvent.

]

{ #category : #generated }
AlceASTCodeImporter >> visitSubDefinition: aDefinition [
	^ self visitProgram: aDefinition.

]

{ #category : #generated }
AlceASTCodeImporter >> visitVariable: aVariable [
	^ self visitProgram: aVariable.

]

{ #category : #generated }
AlceASTCodeImporter >> visitVariableList: aVariableList [
	^ self visitProgram: aVariableList.

]
