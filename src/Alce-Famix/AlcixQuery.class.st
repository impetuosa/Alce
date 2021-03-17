Class {
	#name : #AlcixQuery,
	#superclass : #AlcixDataSource,
	#instVars : [
		'#tables => FMMany type: #AlcixTable opposite: #query'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixQuery class >> annotation [

	<FMClass: #Query super: #AlcixDataSource>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixQuery >> addTable: anObject [
	<generated>
	^ self tables add: anObject
]

{ #category : #accessing }
AlcixQuery >> tables [
	"Relation named: #tables type: #AlcixTable opposite: #query"

	<generated>
	<derived>
	^ tables
]

{ #category : #accessing }
AlcixQuery >> tables: anObject [

	<generated>
	tables value: anObject
]

{ #category : #navigation }
AlcixQuery >> tablesGroup [
	<generated>
	<navigation: 'Tables'>
	^ MooseSpecializedGroup withAll: self tables asSet
]
