Class {
	#name : #AlcixClass,
	#superclass : #AlcixModule,
	#instVars : [
		'#subclass => FMMany type: #AlcixClass opposite: #superclass',
		'#superclass => FMOne type: #AlcixClass opposite: #subclass'
	],
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
AlcixClass >> acceptLanguageVisitor: aVisitor [
	^ aVisitor visitMicrosoftAccessClass: self

]

{ #category : #adding }
AlcixClass >> addSubclass: anObject [
	<generated>
	^ self subclass add: anObject
]

{ #category : #accessing }
AlcixClass >> subclass [
	"Relation named: #subclass type: #AlcixClass opposite: #superclass"

	<generated>
	<derived>
	^ subclass
]

{ #category : #accessing }
AlcixClass >> subclass: anObject [

	<generated>
	subclass value: anObject
]

{ #category : #navigation }
AlcixClass >> subclassGroup [
	<generated>
	<navigation: 'Subclass'>
	^ MooseSpecializedGroup withAll: self subclass asSet
]

{ #category : #accessing }
AlcixClass >> superclass [
	"Relation named: #superclass type: #AlcixClass opposite: #subclass"

	<generated>
	<container>
	^ superclass
]

{ #category : #accessing }
AlcixClass >> superclass: anObject [

	<generated>
	superclass := anObject
]

{ #category : #navigation }
AlcixClass >> superclassGroup [
	<generated>
	<navigation: 'Superclass'>
	^ MooseSpecializedGroup with: self superclass
]
