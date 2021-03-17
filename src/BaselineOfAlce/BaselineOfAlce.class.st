Class {
	#name : #BaselineOfAlce,
	#superclass : #BaselineOf,
	#category : #BaselineOfAlce
}

{ #category : #baselines }
BaselineOfAlce >> baseline: spec [
	<baseline>
	spec
		baseline: 'PostgreSQLParser'
		with: [ spec
				repository: 'github://impetuosa/PostgreSQLParser/src';
				loads: #dev].
	spec
		baseline: 'Jindao'
		with: [ spec repository: 'github://impetuosa/Jindao' ].
	spec
		package: 'Alce'
		with: [ spec requires: #(Jindao PostgreSQLParser) ].
		
	spec
		package: 'Alce-Famix'
		with: [ spec requires: #(Alce) ]
]
