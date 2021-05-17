Class {
	#name : #AlcixAccessible,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#access => FMMany type: #AlcixAccess opposite: #attribute'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessible class >> annotation [

	<FMClass: #Accessible super: #AlcixAccessEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessible >> accept: aVisitor [
	^ aVisitor visitAccessible: self

]

{ #category : #accessing }
AlcixAccessible >> access [
	"Relation named: #access type: #AlcixAccess opposite: #attribute"

	<generated>
	<derived>
	^ access
]

{ #category : #accessing }
AlcixAccessible >> access: anObject [

	<generated>
	access value: anObject
]

{ #category : #adding }
AlcixAccessible >> addAccess: anObject [
	<generated>
	^ self access add: anObject
]
