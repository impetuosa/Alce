Class {
	#name : #AlcixFunction,
	#superclass : #AlcixInvocable,
	#traits : 'AlcixTTyped - {#color}',
	#classTraits : 'AlcixTTyped classTrait',
	#instVars : [
		'#typeAnchor => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixFunction class >> annotation [

	<FMClass: #Function super: #AlcixInvocable>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixFunction >> accept: aVisitor [
	^ aVisitor visitFunction: self

]

{ #category : #accessing }
AlcixFunction >> typeAnchor [

	<FMProperty: #typeAnchor type: #Object>
	<generated>
	^ typeAnchor
]

{ #category : #accessing }
AlcixFunction >> typeAnchor: anObject [
	<generated>
	typeAnchor := anObject
]
