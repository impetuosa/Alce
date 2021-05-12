Trait {
	#name : #AlcixTType,
	#instVars : [
		'#container => FMOne type: #AlcixContainer opposite: #types',
		'#name => FMProperty',
		'#typed => FMOne type: #AlcixTTyped opposite: #type'
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
AlcixTType >> typed [
	"Relation named: #typed type: #AlcixTTyped opposite: #type"

	<generated>
	<container>
	<derived>
	^ typed
]

{ #category : #accessing }
AlcixTType >> typed: anObject [

	<generated>
	typed := anObject
]

{ #category : #navigation }
AlcixTType >> typedGroup [
	<generated>
	<navigation: 'Typed'>
	^ MooseSpecializedGroup with: self typed
]
