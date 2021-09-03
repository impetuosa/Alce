Class {
	#name : #AlcixModel,
	#superclass : #MooseModel,
	#category : #Alce
}

{ #category : #meta }
AlcixModel class >> annotation [
	<FMClass: #AlcixModel super: #MooseModel>
	<package: #'Alce-Famix'>
	<generated>
]

{ #category : #'instance creation' }
AlcixModel >> instantiate: aClass [

	| element |
	element := aClass new.
	self add: element.
	^ element
]
