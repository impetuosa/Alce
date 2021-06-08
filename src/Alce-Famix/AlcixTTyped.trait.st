Trait {
	#name : #AlcixTTyped,
	#instVars : [
		'#typeName => FMOne type: #AlcixTypeReference opposite: #typed',
		'#type => FMOne type: #AlcixTType opposite: #typeds'
	],
	#category : #'Alce-Famix-Traits'
}

{ #category : #meta }
AlcixTTyped classSide >> annotation [

	<FMClass: #TTyped super: #Object>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixTTyped >> type [
	"Relation named: #type type: #AlcixTType opposite: #typeds"

	<generated>
	^ type
]

{ #category : #accessing }
AlcixTTyped >> type: anObject [

	<generated>
	type := anObject
]

{ #category : #accessing }
AlcixTTyped >> typeName [
	"Relation named: #typeName type: #AlcixTypeReference opposite: #typed"

	<generated>
	^ typeName
]

{ #category : #accessing }
AlcixTTyped >> typeName: anObject [

	<generated>
	typeName := anObject
]
