Class {
	#name : #BaselineOfAlce,
	#superclass : #BaselineOf,
	#category : #BaselineOfAlce
}

{ #category : #baselines }
BaselineOfAlce >> baseline: spec [
	<baseline>

	spec
		baseline: 'Jindao'
		with: [ spec repository: 'github://impetuosa/Jindao' ].
	spec
		package: 'Alce'
		with: [ spec requires: #(Jindao) ].
		
	spec
		package: 'Alce-Famix'
		with: [ spec requires: #(Alce) ]
]
