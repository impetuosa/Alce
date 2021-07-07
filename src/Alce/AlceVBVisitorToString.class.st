Class {
	#name : #AlceVBVisitorToString,
	#superclass : #Object,
	#category : #'Alce-Importer-Helper'
}

{ #category : #'instance creation' }
AlceVBVisitorToString >> toString: aNode [
	^ aNode acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitArgument: aVBArgumentNode [
	^ aVBArgumentNode source
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitArgumentList: aVBArgumentListNode [
	^ ','
		join: (aVBArgumentListNode arguments collect: [ :a | a acceptVisitor: self ])
]

{ #category : #visiting }
AlceVBVisitorToString >> visitArithmeticOperation: aVBArithmeticOperationNode [

	^ aVBArithmeticOperationNode source
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitBaseType: aVBBaseTypeNode [
	^ aVBBaseTypeNode variantToken acceptVisitor: self
]

{ #category : #visiting }
AlceVBVisitorToString >> visitBooleanLiteral: aVBBooleanLiteralNode [ 
	^ aVBBooleanLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitColorLiteral: aVBColorLiteralNode [ 
	^ aVBColorLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitComparisonOperation: aVBComparisonOperationNode [ 
	^ aVBComparisonOperationNode source 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitComplexType: aVBComplexTypeNode [
	| str |
	str := aVBComplexTypeNode base acceptVisitor: self.
	^ aVBComplexTypeNode members
		inject: str
		into: [ :acc :each | acc , (each acceptVisitor: self) ]
]

{ #category : #visiting }
AlceVBVisitorToString >> visitConcatenationOperation: aVBConcatenationOperationNode [ 
	^ ''
]

{ #category : #visiting }
AlceVBVisitorToString >> visitDateLiteral: aVBDateLiteralNode [

	^ aVBDateLiteralNode token acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitDictionaryAccess: aVBDictionaryAccessNode [ 
	^ aVBDictionaryAccessNode source 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitEquals: aVBEqualsNode [ 
	^ aVBEqualsNode source 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitFloatLiteral: aVBFloatLiteralNode [ 
	^ aVBFloatLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ aVBIntegerLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitInterval: aVBIntervalNode [

	^ aVBIntervalNode source
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitMemberAccess: aVBMemberAccessNode [
	| str |
	str := aVBMemberAccessNode receiver
		ifNil: [ '' ]
		ifNotNil: [ :a | a acceptVisitor: self ].
	^ str , '.' , (aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #visiting }
AlceVBVisitorToString >> visitNegatedOperation: aVBNegatedOperationNode [ 
	^ '-' , (aVBNegatedOperationNode value acceptVisitor: self )
]

{ #category : #visiting }
AlceVBVisitorToString >> visitNewClause: aVBNewClauseNode [

	^ aVBNewClauseNode source
]

{ #category : #visiting }
AlceVBVisitorToString >> visitNotOperation: aVBNotOperationNode [

	^ aVBNotOperationNode source
]

{ #category : #visiting }
AlceVBVisitorToString >> visitNull: aVBNullNode [

	^ aVBNullNode token acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitParameter: aVBParameterNode [
	aVBParameterNode type ifNil: [ ^ 'Undefined' ].
	aVBParameterNode paramarrayToken
		ifNil: [ ^ aVBParameterNode type acceptVisitor: self ].
	^ 'ParamArray' , (aVBParameterNode type acceptVisitor: self)
]

{ #category : #visiting }
AlceVBVisitorToString >> visitParentheseesExpression: aVBParentheseesExpressionNode [

	^ aVBParentheseesExpressionNode source
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
		
	^
	aVBProcedureCallOrArrayAccessNode source
	" (aVBProcedureCallOrArrayAccessNode selector ifNotNil:  acceptVisitor: self)
		, ' ('
		, (aVBProcedureCallOrArrayAccessNode arguments acceptVisitor: self)
		, ')'"
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitSimpleIdentifier: aVBSimpleIdentifierNode [ 
	^ aVBSimpleIdentifierNode token value 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitSmaccToken: aSmaCCCaseInsensitiveToken [ 
	^ aSmaCCCaseInsensitiveToken value 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitSquareBracketIdentifier: aVBSquareBracketIdentifierNode [
	| str |
	str := aVBSquareBracketIdentifierNode token value.
	^ str copyFrom: 2 to: str size - 1
]

{ #category : #visiting }
AlceVBVisitorToString >> visitStringLiteral: aVBStringLiteralNode [ 
	^ aVBStringLiteralNode token acceptVisitor: self 
]

{ #category : #visiting }
AlceVBVisitorToString >> visitTypeOf: aVBTypeOfNode [
	^ 'Must Implement visitTypeOf '
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitTypeSize: aVBTypeSizeNode [ 

	^ '({1})' format: { ',' join: (aVBTypeSizeNode sizes collect: [  :s  | s acceptVisitor: self ]) }
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitTypedThing: aVBTypedThingNode [

	^ (aVBTypedThingNode type acceptVisitor: self) , ('' join:
		   (aVBTypedThingNode sizes collect: [ :s | s acceptVisitor: self ]))
]
