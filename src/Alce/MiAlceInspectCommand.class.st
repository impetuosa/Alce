Class {
	#name : #MiAlceInspectCommand,
	#superclass : #CmCommand,
	#category : #'Alce-MidasBrowsers'
}

{ #category : #default }
MiAlceInspectCommand class >> defaultDescription [
	^ 'Pharo-Inspect selected entity'
]

{ #category : #default }
MiAlceInspectCommand class >> defaultName [
	^ 'Pharo Inspector'
]

{ #category : #default }
MiAlceInspectCommand class >> forSpecContext: anObject [
	^ (super forSpecContext: anObject)
		iconNamed: #mooseIcon;
		beHiddenWhenCantBeRun;
		yourself
]

{ #category : #executing }
MiAlceInspectCommand >> execute [

	| selectedItem |
	selectedItem := [ self context miSelectedItem ]
		                on: MiNoSelectedElementToPropagateException
		                do: [ :exception | 
			                exception signal.
			                ^ self ].

	selectedItem inspect
]
