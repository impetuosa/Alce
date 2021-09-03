Class {
	#name : #AlcixConstant,
	#superclass : #AlcixWithAccesses,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
	#instVars : [
		'#name => FMProperty',
		'#owner => FMOne type: #AlcixTWithConstants opposite: #constants',
		'#value => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixConstant class >> annotation [

	<FMClass: #Constant super: #AlcixWithAccesses>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixConstant >> accept: aVisitor [
	^ aVisitor visitConstant: self

]

{ #category : #accessing }
AlcixConstant >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixConstant >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixConstant >> owner [
	"Relation named: #owner type: #AlcixTWithConstants opposite: #constants"

	<generated>
	<container>
	^ owner
]

{ #category : #accessing }
AlcixConstant >> owner: anObject [

	<generated>
	owner := anObject
]

{ #category : #navigation }
AlcixConstant >> ownerGroup [
	<generated>
	<navigation: 'Owner'>
	^ MooseSpecializedGroup with: self owner
]

{ #category : #accessing }
AlcixConstant >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : #accessing }
AlcixConstant >> value: anObject [
	<generated>
	value := anObject
]
