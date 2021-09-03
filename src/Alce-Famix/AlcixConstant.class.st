Class {
	#name : #AlcixConstant,
	#superclass : #AlcixWithAccesses,
	#traits : 'AlcixTTyped',
	#classTraits : 'AlcixTTyped classTrait',
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
