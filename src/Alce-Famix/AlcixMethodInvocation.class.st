Class {
	#name : #AlcixMethodInvocation,
	#superclass : #AlcixInvocation,
	#instVars : [
		'#receiver => FMOne type: #AlcixAccess opposite: #methodInvocation'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixMethodInvocation class >> annotation [

	<FMClass: #MethodInvocation super: #AlcixInvocation>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #accessing }
AlcixMethodInvocation >> receiver [
	"Relation named: #receiver type: #AlcixAccess opposite: #methodInvocation"

	<generated>
	^ receiver
]

{ #category : #accessing }
AlcixMethodInvocation >> receiver: anObject [

	<generated>
	receiver := anObject
]
