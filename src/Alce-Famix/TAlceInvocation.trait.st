Trait {
	#name : #TAlceInvocation,
	#category : #'Alce-Famix-Model'
}

{ #category : #testing }
TAlceInvocation >> isVBMessageSend [
	^ self class = AlcixMethodInvocation
]
