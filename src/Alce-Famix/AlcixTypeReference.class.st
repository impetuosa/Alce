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
