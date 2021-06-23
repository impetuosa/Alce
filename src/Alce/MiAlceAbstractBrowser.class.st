Class {
	#name : #MiAlceAbstractBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'selection'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #accessing }
MiAlceAbstractBrowser >> miSelectedItem [
	^ selection
]

{ #category : #accessing }
MiAlceAbstractBrowser >> selectEntity: anEntity [

	(self accept: anEntity) ifFalse: [ ^ self ].
	^ super selectEntity: anEntity
]

{ #category : #accessing }
MiAlceAbstractBrowser >> selection: aSelection [ 
	selection := aSelection selectedItem.
	self propagate. 
]
