Extension { #name : #JinSubvisitor }

{ #category : #'*Alce' }
JinSubvisitor >> instantiate: aClass [
	^ parent instantiate: aClass
]

{ #category : #'*Alce' }
JinSubvisitor >> parent: aParent [
	parent := aParent
]