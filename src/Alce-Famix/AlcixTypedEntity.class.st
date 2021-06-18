Class {
	#name : #AlcixTypedEntity,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTypedEntity class >> annotation [

	<FMClass: #TypedEntity super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixTypedEntity >> accept: aVisitor [
	^ aVisitor visitTypedEntity: self

]

{ #category : #accessing }
AlcixTypedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixTypedEntity >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixTypedEntity >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '('.

	typeName printOn: aStream.

	type
		ifNil: [ aStream nextPutAll: '(notsolved)' ]
		ifNotNil: [ aStream nextPutAll: '(solved)' ].
	aStream nextPutAll: ' '.
	aStream
		nextPutAll: name;
		nextPutAll: ')'
]
