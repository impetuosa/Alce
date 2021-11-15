Class {
	#name : #AlcixReport,
	#superclass : #AlcixClass,
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixReport class >> annotation [

	<FMClass: #Report super: #AlcixClass>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixReport >> accept: aVisitor [
	^ aVisitor visitReport: self

]

{ #category : #visiting }
AlcixReport >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessReport: self

]

{ #category : #visiting }
AlcixReport >> initializers [

	^ self invocables select: [ :i | 
		  i selector = '__INITIALIZE_WIDGET_FROM_UI_CONFIGURATION' ]
]
