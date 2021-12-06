Extension { #name : #RSComposite }

{ #category : #'*Alce' }
RSComposite >> innerShape [

	^ self propertyAt: #innerShape
]

{ #category : #'*Alce' }
RSComposite >> setAsInnerShape: aRSEllipse [

	self add: aRSEllipse.
	aRSEllipse sparent: self. 
	aRSEllipse pushBack .
	self propertyAt: #innerShape put: aRSEllipse.
	self
		propertyAt: #background put: aRSEllipse;
		adjustToChildren
]
