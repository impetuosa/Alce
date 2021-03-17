Class {
	#name : #AlcixDataSource,
	#superclass : #AlcixContainerType,
	#instVars : [
		'#fields => FMMany type: #AlcixField opposite: #dataSource'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixDataSource class >> annotation [

	<FMClass: #DataSource super: #AlcixContainerType>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixDataSource >> addField: anObject [
	<generated>
	^ self fields add: anObject
]

{ #category : #accessing }
AlcixDataSource >> fields [
	"Relation named: #fields type: #AlcixField opposite: #dataSource"

	<generated>
	<derived>
	^ fields
]

{ #category : #accessing }
AlcixDataSource >> fields: anObject [

	<generated>
	fields value: anObject
]

{ #category : #navigation }
AlcixDataSource >> fieldsGroup [
	<generated>
	<navigation: 'Fields'>
	^ MooseSpecializedGroup withAll: self fields asSet
]
