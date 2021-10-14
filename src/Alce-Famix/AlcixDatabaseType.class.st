Class {
	#name : #AlcixDatabaseType,
	#superclass : #AlcixPrimitiveType,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixDatabaseType class >> annotation [

	<FMClass: #DatabaseType super: #AlcixPrimitiveType>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixDatabaseType >> accept: aVisitor [
	^ aVisitor visitDatabaseType: self

]
