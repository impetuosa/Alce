Trait {
	#name : #AlcixTTyped,
	#instVars : [
		'#typeName => FMProperty',
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

	<FMProperty: #typeName type: #String>
	<generated>
	^ typeName
]

{ #category : #accessing }
AlcixTTyped >> typeName: anObject [
	<generated>
	typeName := anObject
]
