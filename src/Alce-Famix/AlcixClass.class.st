Class {
	#name : #AlcixClass,
	#superclass : #AlcixModule,
	#instVars : [
		'#superclass => FMMany type: #AlcixClass opposite: #subclass',
		'#subclass => FMOne type: #AlcixClass opposite: #superclass'
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

{ #category : #adding }
AlcixClass >> addSuperclass: anObject [
	<generated>
	^ self superclass add: anObject
]

{ #category : #accessing }
AlcixClass >> subclass [
	"Relation named: #subclass type: #AlcixClass opposite: #superclass"

	<generated>
	<container>
	^ subclass
]

{ #category : #accessing }
AlcixClass >> subclass: anObject [

	<generated>
	subclass := anObject
]

{ #category : #navigation }
AlcixClass >> subclassGroup [
	<generated>
	<navigation: 'Subclass'>
	^ MooseSpecializedGroup with: self subclass
]

{ #category : #accessing }
AlcixClass >> superclass [
	"Relation named: #superclass type: #AlcixClass opposite: #subclass"

	<generated>
	<derived>
	^ superclass
]

{ #category : #accessing }
AlcixClass >> superclass: anObject [

	<generated>
	superclass value: anObject
]

{ #category : #navigation }
AlcixClass >> superclassGroup [
	<generated>
	<navigation: 'Superclass'>
	^ MooseSpecializedGroup withAll: self superclass asSet
]
