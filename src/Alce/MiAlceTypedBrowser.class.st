Class {
	#name : #MiAlceTypedBrowser,
	#superclass : #MiAlceAbstractBrowser,
	#instVars : [
		'viewport',
		'tables'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #visiting }
MiAlceTypedBrowser >> accept: aModel [ 
	^ aModel class isComposedBy: AlcixTTyped 
]
