Class {
	#name : #AlcixAccessWrite,
	#superclass : #AlcixAccess,
	#instVars : [
		'#leftElementName => FMProperty',
		'#leftElement => FMOne type: #AlcixAccessible opposite: #writingAccesses'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessWrite class >> annotation [

	<FMClass: #AccessWrite super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessWrite >> accept: aVisitor [
	^ aVisitor visitAccessWrite: self

]

{ #category : #accessing }
AlcixAccessWrite >> leftElement [
	"Relation named: #leftElement type: #AlcixAccessible opposite: #writingAccesses"

	<generated>
	^ leftElement
]

{ #category : #accessing }
AlcixAccessWrite >> leftElement: anObject [

	<generated>
	leftElement := anObject
]

{ #category : #accessing }
AlcixAccessWrite >> leftElementName [

	<FMProperty: #leftElementName type: #AlcixReferenceName>
	<generated>
	^ leftElementName
]

{ #category : #accessing }
AlcixAccessWrite >> leftElementName: anObject [
	<generated>
	leftElementName := anObject
]
