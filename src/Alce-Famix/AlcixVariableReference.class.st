Class {
	#name : #AlcixVariableReference,
	#superclass : #AlcixReferenceName,
	#instVars : [
		'#access => FMOne type: #AlcixAccess opposite: #rightElementName',
		'#accessWrite => FMOne type: #AlcixAccessWrite opposite: #leftElementName'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixVariableReference class >> annotation [

	<FMClass: #VariableReference super: #AlcixReferenceName>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixVariableReference >> accept: aVisitor [
	^ aVisitor visitVariableReference: self

]

{ #category : #accessing }
AlcixVariableReference >> access [
	"Relation named: #access type: #AlcixAccess opposite: #rightElementName"

	<generated>
	<derived>
	^ access
]

{ #category : #accessing }
AlcixVariableReference >> access: anObject [

	<generated>
	access := anObject
]

{ #category : #accessing }
AlcixVariableReference >> accessWrite [
	"Relation named: #accessWrite type: #AlcixAccessWrite opposite: #leftElementName"

	<generated>
	<derived>
	^ accessWrite
]

{ #category : #accessing }
AlcixVariableReference >> accessWrite: anObject [

	<generated>
	accessWrite := anObject
]
