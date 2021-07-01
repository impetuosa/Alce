Class {
	#name : #AlceTextAstComposer,
	#superclass : #AlceTextComposer,
	#traits : 'TVBProgramNodeVisitor',
	#classTraits : 'TVBProgramNodeVisitor classTrait',
	#category : #'Alce-MidasBrowsers'
}

{ #category : #'as yet unclassified' }
AlceTextAstComposer >> compose: anAst model: aModel style: aStyle into: aText browsingWith: aBrowsingObject [ 

	ast := anAst.
	text := aText. 
	style := aStyle.
	ast acceptVisitor: self.

	^ text
]

{ #category : #visiting }
AlceTextAstComposer >> visitArgumentList: anArgumentList [
	^ self visitProgram: anArgumentList
]

{ #category : #visiting }
AlceTextAstComposer >> visitAsTypeAndNew: anAsTypeAndNew [

	self addAttributeAs: anAsTypeAndNew aSToken .
	self addAttributeNew: anAsTypeAndNew nEWToken .
	
	^ self visitProgram: anAsTypeAndNew
]

{ #category : #visiting }
AlceTextAstComposer >> visitCase: aCase [

	self addAttributeCase: aCase caseToken.
	self addAttributeElse: aCase elseToken.
	^ self visitProgram: aCase
]

{ #category : #visiting }
AlceTextAstComposer >> visitColorLiteral: aColorLiteral [

	self addAttributeColor: aColorLiteral token.

	^ self visitProgram: aColorLiteral
]

{ #category : #visiting }
AlceTextAstComposer >> visitConcatenationOperation: aConcatenationOperation [

	self addAttributeOperator: aConcatenationOperation andToken.

	^ self visitProgram: aConcatenationOperation
]

{ #category : #visiting }
AlceTextAstComposer >> visitConstant: aConstant [
	self addAttributeOperator: aConstant equalToken .
	^ self visitProgram: aConstant
]

{ #category : #visiting }
AlceTextAstComposer >> visitConstantList: aConstantList [

	^ self visitProgram: aConstantList
]

{ #category : #visiting }
AlceTextAstComposer >> visitDefineEnum: aDefineEnum [

	aDefineEnum enumTokens do: [ :e | self addAttributeEnum: e ].
	self addAttributeVisibility: aDefineEnum visibility.
	self addAttributeEndToken: aDefineEnum endToken.
	^ self visitProgram: aDefineEnum
]

{ #category : #visiting }
AlceTextAstComposer >> visitDefineType: aDefineType [

	self addAttributeVisibility: aDefineType visibility.

	aDefineType typeTokens do: [ :t | self addAttributeType: t ].
	self addAttributeEndToken: aDefineType endToken.
	^ self visitProgram: aDefineType
]

{ #category : #visiting }
AlceTextAstComposer >> visitDimMultipleVariables: aDimMultipleVariables [

	self addAttributeDim: aDimMultipleVariables dimToken.

	^ self visitProgram: aDimMultipleVariables
]

{ #category : #visiting }
AlceTextAstComposer >> visitDimVariable: aDimVariable [

	self addAttributeDim: aDimVariable dimToken.
	^ self visitProgram: aDimVariable
]

{ #category : #visiting }
AlceTextAstComposer >> visitDoEvents: aDoEvents [
self halt.
	
	^ self visitProgram: aDoEvents
]

{ #category : #visiting }
AlceTextAstComposer >> visitDoUntilTrue: aDoUntilTrue [

	^ self visitProgram: aDoUntilTrue
]

{ #category : #visiting }
AlceTextAstComposer >> visitDoWhileTrue: aDoWhileTrue [

	self addAttributeKeyword: aDoWhileTrue doToken.
	self addAttributeKeyword: aDoWhileTrue loopToken.
	self addAttributeKeyword: aDoWhileTrue whileToken.

	^ self visitProgram: aDoWhileTrue
]

{ #category : #visiting }
AlceTextAstComposer >> visitElseIfBlock: anElseIfBlock [

	self addAttributeElse: anElseIfBlock elseifToken.
	self addAttributeElse: anElseIfBlock elseToken.
	self addAttributeThen: anElseIfBlock thenToken.
	^ self visitProgram: anElseIfBlock
]

{ #category : #visiting }
AlceTextAstComposer >> visitEnumEntry: anEnumEntry [
 	self addAttributeOperator: anEnumEntry equalToken.
	^ self visitProgram: anEnumEntry
]

{ #category : #visiting }
AlceTextAstComposer >> visitEquals: anEquals [
	self addAttributeOperator: anEquals operator.
	
	^ self visitProgram: anEquals
]

{ #category : #visiting }
AlceTextAstComposer >> visitEvent: anEvent [

	self addAttributeFunction: anEvent eventToken.

	^ self visitProgram: anEvent
]

{ #category : #visiting }
AlceTextAstComposer >> visitExits: anExits [

	{ #exitToken. #functionToken. #subToken. #doToken. #fORToken.
	#propertyToken } do: [ :t | 
		self addAttributeKeyword: (anExits perform: t) ].
	^ self visitProgram: anExits
]

{ #category : #visiting }
AlceTextAstComposer >> visitExplicitAssignement: anExplicitAssignement [

	self addAttributeOperator: anExplicitAssignement operator.   
	self addAttributeAssignmentKind: anExplicitAssignement kind.

	^ self visitProgram: anExplicitAssignement
]

{ #category : #visiting }
AlceTextAstComposer >> visitExplicitCall: anExplicitCall [

	self addAttributeKeyword: anExplicitCall callToken.
	^ self visitProgram: anExplicitCall
]

{ #category : #visiting }
AlceTextAstComposer >> visitExternalFunction: anExternalFunction [
	self addAttributeKeyword: anExternalFunction libToken .
	self addAttributeVisibility: anExternalFunction visibility .
	self addAttributeKeyword: anExternalFunction aliasToken.
	^ self visitProgram: anExternalFunction
]

{ #category : #visiting }
AlceTextAstComposer >> visitExternalSub: anExternalSub [

self halt.
	
	^ self visitProgram: anExternalSub
]

{ #category : #visiting }
AlceTextAstComposer >> visitFloatLiteral: aFloatLiteral [

	self addAttributeStringLiteral: aFloatLiteral token.
	^ self visitProgram: aFloatLiteral
]

{ #category : #visiting }
AlceTextAstComposer >> visitForEach: aForEach [

	self addAttributeKeyword: aForEach fORToken.
	self addAttributeKeyword: aForEach eachToken.
	self addAttributeKeyword: aForEach inToken.
	self addAttributeNext: aForEach nextToken.
	^ self visitProgram: aForEach
]

{ #category : #visiting }
AlceTextAstComposer >> visitForNext: aForNext [

	self addAttributeKeyword: aForNext fORToken.
	self addAttributeKeyword: aForNext toToken.
	self addAttributeNext: aForNext nextToken.
	self addAttributeOperator: aForNext equalToken .
	^ self visitProgram: aForNext
]

{ #category : #visiting }
AlceTextAstComposer >> visitForStepNext: aForStepNext [
self halt.
	
	^ self visitProgram: aForStepNext
]

{ #category : #visiting }
AlceTextAstComposer >> visitFunctionDefinition: aFunctionDefinition [

	self assert: aFunctionDefinition modifier isNil. 
	self addAttributeVisibility: aFunctionDefinition visibility.
	

	aFunctionDefinition functionTokens do: [ :t | 
		self addAttributeFunction: t ].
	self addAttributeEndToken: aFunctionDefinition endToken.


	^ self visitProgram: aFunctionDefinition
]

{ #category : #visiting }
AlceTextAstComposer >> visitGoSub: aGoSub [
	self addAttributeKeyword: aGoSub gosubToken .
	
	^ self visitProgram: aGoSub
]

{ #category : #visiting }
AlceTextAstComposer >> visitGoSubLabel: aGoSubLabel [

self halt.
	
	^ self visitProgram: aGoSubLabel
]

{ #category : #visiting }
AlceTextAstComposer >> visitGoToStatement: aGoToStatement [

	self addAttributeGoTo: aGoToStatement gotoToken.
	^ self visitProgram: aGoToStatement
]

{ #category : #visiting }
AlceTextAstComposer >> visitIfThenElse: anIfThenElse [

	anIfThenElse ifTokens do: [ :i | self addAttributeIf: i ].
	self addAttributeEndToken: anIfThenElse endToken.
	self addAttributeThen: anIfThenElse thenToken .
	self addAttributeElse: anIfThenElse elseToken .
	
	^ self visitProgram: anIfThenElse
]

{ #category : #visiting }
AlceTextAstComposer >> visitIntegerLiteral: anIntegerLiteral [

	self addAttributeStringLiteral: anIntegerLiteral token.
	^ self visitProgram: anIntegerLiteral
]

{ #category : #visiting }
AlceTextAstComposer >> visitLabelTag: aLabelTag [

	self addAttributeLabel: aLabelTag name.
	self addAttributeOperator: aLabelTag colonToken.
	^ self visitProgram: aLabelTag
]

{ #category : #visiting }
AlceTextAstComposer >> visitModule: aModule [

	(aModule attributes at: #comments) do: [ :pair | 
		pair second < text size ifTrue: [ 
			style comment do: [ :cs | 
				text addAttribute: cs from: pair first to: pair second ] ] ].

	^ self visitProgram: aModule
]

{ #category : #visiting }
AlceTextAstComposer >> visitModuleAttribute: aModuleAttribute [
self halt.
	
	^ self visitProgram: aModuleAttribute
]

{ #category : #visiting }
AlceTextAstComposer >> visitModuleConstant: aModuleConstant [
	self addAttributeConst: aModuleConstant constToken .
	self addAttributeVisibility: aModuleConstant visibility .
	^ self visitProgram: aModuleConstant
]

{ #category : #visiting }
AlceTextAstComposer >> visitModuleMultipleConstants: aModuleMultipleConstants [
self halt.
	
	^ self visitProgram: aModuleMultipleConstants
]

{ #category : #visiting }
AlceTextAstComposer >> visitModuleProperty: aModuleProperty [

	self addAttributeVisibility: aModuleProperty visibility.
	^ self visitProgram: aModuleProperty
]

{ #category : #visiting }
AlceTextAstComposer >> visitModulePropertyGet: aModulePropertyGet [

	self addAttributeAccessorKind: aModulePropertyGet getToken.
	self addAttributeAccessorKind: aModulePropertyGet setToken.
	self addAttributeAccessorKind: aModulePropertyGet letToken.
	self addAttributeVisibility: aModulePropertyGet visibility .
	aModulePropertyGet propertyTokens do: [ : p | self addAttributeProperty: p ].
	self addAttributeEndToken: aModulePropertyGet endToken. 
	
	^ self visitProgram: aModulePropertyGet
]

{ #category : #visiting }
AlceTextAstComposer >> visitNewClause: aNewClause [

	self addAttributeNew: aNewClause nEWToken .
	^ self visitProgram: aNewClause
]

{ #category : #visiting }
AlceTextAstComposer >> visitNull: aNull [
	self addAttributeLiteral: aNull token . 
	^ self visitProgram: aNull
]

{ #category : #visiting }
AlceTextAstComposer >> visitOnErrorGoTo: anOnErrorGoTo [

	self addAttributeOn: anOnErrorGoTo onToken.
	self addAttributeError: anOnErrorGoTo eRRORToken.
	^ self visitProgram: anOnErrorGoTo
]

{ #category : #visiting }
AlceTextAstComposer >> visitOnErrorResumeNext: anOnErrorResumeNext [

	self addAttributeOn: anOnErrorResumeNext onToken.
	self addAttributeError: anOnErrorResumeNext eRRORToken.
	self addAttributeResume: anOnErrorResumeNext resumeToken.
	self addAttributeNext: anOnErrorResumeNext nextToken.

	^ self visitProgram: anOnErrorResumeNext
]

{ #category : #visiting }
AlceTextAstComposer >> visitOnExpressionGo: anOnExpressionGo [
self halt.
	
	^ self visitProgram: anOnExpressionGo
]

{ #category : #visiting }
AlceTextAstComposer >> visitOptionCompare: anOptionCompare [
self halt.
	
	^ self visitProgram: anOptionCompare
]

{ #category : #visiting }
AlceTextAstComposer >> visitOptionCompareDatabase: anOptionCompareDatabase [
		
	self addAttributeOption: anOptionCompareDatabase optionToken. 
	self addAttributeCompare: anOptionCompareDatabase compareToken . 
	self addAttributeDatabase: anOptionCompareDatabase databaseToken . 
	^ self visitProgram: anOptionCompareDatabase
]

{ #category : #visiting }
AlceTextAstComposer >> visitOptionExplicit: anOptionExplicit [

	self addAttributeOption: anOptionExplicit optionToken.
	self addAttributeExplicit: anOptionExplicit explicitToken.

	^ self visitProgram: anOptionExplicit
]

{ #category : #visiting }
AlceTextAstComposer >> visitParameter: aParameter [

	self addAttributeOperator: aParameter equalToken.
	self addAttributeKeyword: aParameter strategy.
	self addAttributeKeyword: aParameter optionalToken.
	self addAttributeKeyword: aParameter paramarrayToken.
	^ self visitProgram: aParameter
]

{ #category : #visiting }
AlceTextAstComposer >> visitParameterList: aParameterList [

	self addAttributeOperator: aParameterList leftParenToken.
	self addAttributeOperator: aParameterList rightParenToken.
	^ self visitProgram: aParameterList
]

{ #category : #visiting }
AlceTextAstComposer >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [

	self addAttributeOperator: aProcedureCallOrArrayAccess leftParenToken.
	self addAttributeOperator:
		aProcedureCallOrArrayAccess rightParenToken.

	^ self visitProgram: aProcedureCallOrArrayAccess
]

{ #category : #visiting }
AlceTextAstComposer >> visitQualifiedIdentifier: aQualifiedIdentifier [

self halt.
	
	^ self visitProgram: aQualifiedIdentifier
]

{ #category : #visiting }
AlceTextAstComposer >> visitRaiseError: aRaiseError [
self halt.
	
	^ self visitProgram: aRaiseError
]

{ #category : #visiting }
AlceTextAstComposer >> visitRaiseEvent: aRaiseEvent [

	self addAttributeKeyword: aRaiseEvent raiseEventToken.
	^ self visitProgram: aRaiseEvent
]

{ #category : #visiting }
AlceTextAstComposer >> visitReDimMultipleVariables: aReDimMultipleVariables [
self halt.
	
	^ self visitProgram: aReDimMultipleVariables
]

{ #category : #visiting }
AlceTextAstComposer >> visitReDimVariable: aReDimVariable [

	self addAttributeKeyword: aReDimVariable redimToken.
	self addAttributeKeyword: aReDimVariable preserveToken.

	^ self visitProgram: aReDimVariable
]

{ #category : #visiting }
AlceTextAstComposer >> visitResumeEmpty: aResumeEmpty [
	self addAttributeResume: aResumeEmpty resumeToken .
	^ self visitProgram: aResumeEmpty
]

{ #category : #visiting }
AlceTextAstComposer >> visitResumeLabel: aResumeLabel [

	self addAttributeResume: aResumeLabel resumeToken.

	^ self visitProgram: aResumeLabel
]

{ #category : #visiting }
AlceTextAstComposer >> visitResumeNext: aResumeNext [

	self addAttributeResume: aResumeNext resumeToken.
	self addAttributeNext: aResumeNext nextToken.

	^ self visitProgram: aResumeNext
]

{ #category : #visiting }
AlceTextAstComposer >> visitSelect: aSelect [

	aSelect selectTokens do: [ :s | self addAttributeSelect: s ].

	self addAttributeCase: aSelect caseToken.

	self addAttributeEndToken: aSelect endToken.

	^ self visitProgram: aSelect
]

{ #category : #visiting }
AlceTextAstComposer >> visitStaticMultipleVariables: aStaticMultipleVariables [
self halt.
	
	^ self visitProgram: aStaticMultipleVariables
]

{ #category : #visiting }
AlceTextAstComposer >> visitStaticVariable: aStaticVariable [

	self addAttributeKeyword: aStaticVariable staticToken.

	^ self visitProgram: aStaticVariable
]

{ #category : #visiting }
AlceTextAstComposer >> visitStringLiteral: aStringLiteral [

	self addAttributeStringLiteral: aStringLiteral token.

	^ self visitProgram: aStringLiteral
]

{ #category : #visiting }
AlceTextAstComposer >> visitSubDefinition: aSubDefinition [

	aSubDefinition subTokens do: [ :s | 
		self addAttributeSub: s ].
	self addAttributeVisibility: aSubDefinition visibility.
	self addAttributeEndToken: aSubDefinition endToken. 

	^ self visitProgram: aSubDefinition
]

{ #category : #visiting }
AlceTextAstComposer >> visitTypedThing: aTypedThing [

	self addAttributeAs: aTypedThing aSToken.
	self addAttributeOperator: aTypedThing timesToken.
	^ self visitProgram: aTypedThing
]

{ #category : #visiting }
AlceTextAstComposer >> visitUntilTrue: anUntilTrue [

	self addAttributeKeyword: anUntilTrue doToken.
	self addAttributeKeyword: anUntilTrue untilToken.
	self addAttributeKeyword: anUntilTrue loopToken.


	^ self visitProgram: anUntilTrue
]

{ #category : #visiting }
AlceTextAstComposer >> visitVariable: aVariable [

	^ self visitProgram: aVariable
]

{ #category : #visiting }
AlceTextAstComposer >> visitVariableList: aVariableList [



	^ self visitProgram: aVariableList
]

{ #category : #visiting }
AlceTextAstComposer >> visitWhileTrue: aWhileTrue [

	self addAttributeKeyword: aWhileTrue doToken.
	self addAttributeKeyword: aWhileTrue whileToken.
	self addAttributeKeyword: aWhileTrue loopToken.


	^ self visitProgram: aWhileTrue
]

{ #category : #visiting }
AlceTextAstComposer >> visitWhileWend: aWhileWend [
	self addAttributeKeyword:	aWhileWend wendToken .
	self addAttributeKeyword: aWhileWend whileToken .
	
	^ self visitProgram: aWhileWend
]

{ #category : #visiting }
AlceTextAstComposer >> visitWith: aWith [

	aWith withTokens do: [ :r | self addAttributeWith: r ].
	self addAttributeEndToken: aWith endToken.


	^ self visitProgram: aWith
]
