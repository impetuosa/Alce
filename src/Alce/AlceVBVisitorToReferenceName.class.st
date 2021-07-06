Class {
	#name : #AlceVBVisitorToReferenceName,
	#superclass : #Object,
	#instVars : [
		'processedElement',
		'importer'
	],
	#classInstVars : [
		'noneAttribute'
	],
	#category : #'Alce-Importer-Helper'
}

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName class >> noneAttribute [
	^ noneAttribute ifNil: [ noneAttribute := AlcixVariableReference new ]
]

{ #category : #accce }
AlceVBVisitorToReferenceName >> importer: anAlceLibraryReferenceImporter [ 
	importer := anAlceLibraryReferenceImporter
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> noneAttribute [
	^ self class noneAttribute 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> noteProcessedElement [
	processedElement := true .
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> toInvocableReferenceName: aNode [

	| refChain |
	processedElement := false.
	refChain := aNode acceptVisitor: self.
	^ refChain ifNil: [ self error: 'Unexpected ' ] ifNotNil: [ 
		  (importer instantiate: AlcixInvocableReference)
			  names: (aNode acceptVisitor: self);
			  isProcessedElement: processedElement;
			  yourself ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> toTypeReferenceName: aNode [
	| refChain |
	processedElement := false. 
	refChain := aNode acceptVisitor: self.
	^ refChain
		ifNil: [ self error: 'Unexpected ' . "self undefinedTypeReference "  ]
		ifNotNil: [ 
			 (importer instantiate: AlcixTypeReference)
				names: (aNode acceptVisitor: self);
				isProcessedElement: processedElement;
				yourself ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> toVariableReferenceName: aNode [

	| refChain |
	processedElement := false.
	refChain := aNode acceptVisitor: self.
	^ refChain ifNil: [ self noneAttribute ] ifNotNil: [ 
		  (importer instantiate: AlcixVariableReference)
			  names: (aNode acceptVisitor: self);
			  isProcessedElement: processedElement;
			  yourself ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> undefinedTypeReference [
	^ AlcixTypeReference new
		names: {#Undefined};
		isProcessedElement: false;
		yourself
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitArithmeticOperation: aVBArithmeticOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitAsTypeAndNew: aVBAsTypeAndNewNode [ 
	^ aVBAsTypeAndNewNode type acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitBaseType: aVBBaseTypeNode [
	aVBBaseTypeNode variantToken ifNil: [ self error: ' ' ].
	^ aVBBaseTypeNode variantToken acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitBooleanLiteral: aVBBooleanLiteralNode [
	^ nil
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitColorLiteral: aVBColorLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitComparisonOperation: aVBComparisonOperationNode [
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitComplexType: aVBComplexTypeNode [
	^ (aVBComplexTypeNode base acceptVisitor: self)
		,
			(aVBComplexTypeNode members
				flatCollect: [ :m | m acceptVisitor: self ])
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitConcatenationOperation: aVBConcatenationOperationNode [ 
	^ nil
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitDateLiteral: aVBDateLiteralNode [

	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitDictionaryAccess: aVBDictionaryAccessNode [
	^ self visitMemberAccess: aVBDictionaryAccessNode
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitEquals: aVBEqualsNode [ 
	^ nil
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitFloatLiteral: aVBFloatLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ nil
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitLibraryMethod: aJinLibraryMethod [

	^ { aJinLibraryMethod returnTypeName }
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitMemberAccess: aVBMemberAccessNode [
	| receiver |
	receiver := aVBMemberAccessNode receiver
		ifNil: [ aVBMemberAccessNode enclosingWith with acceptVisitor: self ]
		ifNotNil: [ aVBMemberAccessNode receiver acceptVisitor: self ].
	^ (receiver ifNil: [ {} ])
		, (aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitNegatedOperation: aVBNegatedOperationNode [

	self noteProcessedElement.
	^ aVBNegatedOperationNode value acceptVisitor: self
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitNewClause: aVBNewClauseNode [

	^ aVBNewClauseNode typeName acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitNotOperation: aVBNotOperationNode [
	self noteProcessedElement.
	^ aVBNotOperationNode value acceptVisitor: self
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitNull: aVBNullNode [
	^ {#Nothing}
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitParentheseesExpression: aVBParentheseesExpressionNode [ 
	^ aVBParentheseesExpressionNode expression acceptVisitor: self 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
	self noteProcessedElement.
	aVBProcedureCallOrArrayAccessNode arguments arguments size = 1
		ifTrue: [ aVBProcedureCallOrArrayAccessNode arguments arguments first value
				acceptVisitor: self ].
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitSimpleIdentifier: aVBSimpleIdentifierNode [
	^ {aVBSimpleIdentifierNode token value}
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitSmaccToken: aSmaCCCaseInsensitiveToken [
	^ {aSmaCCCaseInsensitiveToken value asSymbol}
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitSquareBracketIdentifier: aVBSquareBracketIdentifierNode [
	| str |
	"Square brackets identifiers are used in vb for using whitespaces in a name. In our context we dont care about the first nor the last symbol  "
	str := aVBSquareBracketIdentifierNode token value.
	^ {(str copyFrom: 2 to: str size - 1)}
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitStringLiteral: aVBStringLiteralNode [ 
	^ nil
]

{ #category : #visiting }
AlceVBVisitorToReferenceName >> visitTypeOf: aVBTypeOfNode [ 

	^ nil.
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitTypeSize: aVBTypeSizeNode [ 
	aVBTypeSizeNode parent paramarrayToken ifNotNil: [ ^ { 'ParamArray' } ].
	self error: 'Should do something else.'
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitTypedThing: aVBTypedThingNode [
	^ aVBTypedThingNode type acceptVisitor: self
]
