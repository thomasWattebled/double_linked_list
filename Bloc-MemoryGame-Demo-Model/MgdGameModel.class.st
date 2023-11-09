Class {
	#name : #MgdGameModel,
	#superclass : #Object,
	#instVars : [
		'availableCards',
		'chosenCards'
	],
	#category : #'Bloc-MemoryGame-Demo-Model'
}

{ #category : #'as yet unclassified' }
MgdGameModel class >> numbers [

<sampleInstance>
	^ self new initializeForSymbols: '12345678'
]

{ #category : #initialization }
MgdGameModel >> availableCards [

^ availableCards 
]

{ #category : #initialization }
MgdGameModel >> cardsCount [
	"Return how many cards there should be depending on grid size"
	^ self gridSize * self gridSize
]

{ #category : #initialization }
MgdGameModel >> choosenCard: aCard [

	(self chosenCards includes: aCard) ifTrue: [ ^ self ].
	self chosenCards add: aCard.
	aCard flip.
	self shouldCompleteStep ifTrue: [ ^ self completeStep ].
	self shouldResetStep ifTrue: [ 
		"self halt."
		self resetStep ]
]

{ #category : #initialization }
MgdGameModel >> chosenCardMatch [

	| firstCard |
	firstCard := self chosenCards first.
	^ self chosenCards allSatisfy: [ :aCard | 
			aCard isFlipped and: [ firstCard symbol = aCard symbol ] ]
]

{ #category : #initialization }
MgdGameModel >> chosenCards [

^ chosenCards 
]

{ #category : #initialization }
MgdGameModel >> completeStep [ 

	self chosenCards 
		do: [ :aCard | aCard disappear  ];
		removeAll.
]

{ #category : #initialization }
MgdGameModel >> gridSize [

	"Return grid size total amount of cards is gridSize^2"
	^4
]

{ #category : #initialization }
MgdGameModel >> initialize [ 
	super initialize.
	availableCards := OrderedCollection new.
	chosenCards := OrderedCollection new.
]

{ #category : #initialization }
MgdGameModel >> initializeForSymbols: characters [

	self 
		assert: [ characters size = (self cardsCount / self matchesCount ) ]
		description: [ 'Amount of characters must be equals to possible all combinations' ].
	availableCards := (characters asArray collect: [ :aSymbol |
			(1 to:self matchesCount )collect: [  :i |
			MgdCardModel new symbol: aSymbol ] ])
	flattened shuffled asOrderedCollection .
]

{ #category : #initialization }
MgdGameModel >> matchesCount [ 

	"How many chosen cards should match in order for them to disappear"
	^ 2
]

{ #category : #initialization }
MgdGameModel >> resetStep [

	|lastCard |
	lastCard := self chosenCards last.
	self chosenCards 
		allButLastDo: [ :aCard | aCard flip ];
		removeAll;
		add: lastCard.
]

{ #category : #initialization }
MgdGameModel >> shouldCompleteStep [
	^ self chosenCards size = self matchesCount 
		and: [  self chosenCardMatch ]
]

{ #category : #initialization }
MgdGameModel >> shouldResetStep [ 
	
	^ self chosenCards size > self matchesCount .
]
