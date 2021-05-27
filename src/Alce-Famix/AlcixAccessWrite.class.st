Class {
	#name : #AlcixAccessWrite,
	#superclass : #AlcixAccess,
	#instVars : [
		'#leftElement => FMOne type: #AlcixAccessible opposite: #writingAccesses',
		'#leftElementName => FMOne type: #AlcixVariableReference opposite: #accessWrite'
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
	"Relation named: #leftElementName type: #AlcixVariableReference opposite: #accessWrite"

	<generated>
	^ leftElementName
]

{ #category : #accessing }
AlcixAccessWrite >> leftElementName: anObject [

	<generated>
	leftElementName := anObject
]
