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

{ #category : #'as yet unclassified' }
AlceJinDAMTwoPhaseLoader >> register: anAlcixAccessModule for: aJinDAMAccessModule [

	self assert: (instances includesKey: aJinDAMAccessModule) not.
	instances at: aJinDAMAccessModule put: anAlcixAccessModule
]
