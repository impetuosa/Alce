Class {
	#name : #SpColorPicker,
	#superclass : #SpPresenter,
	#instVars : [
		'colorList',
		'selectedColor',
		'whenColorAccepted',
		'window',
		'ok',
		'cancel',
		'setNil'
	],
	#category : #'Alce-MidasBrowsers'
}

{ #category : #specs }
SpColorPicker class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: (SpBoxLayout newLeftToRight
				   add: #colorList;
				   add: #ok width: 50;
				   add: #setNil width: 50;
				   add: #cancel width: 50;
				   yourself)
		  height: 70
]

{ #category : #actions }
SpColorPicker >> acceptColor [

	whenColorAccepted ifNotNil: [ 
		whenColorAccepted value: colorList selectedItem color ].
	window close
]

{ #category : #actions }
SpColorPicker >> cancelColor [
	window close. 
]

{ #category : #actions }
SpColorPicker >> initializePresenters [

	super initializePresenters.


	colorList := self newDropList.
	ok := self newButton
		      icon: (self iconNamed: #smallOk);
		      action: [ self acceptColor ].
	setNil := self newButton
		           label:'Nil';
		           action: [ self setNilColor ].
	cancel := self newButton
		          icon: (self iconNamed: #smallCancel);
		          action: [ self cancelColor ].
	colorList
		display: [ :m | m color name capitalized ];
		iconBlock: [ :e | e asForm ];
		items:
			((Color colors reject: [ :i | i name = 'unnamed' ]) collect: [ :c | 
					 Morph new
						 color: c;
						 yourself ]).
	colorList
]

{ #category : #actions }
SpColorPicker >> initializeWindow: aW [
	window := aW.
	window title: 'Pick a color'
]

{ #category : #actions }
SpColorPicker >> selectedColor: aColor [

	colorList items
		detect: [ :c | c color = aColor ]
		ifFound: [ :m | colorList selectItem: m ]
]

{ #category : #actions }
SpColorPicker >> setNilColor [

	whenColorAccepted ifNotNil: [ whenColorAccepted value: nil ].
	window close
]

{ #category : #actions }
SpColorPicker >> whenColorAccepted: aBlock [ 
	whenColorAccepted := aBlock
]
