Class {
	#name : #AlcixAccess,
	#superclass : #AlcixAccessible,
	#instVars : [
		'#isWriting => FMProperty',
		'#isReturn => FMProperty',
		'#rightElement => FMOne type: #AlcixAccessible opposite: #readingAccesses',
		'#invocable => FMOne type: #AlcixInvocable opposite: #accesses',
		'#rightElementName => FMOne type: #AlcixVariableReference opposite: #access'
	],
	#category : #'Alce-Famix-Entities'
}

{ #category : #meta }
AlcixAccess class >> annotation [

	<FMClass: #Access super: #AlcixAccessible>
	<package: #'Alce-Famix'>
	<generated>
	^self
]

{ #category : #visiting }
AlcixAccess >> accept: aVisitor [
	^ aVisitor visitAccess: self

]

{ #category : #becoming }
AlcixAccess >> expandMethodInvocation [

	| n selector sender rightNewElement |
	selector := rightElementName dropSelectorOutOfReceiver.
	sender := invocable.
	
	rightNewElement := self mooseModel instantiate: AlcixAccessRead.
	rightNewElement rightElement: rightElement.
	rightNewElement rightElementName: rightElementName .
	rightNewElement invocable: invocable. 
	
	n := self mooseModel instantiate: AlcixMethodInvocation.
	rightElement := n.
	rightElementName := nil.
	n selector: selector.
	n sender: sender.
	n receiver: rightNewElement.
	
	
	self mooseModel add: n.
	^ n
]

{ #category : #accessing }
AlcixAccess >> invocable [
	"Relation named: #invocable type: #AlcixInvocable opposite: #accesses"

	<generated>
	<container>
	^ invocable
]

{ #category : #accessing }
AlcixAccess >> invocable: anObject [

	<generated>
	invocable := anObject
]

{ #category : #navigation }
AlcixAccess >> invocableGroup [
	<generated>
	<navigation: 'Invocable'>
	^ MooseSpecializedGroup with: self invocable
]

{ #category : #accessing }
AlcixAccess >> isReturn [

	<FMProperty: #isReturn type: #Boolean>
	<generated>
	^ isReturn
]

{ #category : #accessing }
AlcixAccess >> isReturn: anObject [
	<generated>
	isReturn := anObject
]

{ #category : #accessing }
AlcixAccess >> isWriting [

	<FMProperty: #isWriting type: #Boolean>
	<generated>
	^ isWriting
]

{ #category : #accessing }
AlcixAccess >> isWriting: anObject [
	<generated>
	isWriting := anObject
]

{ #category : #accessing }
AlcixAccess >> printOn: aStream [

	rightElementName printOn: aStream.
	aStream nextPutAll:
		(rightElement ifNotNil: [ '(solved)' ] ifNil: [ '(notsolved)' ])
]

{ #category : #accessing }
AlcixAccess >> rightElement [
	"Relation named: #rightElement type: #AlcixAccessible opposite: #readingAccesses"

	<generated>
	^ rightElement
]

{ #category : #accessing }
AlcixAccess >> rightElement: anObject [

	<generated>
	rightElement := anObject
]

{ #category : #accessing }
AlcixAccess >> rightElementName [
	"Relation named: #rightElementName type: #AlcixVariableReference opposite: #access"

	<generated>
	^ rightElementName
]

{ #category : #accessing }
AlcixAccess >> rightElementName: anObject [

	<generated>
	rightElementName := anObject
]

{ #category : #becoming }
AlcixAccess >> setRightElement: anAccessible [

	(anAccessible isKindOf: AlcixAccessible) ifTrue: [ 
		^ rightElement := anAccessible ].
	" So far we only understand this case as the transformation of this access to a method invocation. So the element should be a function / sub and the rightElementName must have at least 2 parts object.message. If not, we may have to do different. "
	self assert: (anAccessible isKindOf: AlcixInvocable).
	self assert: rightElementName names size > 1.
	
	self expandMethodInvocation setCandidate: anAccessible.
	
	
	

]
