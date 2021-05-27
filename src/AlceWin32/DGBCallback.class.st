Class {
	#name : #DGBCallback,
	#superclass : #FFICallback,
	#pools : [
		'DBGHelpTypes'
	],
	#category : #AlceWin32
}

{ #category : #'instance creation' }
DGBCallback class >> fnSpec [
	self subclassResponsibility 
]

{ #category : #'instance creation' }
DGBCallback class >> new [
	^ super new
		beNull;
		yourself
]

{ #category : #'instance creation' }
DGBCallback class >> on: aBlock [
	^ self 
		signature: self fnSpec 
		block: aBlock 
]
