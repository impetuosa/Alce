Class {
	#name : #AlceNullColorPropagation,
	#superclass : #AlceColoringStrategy,
	#category : #'Alce-Coloring'
}

{ #category : #initialization }
AlceNullColorPropagation >> colorsFor: anEntity [

	^ { Color transparent }
]
