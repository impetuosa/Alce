Class {
	#name : #AlcixTypeReference,
	#superclass : #AlcixReferenceName,
	#instVars : [
		'#typed => FMOne type: #AlcixTTyped opposite: #typeName'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTypeReference class >> annotation [

	<FMClass: #TypeReference super: #AlcixReferenceName>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixTypeReference >> accept: aVisitor [
	^ aVisitor visitTypeReference: self

]

{ #category : #'as yet unclassified' }
AlcixTypeReference >> refersToFormNamed: aString [
"	self assert: names size = 1."
	(names last beginsWith: 'Form_')
		ifFalse: [ ^ false ].
	^ ((names last copyFrom: 'Form_' size + 1 to: names last size)
		compare: aString
		caseSensitive: false) = 2
]

{ #category : #'as yet unclassified' }
AlcixTypeReference >> stringName [
	^ '.' join: names
]

{ #category : #accessing }
AlcixTypeReference >> typed [
	"Relation named: #typed type: #AlcixTTyped opposite: #typeName"

	<generated>
	<derived>
	^ typed
]

{ #category : #accessing }
AlcixTypeReference >> typed: anObject [

	<generated>
	typed := anObject
]
