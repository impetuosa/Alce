Class {
	#name : #AlcixArgument,
	#superclass : #AlcixCodeSegment,
	#instVars : [
		'#value => FMProperty',
		'#invocation => FMOne type: #AlcixInvocation opposite: #arguments'
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

{ #category : #visiting }
AlcixArgument >> accept: aVisitor [
	^ aVisitor visitArgument: self

]

{ #category : #accessing }
AlcixArgument >> invocation [
	"Relation named: #invocation type: #AlcixInvocation opposite: #arguments"

	<generated>
	<container>
	^ invocation
]

{ #category : #accessing }
AlcixArgument >> invocation: anObject [

	<generated>
	invocation := anObject
]

{ #category : #navigation }
AlcixArgument >> invocationGroup [
	<generated>
	<navigation: 'Invocation'>
	^ MooseSpecializedGroup with: self invocation
]

{ #category : #navigation }
AlcixArgument >> printOn: aStream [

	aStream nextPutAll: 'Arg('.
	value printOn: aStream.
	aStream nextPutAll: ')'
]

{ #category : #accessing }
AlcixArgument >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : #accessing }
AlcixArgument >> value: anObject [
	<generated>
	value := anObject
]
