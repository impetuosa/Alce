Class {
	#name : #AlcixPrimitiveType,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType',
	#classTraits : 'AlcixTType classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixPrimitiveType class >> annotation [

	<FMClass: #PrimitiveType super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixPrimitiveType >> accept: aVisitor [
	^ aVisitor visitPrimitiveType: self

]

{ #category : #accessing }
AlcixPrimitiveType >> asType [ 
	^ self
]

{ #category : #accessing }
AlcixPrimitiveType >> invocables [
	^ {  }
]

{ #category : #accessing }
AlcixPrimitiveType >> members [

	^ {  }
]

{ #category : #accessing }
AlcixPrimitiveType >> types [

	^ {  }
]
