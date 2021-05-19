Class {
	#name : #AlcixDatabaseTypedEntity,
	#superclass : #AlcixTypedEntity,
	#instVars : [
		'#databaseType => FMOne type: #AlcixDatabaseType opposite: #databaseTypedEntity'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixDatabaseTypedEntity class >> annotation [

	<FMClass: #DatabaseTypedEntity super: #AlcixTypedEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixDatabaseTypedEntity >> accept: aVisitor [
	^ aVisitor visitDatabaseTypedEntity: self

]

{ #category : #accessing }
AlcixDatabaseTypedEntity >> databaseType [
	"Relation named: #databaseType type: #AlcixDatabaseType opposite: #databaseTypedEntity"

	<generated>
	^ databaseType
]

{ #category : #accessing }
AlcixDatabaseTypedEntity >> databaseType: anObject [

	<generated>
	databaseType := anObject
]
