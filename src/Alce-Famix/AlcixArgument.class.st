Class {
	#name : #AlcixArgument,
	#superclass : #AlcixWithAccesses,
	#instVars : [
		'#value => FMProperty',
		'#access => FMOne type: #AlcixAccess opposite: #arguments'
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
AlcixArgument >> access [
	"Relation named: #access type: #AlcixAccess opposite: #arguments"

	<generated>
	<container>
	^ access
]

{ #category : #accessing }
AlcixArgument >> access: anObject [

	<generated>
	access := anObject
]

{ #category : #navigation }
AlcixArgument >> accessGroup [
	<generated>
	<navigation: 'Access'>
	^ MooseSpecializedGroup with: self access
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
