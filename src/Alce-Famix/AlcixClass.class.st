Class {
	#name : #AlcixClass,
	#superclass : #AlcixModule,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixClass class >> annotation [

	<FMClass: #Class super: #AlcixModule>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixClass >> accept: aVisitor [
	^ aVisitor visitClass: self

]

{ #category : #visiting }
AlcixClass >> isAlcixClass [
	^ true
]

{ #category : #visiting }
AlcixClass >> me [

	^ self typeds detect: [ :t | t name = #Me ]
]
