Extension { #name : #Kernel32Lib }

{ #category : #'*AlceWin32' }
Kernel32Lib >> currentProcessHandle [
	^ self ffiCall: #(HANDLE GetCurrentProcess())
]
