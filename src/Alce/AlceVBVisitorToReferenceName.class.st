Class {
	#name : #AlceVBVisitorToReferenceName,
	#superclass : #Object,
	#category : #'Alce-Importer-Jindao'
}

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> toReferenceName: aNode [
	| refChain |
	refChain := aNode acceptVisitor: self.
	^ refChain
		ifNil: [ AlcixReferenceName noneAttribute ]
		ifNotNil: [ AlcixReferenceName new
				names: (aNode acceptVisitor: self);
				yourself ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitAsTypeAndNew: aVBAsTypeAndNewNode [ 
	^ aVBAsTypeAndNewNode type acceptVisitor: self 
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
AlceVBVisitorToReferenceName >> visitMemberAccess: aVBMemberAccessNode [
	| receiver |
	receiver := aVBMemberAccessNode receiver
		ifNil: [ aVBMemberAccessNode enclosingWith with acceptVisitor: self ]
		ifNotNil: [ aVBMemberAccessNode receiver acceptVisitor: self ].
	^ {receiver} ,( aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitNull: aVBNullNode [
	^ {#Nothing}
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
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
AlceVBVisitorToReferenceName >> visitTypeSize: aVBTypeSizeNode [ 
	aVBTypeSizeNode parent paramarrayToken ifNotNil: [ ^ { 'ParamArray' } ].
	self error: 'Should do something else.'
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToReferenceName >> visitTypedThing: aVBTypedThingNode [
	^ aVBTypedThingNode type acceptVisitor: self
]
