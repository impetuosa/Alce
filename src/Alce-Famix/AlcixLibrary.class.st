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

{ #category : #visiting }
AlcixLibrary >> accept: aVisitor [
	^ aVisitor visitLibrary: self

]

{ #category : #adding }
AlcixLibrary >> addGlobal: anAlcixAttribute [ 

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

{ #category : #accessing }
AlcixLibrary >> printOn: aStream [

	aStream
		nextPutAll: 'Library';
		nextPutAll: '(';
		nextPutAll: name;
		nextPutAll: ')'
]
