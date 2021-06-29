Class {
	#name : #MiColouringCommand,
	#superclass : #CmCommand,
	#category : #'Alce-MidasBrowsers'
}

{ #category : #default }
MiColouringCommand class >> defaultDescription [
	^ 'Change selected entity colour'
]

{ #category : #default }
MiColouringCommand class >> defaultName [
	^ 'Colouring'
]

{ #category : #default }
MiColouringCommand class >> forSpecContext: anObject [
	^ (super forSpecContext: anObject)
		iconNamed: #mooseIcon;
		beHiddenWhenCantBeRun;
		yourself
]

{ #category : #testing }
MiColouringCommand >> canBeExecuted [
	^ self context miSelectedItem isMooseObject
]

{ #category : #executing }
MiColouringCommand >> execute [

	| selectedItem  |
	selectedItem := [ self context miSelectedItem ]
		                on: MiNoSelectedElementToPropagateException
		                do: [ :exception | 
			                exception signal.
			                ^ self ].

	SpColorPicker new
		selectedColor: selectedItem color;
		whenColorAccepted: [ :color | selectedItem color: color ];
		openWithSpec
]
