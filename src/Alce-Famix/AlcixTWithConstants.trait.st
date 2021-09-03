Trait {
	#name : #AlcixTWithConstants,
	#instVars : [
		'#constants => FMMany type: #AlcixConstant opposite: #owner'
	],
	#category : #'Alce-Famix-Traits'
}

{ #category : #meta }
AlcixTWithConstants classSide >> annotation [

	<FMClass: #TWithConstants super: #Object>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #adding }
AlcixTWithConstants >> addConstant: anObject [
	<generated>
	^ self constants add: anObject
]

{ #category : #accessing }
AlcixTWithConstants >> constants [
	"Relation named: #constants type: #AlcixConstant opposite: #owner"

	<generated>
	<derived>
	^ constants
]

{ #category : #accessing }
AlcixTWithConstants >> constants: anObject [

	<generated>
	constants value: anObject
]

{ #category : #navigation }
AlcixTWithConstants >> constantsGroup [
	<generated>
	<navigation: 'Constants'>
	^ MooseSpecializedGroup withAll: self constants asSet
]
