Class {
	#name : #AlceVBVisitorToReferenceName,
	#superclass : #Object,
	#instVars : [
		'processedElement'
	],
	#classInstVars : [
		'noneAttribute'
	],
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName class >> noneAttribute [
	^ noneAttribute ifNil: [ noneAttribute := AlcixReferenceName new ]
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
AlceVBVisitorToReferenceName >> toReferenceName: aNode [
	| refChain |
	processedElement := false. 
	refChain := aNode acceptVisitor: self.
	^ refChain
		ifNil: [ self noneAttribute  ]
		ifNotNil: [ AlcixReferenceName new
				names: (aNode acceptVisitor: self);
				processedElement: processedElement;
				yourself ]
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
AlceVBVisitorToReferenceName >> visitBooleanLiteral: aVBBooleanLiteralNode [
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

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitDictionaryAccess: aVBDictionaryAccessNode [
	^ self visitMemberAccess: aVBDictionaryAccessNode
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitEquals: aVBEqualsNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitIntegerLiteral: aVBIntegerLiteralNode [ 
	^ nil
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitMemberAccess: aVBMemberAccessNode [
	| receiver |
	receiver := aVBMemberAccessNode receiver
		ifNil: [ aVBMemberAccessNode enclosingWith with acceptVisitor: self ]
		ifNotNil: [ aVBMemberAccessNode receiver acceptVisitor: self ].
	^ {receiver} ,( aVBMemberAccessNode member acceptVisitor: self)
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

{ #category : #'*Alce' }
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
AlceVBVisitorToReferenceName >> visitTypeSize: aVBTypeSizeNode [ 
	aVBTypeSizeNode parent paramarrayToken ifNotNil: [ ^ { 'ParamArray' } ].
	self error: 'Should do something else.'
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitTypedThing: aVBTypedThingNode [
	^ aVBTypedThingNode type acceptVisitor: self
]
