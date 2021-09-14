Class {
	#name : #AlcixEntity,
	#superclass : #MooseEntity,
	#instVars : [
		'color'
	],
	#classInstVars : [
		'color'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #meta }
AlcixEntity class >> entryName [

	^ self name copyReplaceAll: 'Alcix' with: ''
]

{ #category : #meta }
AlcixEntity class >> metamodel [

	<generated>
	^ AlcixModel metamodel
]

{ #category : #testing }
AlcixEntity >> entryName [
	^ self name 
]

{ #category : #testing }
AlcixEntity >> isAccessModule [
	^ false 
]

{ #category : #testing }
AlcixEntity >> isAssignment [

	<generated>
	^ false
]

{ #category : #testing }
AlcixEntity >> isUnknown [ 
	 ^ false. 
]
