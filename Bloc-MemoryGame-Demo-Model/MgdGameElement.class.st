Class {
	#name : #MgdGameElement,
	#superclass : #BlElement,
	#instVars : [
		'memoryGame'
	],
	#category : #'Bloc-MemoryGame-Demo-Model'
}

{ #category : #'api - showing' }
MgdGameElement class >> openWith: aMgdGameModel [

| space gameElement |
space := BlSpace new.
gameElement := self new memoryGame: aMgdGameModel.
space root addChild: gameElement.

space show
]

{ #category : #accessing }
MgdGameElement >> initialize [ 
	super initialize. 
		self background: Color veryLightGray. 
		self layout: (BlGridLayout horizontal cellSpacing: 20).
		self constraintsDo: [ :aLayoutConstraints | aLayoutConstraints horizontal fitContent. aLayoutConstraints vertical fitContent ].
]

{ #category : #accessing }
MgdGameElement >> memoryGame [ 

	^ memoryGame
]

{ #category : #accessing }
MgdGameElement >> memoryGame: aGameModel [ 
	memoryGame := aGameModel. 
	self layout columnCount: memoryGame gridSize.
	memoryGame availableCards do: [ :aCard | self addChild: (MgdRawCardElement new card: aCard) ]
]
