Class {
	#name : #AlcixTable,
	#superclass : #AlcixDataSource,
	#instVars : [
		'#query => FMOne type: #AlcixQuery opposite: #tables'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixTable class >> annotation [

	<FMClass: #Table super: #AlcixDataSource>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixTable >> query [
	"Relation named: #query type: #AlcixQuery opposite: #tables"

	<generated>
	<container>
	^ query
]

{ #category : #accessing }
AlcixTable >> query: anObject [

	<generated>
	query := anObject
]

{ #category : #navigation }
AlcixTable >> queryGroup [
	<generated>
	<navigation: 'Query'>
	^ MooseSpecializedGroup with: self query
]
