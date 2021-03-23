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
AlceVBVisitorToString >> visitComplexType: aVBComplexTypeNode [
	| str |
	str := aVBComplexTypeNode base acceptVisitor: self.
	^ aVBComplexTypeNode members
		inject: str
		into: [ :acc :each | acc , (each acceptVisitor: self) ]
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitSimpleIdentifier: aVBSimpleIdentifierNode [ 
	^ aVBSimpleIdentifierNode token value 
]

{ #category : #'as yet unclassified' }
AlceVBVisitorToString >> visitSmaccToken: aSmaCCCaseInsensitiveToken [ 
	^ aSmaCCCaseInsensitiveToken value 
]
