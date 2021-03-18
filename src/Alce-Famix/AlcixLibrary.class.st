Class {
	#name : #AlcixLibrary,
	#superclass : #AlcixReference,
	#instVars : [
		'#isBuiltIn => FMProperty'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixLibrary class >> annotation [

	<FMClass: #Library super: #AlcixReference>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixLibrary >> isBuiltIn [

	<FMProperty: #isBuiltIn type: #Boolean>
	<generated>
	^ isBuiltIn
]

{ #category : #accessing }
AlcixLibrary >> isBuiltIn: anObject [
	<generated>
	isBuiltIn := anObject
]
