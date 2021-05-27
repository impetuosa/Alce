Class {
	#name : #DBGSymbolInfo,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_ADDRESS',
		'OFFSET_FLAGS',
		'OFFSET_INDEX',
		'OFFSET_MAXNAMELEN',
		'OFFSET_MODBASE',
		'OFFSET_NAME',
		'OFFSET_NAMELEN',
		'OFFSET_REGISTER',
		'OFFSET_RESERVED1',
		'OFFSET_RESERVED2',
		'OFFSET_SCOPE',
		'OFFSET_SIZE',
		'OFFSET_SIZEOFSTRUCT',
		'OFFSET_TAG',
		'OFFSET_TYPEINDEX',
		'OFFSET_VALUE'
	],
	#category : #AlceWin32
}

{ #category : #'field definition' }
DBGSymbolInfo class >> fieldsDesc [
	"
		self rebuildFieldAccessors.
	"

	^ #(
   ulong   SizeOfStruct;
  ulong   TypeIndex;
  ulonglong Reserved1;
  ulonglong Reserved2;
  ulong   Index;
  ulong   Size;
  ulonglong ModBase;
  ulong   Flags;
  ulonglong Value;
  ulonglong Address;
  ulong   Register;
  ulong   Scope;
  ulong   Tag;
  ulong   NameLen;
  ulong   MaxNameLen;
  char    Name;
	)
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Address [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_ADDRESS
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Address: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_ADDRESS put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Flags [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_FLAGS
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Flags: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_FLAGS put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Index [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Index: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_INDEX put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> MaxNameLen [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_MAXNAMELEN
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> MaxNameLen: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_MAXNAMELEN put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> ModBase [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_MODBASE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> ModBase: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_MODBASE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Name [
	"This method was automatically generated"
	^handle unsignedCharAt: OFFSET_NAME
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Name: anObject [
	"This method was automatically generated"
	handle unsignedCharAt: OFFSET_NAME put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> NameLen [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NAMELEN
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> NameLen: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NAMELEN put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Register [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_REGISTER
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Register: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_REGISTER put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Reserved1 [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_RESERVED1
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Reserved1: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_RESERVED1 put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Reserved2 [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_RESERVED2
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Reserved2: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_RESERVED2 put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Scope [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SCOPE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Scope: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SCOPE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Size [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Size: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZE put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> SizeOfStruct [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEOFSTRUCT
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> SizeOfStruct: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEOFSTRUCT put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Tag [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TAG
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Tag: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TAG put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> TypeIndex [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TYPEINDEX
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> TypeIndex: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_TYPEINDEX put: anObject
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Value [
	"This method was automatically generated"
	^handle unsignedLongLongAt: OFFSET_VALUE
]

{ #category : #'accessing structure variables' }
DBGSymbolInfo >> Value: anObject [
	"This method was automatically generated"
	handle unsignedLongLongAt: OFFSET_VALUE put: anObject
]
