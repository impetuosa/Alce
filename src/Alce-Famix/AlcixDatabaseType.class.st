Class {
	#name : #AlcixDatabaseType,
	#superclass : #AlcixEntity,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#instVars : [
		'#databaseTypedEntity => FMOne type: #AlcixDatabaseTypedEntity opposite: #databaseType'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixDatabaseType class >> annotation [

	<FMClass: #DatabaseType super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixDatabaseType >> databaseTypedEntity [
	"Relation named: #databaseTypedEntity type: #AlcixDatabaseTypedEntity opposite: #databaseType"

	<generated>
	<derived>
	^ databaseTypedEntity
]

{ #category : #accessing }
AlcixDatabaseType >> databaseTypedEntity: anObject [

	<generated>
	databaseTypedEntity := anObject
]