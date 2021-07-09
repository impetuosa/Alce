Class {
	#name : #AlcixAlias,
	#superclass : #AlcixAccessible,
	#traits : 'AlcixTType + AlcixTTyped',
	#classTraits : 'AlcixTType classTrait + AlcixTTyped classTrait',
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAlias class >> annotation [

	<FMClass: #Alias super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAlias >> accept: aVisitor [
	^ aVisitor visitAlias: self

]

{ #category : #visiting }
AlcixAlias >> color [

	^ type ifNotNil: [ type color ] ifNil: [ super color ]
]

{ #category : #visiting }
AlcixAlias >> color: aColor [

	^ type
		  ifNotNil: [ type color: aColor ]
		  ifNil: [ super color: aColor ]
]

{ #category : #accessing }
AlcixAlias >> invocables [  
	^ type ifNil: [ {  } ] ifNotNil: [ type invocables ]
]

{ #category : #testing }
AlcixAlias >> isAstLoaded [
	 ^ true 
]

{ #category : #accessing }
AlcixAlias >> members [ 
	^ type ifNil: [ {  } ] ifNotNil: [ type members ]
]

{ #category : #accessing }
AlcixAlias >> printOn: aStream [
	aStream
		nextPutAll: 'Alias(';
		nextPutAll: name;
		nextPutAll: '=>'.
	typeName printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
AlcixAlias >> types [  
	^ type ifNil: [ {  } ] ifNotNil: [ type types ]
]

{ #category : #accessing }
AlcixAlias >> userType [
	^ container 
]

{ #category : #visiting }
AlcixAlias >> weight [

	^ type ifNil: [ 1 ] ifNotNil: [ type weight ]
]
