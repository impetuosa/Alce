Class {
	#name : #AlcixLiteral,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#value => FMProperty',
		'#kind => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixLiteral class >> annotation [

	<FMClass: #Literal super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixLiteral >> accept: aVisitor [
	^ aVisitor visitLiteral: self

]

{ #category : #accessing }
AlcixLiteral >> arguments [

	^ {  }
]

{ #category : #accessing }
AlcixLiteral >> candidates [
	^ { self  }
]

{ #category : #accessing }
AlcixLiteral >> kind [

	<FMProperty: #kind type: #String>
	<generated>
	^ kind
]

{ #category : #accessing }
AlcixLiteral >> kind: anObject [
	<generated>
	kind := anObject
]

{ #category : #accessing }
AlcixLiteral >> name [

	^ 'Lit(' , value asString , ')'
]

{ #category : #accessing }
AlcixLiteral >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : #accessing }
AlcixLiteral >> value: anObject [
	<generated>
	value := anObject
]
