Class {
	#name : #AlceTextComposer,
	#superclass : #Object,
	#traits : 'TVBProgramNodeVisitor',
	#classTraits : 'TVBProgramNodeVisitor classTrait',
	#instVars : [
		'ast',
		'text',
		'model',
		'style'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #adding }
AlceTextComposer >> addAttributeAccessorKind: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style accessorKind
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeAs: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style as forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeAssignmentKind: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style assignmentKind
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeCase: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style case forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeCompare: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style compare
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeConst: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style const forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeDatabase: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style database forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeDim: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style dim
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeElse: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style else forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeEndToken: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style endKeyword
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeEnum: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style enum forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeError: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style errorStyle
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeExplicit: aSmaCCCaseInsensitiveToken [ 

	^ self
		  addStyle: style explicit
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeFunction: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style functionKeyword
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeGoTo: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style goto forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeIf: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style if forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeKeyword: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style keyword forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeLabel: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style label forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeLiteral: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style literal forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeNew: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style new forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeNext: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style next forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOn: aSmaCCCaseInsensitiveToken [ 
	^ self
		  addStyle: style on
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOperator: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style operator forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeOption: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style option forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeProperty: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style property forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeResume: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style resume forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #enumerating }
AlceTextComposer >> addAttributeSelect: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style select forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeStringLiteral: aSmaCCCaseInsensitiveToken [ 
^ self
		  addStyle: style string 
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeSub: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style sub forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeThen: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style then forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeType: aSmaCCCaseInsensitiveToken [ 
	
^ self
		  addStyle: style type
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeVisibility: aSmaCCCaseInsensitiveToken [

	^ self
		  addStyle: style visibility
		  forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addAttributeWith: aSmaCCCaseInsensitiveToken [

	^ self addStyle: style with forToken: aSmaCCCaseInsensitiveToken
]

{ #category : #adding }
AlceTextComposer >> addColor: aColor forToken: aToken [

	aToken ifNil: [ ^ self ].
	text
		addAttribute: (TextColor new color: aColor)
		from: aToken startPosition
		to: aToken stopPosition
]

{ #category : #adding }
AlceTextComposer >> addStyle: aStyleArray forToken: aToken [

	aToken ifNil: [ ^ self ].
	aStyleArray do: [ :aStyle | 
		text
			addAttribute: aStyle
			from: aToken startPosition
			to: aToken stopPosition ]
]

{ #category : #'as yet unclassified' }
AlceTextComposer >> compose: anAst model: aModel style: aStyle [

	anAst ifNil: [ ^ Text fromString: '' ].
	ast := anAst.
	text := Text fromString: anAst source.
	style := aStyle.
	ast acceptVisitor: self.

	^ text
]

{ #category : #generated }
AlceTextComposer >> visitArgumentList: anArgumentList [
	^ self visitProgram: anArgumentList
]

{ #category : #generated }
AlceTextComposer >> visitAsTypeAndNew: anAsTypeAndNew [

	self addAttributeAs: anAsTypeAndNew aSToken .
	self addAttributeNew: anAsTypeAndNew nEWToken .
	
	^ self visitProgram: anAsTypeAndNew
]

{ #category : #generated }
AlceTextComposer >> visitCase: aCase [

	self addAttributeCase: aCase caseToken.
	self addAttributeElse: aCase elseToken.
	^ self visitProgram: aCase
]

{ #category : #generated }
AlceTextComposer >> visitColorLiteral: aColorLiteral [
self halt.
	
	^ self visitProgram: aColorLiteral
]

{ #category : #generated }
AlceTextComposer >> visitConcatenationOperation: aConcatenationOperation [

	self addAttributeOperator: aConcatenationOperation andToken.

	^ self visitProgram: aConcatenationOperation
]

{ #category : #generated }
AlceTextComposer >> visitConstant: aConstant [
	self addAttributeOperator: aConstant equalToken .
	^ self visitProgram: aConstant
]

{ #category : #generated }
AlceTextComposer >> visitConstantList: aConstantList [

	^ self visitProgram: aConstantList
]

{ #category : #generated }
AlceTextComposer >> visitDefineEnum: aDefineEnum [

	aDefineEnum enumTokens do: [ :e | self addAttributeEnum: e ].
	self addAttributeVisibility: aDefineEnum visibility.
	self addAttributeEndToken: aDefineEnum endToken.
	^ self visitProgram: aDefineEnum
]

{ #category : #generated }
AlceTextComposer >> visitDefineType: aDefineType [

	self addAttributeVisibility: aDefineType visibility.

	aDefineType typeTokens do: [ :t | self addAttributeType: t ].
	self addAttributeEndToken: aDefineType endToken.
	^ self visitProgram: aDefineType
]

{ #category : #generated }
AlceTextComposer >> visitDimMultipleVariables: aDimMultipleVariables [

	self addAttributeDim: aDimMultipleVariables dimToken.

	^ self visitProgram: aDimMultipleVariables
]

{ #category : #generated }
AlceTextComposer >> visitDimVariable: aDimVariable [

	self addAttributeDim: aDimVariable dimToken.
	^ self visitProgram: aDimVariable
]

{ #category : #generated }
AlceTextComposer >> visitDoEvents: aDoEvents [
self halt.
	
	^ self visitProgram: aDoEvents
]

{ #category : #generated }
AlceTextComposer >> visitDoUntilTrue: aDoUntilTrue [

	^ self visitProgram: aDoUntilTrue
]

{ #category : #generated }
AlceTextComposer >> visitDoWhileTrue: aDoWhileTrue [
self halt.
	
	^ self visitProgram: aDoWhileTrue
]

{ #category : #generated }
AlceTextComposer >> visitElseIfBlock: anElseIfBlock [

	self addAttributeElse: anElseIfBlock elseifToken.
	self addAttributeElse: anElseIfBlock elseToken.
	self addAttributeThen: anElseIfBlock thenToken.
	^ self visitProgram: anElseIfBlock
]

{ #category : #generated }
AlceTextComposer >> visitEnumEntry: anEnumEntry [
 	self addAttributeOperator: anEnumEntry equalToken.
	^ self visitProgram: anEnumEntry
]

{ #category : #generated }
AlceTextComposer >> visitEquals: anEquals [
	self addAttributeOperator: anEquals operator.
	
	^ self visitProgram: anEquals
]

{ #category : #generated }
AlceTextComposer >> visitEvent: anEvent [
self halt.
	
	^ self visitProgram: anEvent
]

{ #category : #generated }
AlceTextComposer >> visitExits: anExits [

	{ #exitToken. #functionToken. #subToken. #doToken. #fORToken.
	#propertyToken } do: [ :t | 
		self addAttributeKeyword: (anExits perform: t) ].
	^ self visitProgram: anExits
]

{ #category : #generated }
AlceTextComposer >> visitExplicitAssignement: anExplicitAssignement [

	self addAttributeOperator: anExplicitAssignement operator.   
	self addAttributeAssignmentKind: anExplicitAssignement kind.

	^ self visitProgram: anExplicitAssignement
]

{ #category : #generated }
AlceTextComposer >> visitExplicitCall: anExplicitCall [
self halt.
	
	^ self visitProgram: anExplicitCall
]

{ #category : #generated }
AlceTextComposer >> visitExternalFunction: anExternalFunction [
self halt.
	
	^ self visitProgram: anExternalFunction
]

{ #category : #generated }
AlceTextComposer >> visitExternalSub: anExternalSub [

self halt.
	
	^ self visitProgram: anExternalSub
]

{ #category : #generated }
AlceTextComposer >> visitFloatLiteral: aFloatLiteral [

	self addAttributeStringLiteral: aFloatLiteral token.
	^ self visitProgram: aFloatLiteral
]

{ #category : #generated }
AlceTextComposer >> visitForEach: aForEach [
self halt.
	
	^ self visitProgram: aForEach
]

{ #category : #generated }
AlceTextComposer >> visitForNext: aForNext [
self halt.
	^ self visitProgram: aForNext
]

{ #category : #generated }
AlceTextComposer >> visitForStepNext: aForStepNext [
self halt.
	
	^ self visitProgram: aForStepNext
]

{ #category : #generated }
AlceTextComposer >> visitFunctionDefinition: aFunctionDefinition [

	self assert: aFunctionDefinition modifier isNil. 
	self addAttributeVisibility: aFunctionDefinition visibility.
	

	aFunctionDefinition functionTokens do: [ :t | 
		self addAttributeFunction: t ].
	self addAttributeEndToken: aFunctionDefinition endToken.


	^ self visitProgram: aFunctionDefinition
]

{ #category : #generated }
AlceTextComposer >> visitGoSub: aGoSub [
self halt.
	
	^ self visitProgram: aGoSub
]

{ #category : #generated }
AlceTextComposer >> visitGoSubLabel: aGoSubLabel [

self halt.
	
	^ self visitProgram: aGoSubLabel
]

{ #category : #generated }
AlceTextComposer >> visitGoToStatement: aGoToStatement [

	self addAttributeGoTo: aGoToStatement gotoToken.
	^ self visitProgram: aGoToStatement
]

{ #category : #generated }
AlceTextComposer >> visitIfThenElse: anIfThenElse [

	anIfThenElse ifTokens do: [ :i | self addAttributeIf: i ].
	self addAttributeEndToken: anIfThenElse endToken.
	self addAttributeThen: anIfThenElse thenToken .
	self addAttributeElse: anIfThenElse elseToken .
	
	^ self visitProgram: anIfThenElse
]

{ #category : #generated }
AlceTextComposer >> visitIntegerLiteral: anIntegerLiteral [

	self addAttributeStringLiteral: anIntegerLiteral token.
	^ self visitProgram: anIntegerLiteral
]

{ #category : #generated }
AlceTextComposer >> visitLabelTag: aLabelTag [

	self addAttributeLabel: aLabelTag name.
	self addAttributeOperator: aLabelTag colonToken.
	^ self visitProgram: aLabelTag
]

{ #category : #generated }
AlceTextComposer >> visitModule: aModule [

	(aModule attributes at: #comments) do: [ :pair | 
		style comment do: [ :cs | 
			text addAttribute: cs from: pair first to: pair second ] ].

	^ self visitProgram: aModule
]

{ #category : #generated }
AlceTextComposer >> visitModuleAttribute: aModuleAttribute [
self halt.
	
	^ self visitProgram: aModuleAttribute
]

{ #category : #generated }
AlceTextComposer >> visitModuleConstant: aModuleConstant [
	self addAttributeConst: aModuleConstant constToken .
	self addAttributeVisibility: aModuleConstant visibility .
	^ self visitProgram: aModuleConstant
]

{ #category : #generated }
AlceTextComposer >> visitModuleMultipleConstants: aModuleMultipleConstants [
self halt.
	
	^ self visitProgram: aModuleMultipleConstants
]

{ #category : #generated }
AlceTextComposer >> visitModuleProperty: aModuleProperty [

	self addAttributeVisibility: aModuleProperty visibility.
	^ self visitProgram: aModuleProperty
]

{ #category : #generated }
AlceTextComposer >> visitModulePropertyGet: aModulePropertyGet [

	self addAttributeAccessorKind: aModulePropertyGet getToken.
	self addAttributeAccessorKind: aModulePropertyGet setToken.
	self addAttributeAccessorKind: aModulePropertyGet letToken.
	self addAttributeVisibility: aModulePropertyGet visibility .
	aModulePropertyGet propertyTokens do: [ : p | self addAttributeProperty: p ].
	self addAttributeEndToken: aModulePropertyGet endToken. 
	
	^ self visitProgram: aModulePropertyGet
]

{ #category : #generated }
AlceTextComposer >> visitNewClause: aNewClause [

	self addAttributeNew: aNewClause nEWToken .
	^ self visitProgram: aNewClause
]

{ #category : #generated }
AlceTextComposer >> visitNull: aNull [
	self addAttributeLiteral: aNull token . 
	^ self visitProgram: aNull
]

{ #category : #generated }
AlceTextComposer >> visitOnErrorGoTo: anOnErrorGoTo [

	self addAttributeOn: anOnErrorGoTo onToken.
	self addAttributeError: anOnErrorGoTo eRRORToken.
	^ self visitProgram: anOnErrorGoTo
]

{ #category : #generated }
AlceTextComposer >> visitOnErrorResumeNext: anOnErrorResumeNext [

	self addAttributeOn: anOnErrorResumeNext onToken.
	self addAttributeError: anOnErrorResumeNext eRRORToken.
	self addAttributeResume: anOnErrorResumeNext resumeToken.
	self addAttributeNext: anOnErrorResumeNext nextToken.

	^ self visitProgram: anOnErrorResumeNext
]

{ #category : #generated }
AlceTextComposer >> visitOnExpressionGo: anOnExpressionGo [
self halt.
	
	^ self visitProgram: anOnExpressionGo
]

{ #category : #generated }
AlceTextComposer >> visitOptionCompare: anOptionCompare [
self halt.
	
	^ self visitProgram: anOptionCompare
]

{ #category : #generated }
AlceTextComposer >> visitOptionCompareDatabase: anOptionCompareDatabase [
		
	self addAttributeOption: anOptionCompareDatabase optionToken. 
	self addAttributeCompare: anOptionCompareDatabase compareToken . 
	self addAttributeDatabase: anOptionCompareDatabase databaseToken . 
	^ self visitProgram: anOptionCompareDatabase
]

{ #category : #generated }
AlceTextComposer >> visitOptionExplicit: anOptionExplicit [

	self addAttributeOption: anOptionExplicit optionToken.
	self addAttributeExplicit: anOptionExplicit explicitToken.

	^ self visitProgram: anOptionExplicit
]

{ #category : #generated }
AlceTextComposer >> visitParameter: aParameter [

	self addAttributeOperator: aParameter equalToken.
	self addAttributeKeyword: aParameter strategy.
	self addAttributeKeyword: aParameter optionalToken.
	self addAttributeKeyword: aParameter paramarrayToken.
	^ self visitProgram: aParameter
]

{ #category : #generated }
AlceTextComposer >> visitParameterList: aParameterList [

	self addAttributeOperator: aParameterList leftParenToken.
	self addAttributeOperator: aParameterList rightParenToken.
	^ self visitProgram: aParameterList
]

{ #category : #generated }
AlceTextComposer >> visitProcedureCallOrArrayAccess: aProcedureCallOrArrayAccess [

	self addAttributeOperator: aProcedureCallOrArrayAccess leftParenToken.
	self addAttributeOperator:
		aProcedureCallOrArrayAccess rightParenToken.

	^ self visitProgram: aProcedureCallOrArrayAccess
]

{ #category : #generated }
AlceTextComposer >> visitQualifiedIdentifier: aQualifiedIdentifier [

self halt.
	
	^ self visitProgram: aQualifiedIdentifier
]

{ #category : #generated }
AlceTextComposer >> visitRaiseError: aRaiseError [
self halt.
	
	^ self visitProgram: aRaiseError
]

{ #category : #generated }
AlceTextComposer >> visitRaiseEvent: aRaiseEvent [
self halt.
	
	^ self visitProgram: aRaiseEvent
]

{ #category : #generated }
AlceTextComposer >> visitReDimMultipleVariables: aReDimMultipleVariables [
self halt.
	
	^ self visitProgram: aReDimMultipleVariables
]

{ #category : #generated }
AlceTextComposer >> visitReDimVariable: aReDimVariable [
self halt.
	
	^ self visitProgram: aReDimVariable
]

{ #category : #generated }
AlceTextComposer >> visitResumeEmpty: aResumeEmpty [
	self addAttributeResume: aResumeEmpty resumeToken .
	^ self visitProgram: aResumeEmpty
]

{ #category : #generated }
AlceTextComposer >> visitResumeLabel: aResumeLabel [

	self addAttributeResume: aResumeLabel resumeToken.

	^ self visitProgram: aResumeLabel
]

{ #category : #generated }
AlceTextComposer >> visitResumeNext: aResumeNext [
self halt.
	
	^ self visitProgram: aResumeNext
]

{ #category : #generated }
AlceTextComposer >> visitSelect: aSelect [

	aSelect selectTokens do: [ :s | self addAttributeSelect: s ].

	self addAttributeCase: aSelect caseToken.

	self addAttributeEndToken: aSelect endToken.

	^ self visitProgram: aSelect
]

{ #category : #generated }
AlceTextComposer >> visitStaticMultipleVariables: aStaticMultipleVariables [
self halt.
	
	^ self visitProgram: aStaticMultipleVariables
]

{ #category : #generated }
AlceTextComposer >> visitStaticVariable: aStaticVariable [
self halt.
	
	^ self visitProgram: aStaticVariable
]

{ #category : #generated }
AlceTextComposer >> visitStringLiteral: aStringLiteral [

	self addAttributeStringLiteral: aStringLiteral token.

	^ self visitProgram: aStringLiteral
]

{ #category : #generated }
AlceTextComposer >> visitSubDefinition: aSubDefinition [

	aSubDefinition subTokens do: [ :s | 
		self addAttributeSub: s ].
	self addAttributeVisibility: aSubDefinition visibility.
	self addAttributeEndToken: aSubDefinition endToken. 

	^ self visitProgram: aSubDefinition
]

{ #category : #generated }
AlceTextComposer >> visitTypedThing: aTypedThing [
	self addAttributeAs: aTypedThing aSToken  .
	self assert: aTypedThing timesToken isNil.
	self assert: aTypedThing fixedSize isNil.
	^ self visitProgram: aTypedThing
]

{ #category : #generated }
AlceTextComposer >> visitUntilTrue: anUntilTrue [

self halt.
	

	^ self visitProgram: anUntilTrue
]

{ #category : #generated }
AlceTextComposer >> visitVariable: aVariable [

	^ self visitProgram: aVariable
]

{ #category : #generated }
AlceTextComposer >> visitVariableList: aVariableList [

self halt.
	

	^ self visitProgram: aVariableList
]

{ #category : #generated }
AlceTextComposer >> visitWhileTrue: aWhileTrue [

self halt.

	
	^ self visitProgram: aWhileTrue
]

{ #category : #generated }
AlceTextComposer >> visitWhileWend: aWhileWend [
	self addAttributeKeyword:	aWhileWend wendToken .
	self addAttributeKeyword: aWhileWend whileToken .
	
	^ self visitProgram: aWhileWend
]

{ #category : #generated }
AlceTextComposer >> visitWith: aWith [

	aWith withTokens do: [ :r | self addAttributeWith: r ].
	self addAttributeEndToken: aWith endToken.


	^ self visitProgram: aWith
]
