Class {
	#name : #AlcixForm,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixForm class >> annotation [

	<FMClass: #Form super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixForm >> accept: aVisitor [
	^ aVisitor visitForm: self

]

{ #category : #visiting }
AlcixForm >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessForm: self

]

{ #category : #visiting }
AlcixForm >> initializers [

	^ self invocables select: [ :i | 
		  i selector = '__INITIALIZE_WIDGET_FROM_UI_CONFIGURATION' ]
]
