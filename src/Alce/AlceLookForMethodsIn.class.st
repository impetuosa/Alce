Class {
	#name : #AlceLookForMethodsIn,
	#superclass : #AlceLookIn,
	#category : #'Alce-Linker'
}

{ #category : #visiting }
AlceLookForMethodsIn >> visitClass: anAlcixClass [

	anAlcixClass invocables do: [ :i | 
		(self matches: i selector) ifTrue: [ ^ self findings: i ] ]
]

{ #category : #visiting }
AlceLookForMethodsIn >> visitModule: anAlcixClass [
	^ self halt
]

{ #category : #visiting }
AlceLookForMethodsIn >> visitUserType: anAlcixClass [
	^ self halt
]
