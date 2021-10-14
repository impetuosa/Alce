Class {
	#name : #AlceJinDAMTwoPhaseLoader,
	#superclass : #Object,
	#instVars : [
		'dam',
		'alce',
		'instances'
	],
	#category : #'Alce-Generator'
}

{ #category : #accessing }
AlceJinDAMTwoPhaseLoader >> alce [
	^ alce
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> createAccess [
	 ^ alce instantiate: AlcixAccess 
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> createAssignment [

	^ alce instantiate: AlcixAssignment
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> createReturn [
	^ alce instantiate: AlcixReturn .
]

{ #category : #accessing }
AlceJinDAMTwoPhaseLoader >> dam [
	^ dam
]

{ #category : #accessing }
AlceJinDAMTwoPhaseLoader >> instanceFor: aJinDAMAccessModule [ 
	^ instances at: aJinDAMAccessModule 
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> instancesFor: aCollection [ 
	^ aCollection collect: [ :a | self instanceFor: a ]
]

{ #category : #initialization }
AlceJinDAMTwoPhaseLoader >> load: aDamModel [

	^ self load: aDamModel into: AlcixModel new
]

{ #category : #initialization }
AlceJinDAMTwoPhaseLoader >> load: aDamModel into: anAlceModel [

	dam := aDamModel.
	alce := anAlceModel.
	instances := Dictionary new. 
	
	AlceJinDAMPhase1Loader new runOn: self.
	AlceJinDAMPhase2Loader new runOn: self.

	^ anAlceModel
]

{ #category : #'instance creation' }
AlceJinDAMTwoPhaseLoader >> newInvocation [

	^ alce instantiate: AlcixInvocation
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> register: anAlcixAccessModule for: aJinDAMAccessModule [

	(instances includesKey: aJinDAMAccessModule) ifTrue: [ ^ self ].
	instances at: aJinDAMAccessModule put: anAlcixAccessModule
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> undefinedType [

	^ alce instantiate: AlcixUndefinedElement
]

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> unknownElement [

	^ alce instantiate: AlcixUnknownElement
]
