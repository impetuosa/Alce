Class {
	#name : #AlceTextAction,
	#superclass : #TextAction,
	#instVars : [
		'info'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #'as yet unclassified' }
AlceTextAction class >> block: anObject info: tooltip [

	^ self new
		  actOnClickBlock: anObject;
		  info: tooltip;
		  yourself
]

{ #category : #'as yet unclassified' }
AlceTextAction class >> inspect: anObject info: tooltip [

	^ self new
		  actOnClickBlock: [ anObject value inspect ];
		  info: tooltip;
		  yourself
]

{ #category : #testing }
AlceTextAction >> dominates: other [
"Only one color attribute on a same portion of text."
	^ other class == self class
]

{ #category : #testing }
AlceTextAction >> info [
	^ info
]

{ #category : #accessing }
AlceTextAction >> info: aString [ 
	info := aString
]

{ #category : #testing }
AlceTextAction >> mayActOnEvent: anEvent [
	^ anEvent redButtonPressed and: [ anEvent shiftPressed  ]
]
