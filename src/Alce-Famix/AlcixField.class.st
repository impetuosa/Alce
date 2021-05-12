Class {
	#name : #AlcixField,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#dataSource => FMOne type: #AlcixDataSource opposite: #fields'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixField class >> annotation [

	<FMClass: #Field super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixField >> accept: aVisitor [
	^ aVisitor visitField: self

]

{ #category : #accessing }
AlcixField >> dataSource [
	"Relation named: #dataSource type: #AlcixDataSource opposite: #fields"

	<generated>
	<container>
	^ dataSource
]

{ #category : #accessing }
AlcixField >> dataSource: anObject [

	<generated>
	dataSource := anObject
]

{ #category : #navigation }
AlcixField >> dataSourceGroup [
	<generated>
	<navigation: 'DataSource'>
	^ MooseSpecializedGroup with: self dataSource
]
