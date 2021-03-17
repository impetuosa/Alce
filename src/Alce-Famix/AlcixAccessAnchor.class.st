Class {
	#name : #AlcixAccessAnchor,
	#superclass : #AlcixEntity,
	#instVars : [
		'#accessEntity => FMOne type: #AlcixAccessEntity opposite: #accessAnchor'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessAnchor class >> annotation [

	<FMClass: #AccessAnchor super: #AlcixEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixAccessAnchor >> accessEntity [
	"Relation named: #accessEntity type: #AlcixAccessEntity opposite: #accessAnchor"

	<generated>
	<container>
	<derived>
	^ accessEntity
]

{ #category : #accessing }
AlcixAccessAnchor >> accessEntity: anObject [

	<generated>
	accessEntity := anObject
]

{ #category : #navigation }
AlcixAccessAnchor >> accessEntityGroup [
	<generated>
	<navigation: 'AccessEntity'>
	^ MooseSpecializedGroup with: self accessEntity
]
