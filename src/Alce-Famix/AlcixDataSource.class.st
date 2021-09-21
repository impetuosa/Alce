Class {
	#name : #AlcixDataSource,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixDataSource class >> annotation [

	<FMClass: #DataSource super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixDataSource >> accept: aVisitor [
	^ aVisitor visitDataSource: self

]

{ #category : #visiting }
AlcixDataSource >> ast [

	^ ast
]

{ #category : #visiting }
AlcixDataSource >> stringContent [

	^ nil
]
