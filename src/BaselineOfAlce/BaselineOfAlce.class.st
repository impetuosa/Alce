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
		with: [ spec repository: 'gitlab://gitlab.forge.berger-levrault.com:bl-drit/bl.drit.experiments/software.engineering/microsoft-access-migration/Jindao' ].
	spec
		package: 'Alce'
		with: [ spec requires: #(Jindao) ].
		
	spec
		package: 'Alce-Famix'
		with: [ spec requires: #(Alce) ]
]
