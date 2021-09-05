Class {
	#name : #AlcixArgument,
	#superclass : #AlcixWithAccesses,
	#instVars : [
		'#value => FMProperty',
		'#activation => FMOne type: #AlcixAccess opposite: #arguments'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixArgument class >> annotation [

	<FMClass: #Argument super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixArgument >> accept: aVisitor [
	^ aVisitor visitArgument: self

]

{ #category : #accessing }
AlcixArgument >> activation [
	"Relation named: #activation type: #AlcixAccess opposite: #arguments"

	<generated>
	<container>
	^ activation
]

{ #category : #accessing }
AlcixArgument >> activation: anObject [

	<generated>
	activation := anObject
]

{ #category : #navigation }
AlcixArgument >> activationGroup [
	<generated>
	<navigation: 'Activation'>
	^ MooseSpecializedGroup with: self activation
]

{ #category : #accessing }
AlcixArgument >> names [

	^ 'Arg(' , value asString , ') '
]

{ #category : #accessing }
AlcixArgument >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : #accessing }
AlcixArgument >> value: anObject [
	<generated>
	value := anObject
]
