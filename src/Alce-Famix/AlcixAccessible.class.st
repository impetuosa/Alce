Class {
	#name : #AlcixAccessible,
	#superclass : #AlcixAccessEntity,
	#instVars : [
		'#readingAccesses => FMMany type: #AlcixAccess opposite: #rightElement',
		'#writingAccesses => FMMany type: #AlcixAccessWrite opposite: #leftElement'
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

{ #category : #adding }
AlcixAccessible >> addReadingAccess: anObject [
	<generated>
	^ self readingAccesses add: anObject
]

{ #category : #adding }
AlcixAccessible >> addWritingAccess: anObject [
	<generated>
	^ self writingAccesses add: anObject
]

{ #category : #accessing }
AlcixAccessible >> readingAccesses [
	"Relation named: #readingAccesses type: #AlcixAccess opposite: #rightElement"

	<generated>
	<derived>
	^ readingAccesses
]

{ #category : #accessing }
AlcixAccessible >> readingAccesses: anObject [

	<generated>
	readingAccesses value: anObject
]

{ #category : #accessing }
AlcixAccessible >> writingAccesses [
	"Relation named: #writingAccesses type: #AlcixAccessWrite opposite: #leftElement"

	<generated>
	<derived>
	^ writingAccesses
]

{ #category : #accessing }
AlcixAccessible >> writingAccesses: anObject [

	<generated>
	writingAccesses value: anObject
]
