Trait {
	#name : #AlcixTType,
	#instVars : [
		'#name => FMProperty',
		'#container => FMOne type: #AlcixContainer opposite: #types',
		'#typeds => FMMany type: #AlcixTTyped opposite: #type'
	],
	#category : #'Alce-Famix-Traits'
}

{ #category : #meta }
AlcixTType classSide >> annotation [

	<FMClass: #TType super: #Object>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixTType >> addTyped: anObject [
	<generated>
	^ self typeds add: anObject
]

{ #category : #accessing }
AlcixTType >> container [
	"Relation named: #container type: #AlcixContainer opposite: #types"

	<generated>
	<container>
	^ container
]

{ #category : #accessing }
AlcixTType >> container: anObject [

	<generated>
	container := anObject
]

{ #category : #navigation }
AlcixTType >> containerGroup [
	<generated>
	<navigation: 'Container'>
	^ MooseSpecializedGroup with: self container
]

{ #category : #accessing }
AlcixTType >> isType [ 
	 ^ true 
]

{ #category : #accessing }
AlcixTType >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
AlcixTType >> name: anObject [
	<generated>
	name := anObject
]

{ #category : #accessing }
AlcixTType >> typeds [
	"Relation named: #typeds type: #AlcixTTyped opposite: #type"

	<generated>
	<derived>
	^ typeds
]

{ #category : #accessing }
AlcixTType >> typeds: anObject [

	<generated>
	typeds value: anObject
]
