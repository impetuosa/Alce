Extension { #name : #String }

{ #category : #'*Alce' }
String >> toPG [

	| copy str pos |
	copy := self readStream upTo: $;.
	copy := copy copyReplaceAll: '"' with: ''''.
	copy := copy copyReplaceAll: '[' with: '"'.
	copy := copy copyReplaceAll: ']' with: '"'.
	copy := copy caseNotSensitiveCopyReplaceAll: 'DISTINCTROW' with: 'DISTINCT'.
	str := copy asLowercase findString: ' top ' startingAt: 1.
	str = 0 ifFalse: [
		pos := str +	' top '	 size. 
		(copy at: pos) isDigit ifFalse: [ ^ copy ].
		
		[ (copy at: pos ) isDigit ] whileTrue: [ pos := pos +1  ].
		copy := (copy copyFrom: 1 to: str), (copy copyFrom: pos to: copy size )
	  ].
	
	^ copy
]
