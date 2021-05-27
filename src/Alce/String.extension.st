Extension { #name : #String }

{ #category : #'*Alce' }
String >> adaptToAlceAnchorPathFragment [
	 ^ self 
]

{ #category : #'*Alce' }
String >> toPG [
	| copy |
	copy := self readStream upTo:$;.
	copy := copy copyReplaceAll: '"' with: ''''.
	copy := copy copyReplaceAll: '[' with: '"'.
	copy := copy copyReplaceAll: ']' with: '"'.
	^ copy
]
