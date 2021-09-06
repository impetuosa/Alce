Class {
	#name : #AlcixModel,
	#superclass : #MooseModel,
	#traits : 'TAlceModel',
	#classTraits : 'TAlceModel classTrait',
	#category : #Alce
}

{ #category : #meta }
AlcixModel class >> annotation [
	<FMClass: #AlcixModel super: #MooseModel>
	<package: #'Alce-Famix'>
	<generated>
]

{ #category : #accessing }
AlcixModel class >> entryName [
	^ #Model
]

{ #category : #'instance creation' }
AlcixModel >> instantiate: aClass [

	| element |
	element := aClass new.
	self add: element.
	^ element
]
