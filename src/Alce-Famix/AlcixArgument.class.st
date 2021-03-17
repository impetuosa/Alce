Class {
	#name : #AlcixArgument,
	#superclass : #AlcixCodeSegment,
	#instVars : [
		'#parameter => FMOne type: #AlcixParameter opposite: #arguments'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixArgument class >> annotation [

	<FMClass: #Argument super: #AlcixCodeSegment>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixArgument >> parameter [
	"Relation named: #parameter type: #AlcixParameter opposite: #arguments"

	<generated>
	^ parameter
]

{ #category : #accessing }
AlcixArgument >> parameter: anObject [

	<generated>
	parameter := anObject
]
