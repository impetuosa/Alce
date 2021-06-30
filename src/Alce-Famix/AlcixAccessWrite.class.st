Class {
	#name : #AlcixAccessWrite,
	#superclass : #AlcixAccess,
	#instVars : [
		'#isNewObject => FMProperty',
		'#leftElement => FMOne type: #AlcixAccessible opposite: #writingAccesses',
		'#leftElementName => FMOne type: #AlcixVariableReference opposite: #accessWrite'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccessWrite class >> annotation [

	<FMClass: #AccessWrite super: #AlcixAccess>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccessWrite >> accept: aVisitor [
	^ aVisitor visitAccessWrite: self

]

{ #category : #accessing }
AlcixAccessWrite >> color [

	^ leftElement
		  ifNil: [ super color ]
		  ifNotNil: [ leftElement color ]
]

{ #category : #setting }
AlcixAccessWrite >> expandLeftMethodInvocation [

	| n selector sender  |
	self halt. 
	selector := leftElementName dropSelectorOutOfReceiver.
	
	"(self mooseModel instantiate: AlcixInvocableReference)
		            names: { leftElementName names last };
		            yourself."
	sender := invocable.



	n := self mooseModel instantiate: AlcixMethodInvocation.
	n selector: selector.
	n sender: sender.
	n receiver: self.
	self mooseModel add: n.
	^ n
]

{ #category : #setting }
AlcixAccessWrite >> includedColorsInto: colors [

	super includedColorsInto: colors.
	leftElement ifNotNil: [ 
		colors add: leftElement color.
		colors add: leftElement userType color ]
]

{ #category : #accessing }
AlcixAccessWrite >> isNewObject [

	<FMProperty: #isNewObject type: #Boolean>
	<generated>
	^ isNewObject
]

{ #category : #accessing }
AlcixAccessWrite >> isNewObject: anObject [
	<generated>
	isNewObject := anObject
]

{ #category : #accessing }
AlcixAccessWrite >> isWriting [

	^ true
]

{ #category : #accessing }
AlcixAccessWrite >> leftElement [
	"Relation named: #leftElement type: #AlcixAccessible opposite: #writingAccesses"

	<generated>
	^ leftElement
]

{ #category : #accessing }
AlcixAccessWrite >> leftElement: anObject [

	<generated>
	leftElement := anObject
]

{ #category : #accessing }
AlcixAccessWrite >> leftElementName [
	"Relation named: #leftElementName type: #AlcixVariableReference opposite: #accessWrite"

	<generated>
	^ leftElementName
]

{ #category : #accessing }
AlcixAccessWrite >> leftElementName: anObject [

	<generated>
	leftElementName := anObject
]

{ #category : #accessing }
AlcixAccessWrite >> printOn: aStream [

	leftElementName printOn: aStream.
	aStream nextPutAll:
		(leftElement ifNil: [ '(solved)' ] ifNotNil: [ '(notsolved)' ]).
	aStream nextPutAll: '='.
	super printOn: aStream
]

{ #category : #setting }
AlcixAccessWrite >> setLeftElement: anAccessible [

	(anAccessible isKindOf: AlcixAccessible) ifTrue: [ 
		^ leftElement := anAccessible ].
	" So far we only understand this case as the transformation of this access to a method invocation. So the element should be a function / sub and the rightElementName must have at least 2 parts object.message. If not, we may have to do different. "
	self assert: (anAccessible isKindOf: AlcixInvocable).
	self assert: leftElementName names size > 1.
	self halt.
	self expandLeftMethodInvocation setCandidate: anAccessible
]
