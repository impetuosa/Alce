Class {
	#name : #AlceVBVisitorToString,
	#superclass : #Object,
	#category : #'Alce-Importer-Jindao'
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

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitComplexType: aVBComplexTypeNode [
	| str |
	str := aVBComplexTypeNode base acceptVisitor: self.
	^ aVBComplexTypeNode members
		inject: str
		into: [ :acc :each | acc , (each acceptVisitor: self) ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitDictionaryAccess: aVBDictionaryAccessNode [ 
	^ aVBDictionaryAccessNode source 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitMemberAccess: aVBMemberAccessNode [
	| str |
	str := aVBMemberAccessNode receiver
		ifNil: [ '' ]
		ifNotNil: [ :a | a acceptVisitor: self ].
	^ str , '.' , (aVBMemberAccessNode member acceptVisitor: self)
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitProcedureCallOrArrayAccess: aVBProcedureCallOrArrayAccessNode [
	^ (aVBProcedureCallOrArrayAccessNode selector acceptVisitor: self)
		, ' ('
		, (aVBProcedureCallOrArrayAccessNode arguments acceptVisitor: self)
		, ')'
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
