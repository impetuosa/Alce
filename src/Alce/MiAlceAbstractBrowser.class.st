Class {
	#name : #MiAlceAbstractBrowser,
	#superclass : #MiAbstractBrowser,
	#instVars : [
		'selection'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #commands }
MiAlceAbstractBrowser class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [


	rootCommandGroup register:
		(MiAlceInspectCommand forSpecContext: presenterInstance).

	rootCommandGroup register:
		(MiColouringCommand forSpecContext: presenterInstance)
]

{ #category : #opening }
MiAlceAbstractBrowser >> browse: anAlcixLocalVariable [

	(anAlcixLocalVariable respondsTo: #invocable)
		ifTrue: [ 
			selection := anAlcixLocalVariable invocable userType container.
			self propagate.
			selection := anAlcixLocalVariable invocable userType.
			self propagate.
			selection := anAlcixLocalVariable invocable.
			self propagate.
			selection := anAlcixLocalVariable anchor.
			self propagate ]
		ifFalse: [ 
			selection := anAlcixLocalVariable userType container.
			self propagate.
			selection := anAlcixLocalVariable userType.
			self propagate.
			selection := anAlcixLocalVariable.
			self propagate.
			selection := anAlcixLocalVariable anchor ]
]

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
