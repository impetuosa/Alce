Class {
	#name : #AlcixTableField,
	#superclass : #AlcixAttribute,
	#instVars : [
		'#size => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTableField class >> annotation [

	<FMClass: #TableField super: #AlcixAttribute>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixTableField >> accept: aVisitor [
	^ aVisitor visitTableField: self

]

{ #category : #visiting }
AlcixTableField >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessTableField: self

]

{ #category : #accessing }
AlcixTableField >> size [

	<FMProperty: #size type: #Number>
	<generated>
	^ size
]

{ #category : #accessing }
AlcixTableField >> size: anObject [
	<generated>
	size := anObject
]
