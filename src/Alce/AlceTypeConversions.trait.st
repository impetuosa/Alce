Trait {
	#name : #AlceTypeConversions,
	#instVars : [
		'stringConverter',
		'referenceNameConverter'
	],
	#category : #'Alce-Importer'
}

{ #category : #'as yet unclassified' }
AlceTypeConversions >> nodeToInvocableReferenceName: aVBNode [
	^ self referenceNameConverter toInvocableReferenceName: aVBNode
]

{ #category : #helper }
AlceTypeConversions >> nodeToString: aNode [
	| str |
	str := self stringConverter toString: aNode.
	^ str
]

{ #category : #'as yet unclassified' }
AlceTypeConversions >> nodeToTypeReferenceName: aVBNode [
	^ self referenceNameConverter toTypeReferenceName: aVBNode
]

{ #category : #'as yet unclassified' }
AlceTypeConversions >> nodeToVariableReferenceName: aVBNode [
	^ self referenceNameConverter toVariableReferenceName: aVBNode
]

{ #category : #'as yet unclassified' }
AlceTypeConversions >> referenceNameConverter [

	^ referenceNameConverter ifNil: [ 
		  referenceNameConverter := AlceVBVisitorToReferenceName new
			                            importer: self;
			                            yourself ]
]

{ #category : #helper }
AlceTypeConversions >> stringConverter [

	^ stringConverter
		ifNil: [ stringConverter := AlceVBVisitorToString new ]
]

{ #category : #'functions - subs - events' }
AlceTypeConversions >> typeName: aTypeOrNil [
	^ aTypeOrNil
		ifNil: [self referenceNameConverter undefinedTypeReference ]
		ifNotNil: [ self nodeToTypeReferenceName: aTypeOrNil ]
]

{ #category : #'as yet unclassified' }
AlceTypeConversions >> typeNameReference: aString [
	self assert: (aString indexOf: $.) = 0.
	^ (self instantiate: AlcixTypeReference)
		names: {aString};
		yourself
]

{ #category : #'as yet unclassified' }
AlceTypeConversions >> undefinedTypeReference [
	^ self referenceNameConverter undefinedTypeReference
]
