Class {
	#name : #AlceVBAStyle,
	#superclass : #Object,
	#category : #'Alce-MidasBrowsers'
}

{ #category : #'as yet unclassified' }
AlceVBAStyle >> accessorKind [
	 ^ self keyword 
]

{ #category : #converting }
AlceVBAStyle >> as [

	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> assignmentKind [

	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> bold [
	^ TextEmphasis bold
]

{ #category : #accessing }
AlceVBAStyle >> case [
	^ self keyword 
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> color: aColor [ 
	^ TextColor color: aColor 
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> comment [

	^ { (self color: Color green muchDarker) }
]

{ #category : #generated }
AlceVBAStyle >> compare [
	^ self keyword 
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> const [

	^ self keyword
]

{ #category : #accessing }
AlceVBAStyle >> database [
	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> dim [

	^ self keyword
]

{ #category : #generated }
AlceVBAStyle >> else [

	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> endKeyword [

	^ self keyword 
]

{ #category : #accessing }
AlceVBAStyle >> enum [
	^ self keyword 
]

{ #category : #'accessing - styles' }
AlceVBAStyle >> errorStyle [
	^ self keyword 
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> explicit [

	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> functionKeyword [

	^ self keyword 
]

{ #category : #'method - generated' }
AlceVBAStyle >> goto [
	^ self keyword 
]

{ #category : #generated }
AlceVBAStyle >> if [
	^ self keyword
]

{ #category : #accessing }
AlceVBAStyle >> keyword [

	^ { 
		  self bold.
		  (self color: Color blue darker) }
]

{ #category : #accessing }
AlceVBAStyle >> label [
	 ^ { self color: Color black . self bold  }
]

{ #category : #accessing }
AlceVBAStyle >> literal [

	^ { (self color: Color blue) }
]

{ #category : #'instance creation' }
AlceVBAStyle >> new [

	^ self keyword
]

{ #category : #accessing }
AlceVBAStyle >> next [

	^ self keyword
]

{ #category : #generated }
AlceVBAStyle >> on [
	^ self keyword
]

{ #category : #generated }
AlceVBAStyle >> operator [

	^ { (self color: Color red) }
]

{ #category : #accessing }
AlceVBAStyle >> option [
	^ self keyword 
]

{ #category : #accessing }
AlceVBAStyle >> property [

	^ self keyword
]

{ #category : #controlling }
AlceVBAStyle >> resume [

	^ self keyword
]

{ #category : #'brick-interactable-actions' }
AlceVBAStyle >> select [

	^ self keyword
]

{ #category : #accessing }
AlceVBAStyle >> string [

	^ { (self color: Color purple lighter lighter lighter) }
]

{ #category : #accessing }
AlceVBAStyle >> sub [

	^ self keyword
]

{ #category : #generated }
AlceVBAStyle >> then [
^ self keyword
]

{ #category : #generated }
AlceVBAStyle >> type [

	^ self keyword
]

{ #category : #'as yet unclassified' }
AlceVBAStyle >> visibility [

	^ self keyword
]

{ #category : #accessing }
AlceVBAStyle >> with [
	^ self keyword
]
