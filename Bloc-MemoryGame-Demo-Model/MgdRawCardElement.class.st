Class {
	#name : #MgdRawCardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'backSide',
		'flippedSide'
	],
	#category : #'Bloc-MemoryGame-Demo-Model'
}

{ #category : #'as yet unclassified' }
MgdRawCardElement >> backSide [
	^ backSide ifNil: [ self initializeBackSide ]
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> backgroundPaint [
	^ Color lightGray

]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> card [
	^ card
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> card: aCard [ 
	 card:= aCard.
	self initializeAnnouncements
	

	"card isFlipped
		ifTrue: [ self drawBackside  ]
		ifFalse: [ self drawFlippedSide  ].

	card announcer
		when: MGCardFlippedAnnouncement
			send: #onFlipped to: self;
		when: MGCardDisappearAnnouncement
			send: #onDisappear to: self"
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> click [

	self parent memoryGame choosenCard: self card.
	self drawCardElement
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> cornerRadius [
	^ 10
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> disappear [
	self visibility: BlVisibility hidden
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> drawBackside [

	self removeChildren.
	self addChild: self backSide
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> drawCardElement [

	self card isFlipped
		  ifTrue: [ self drawFlippedSide ]
		  ifFalse: [ self drawBackside ]
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> drawFlippedSide [

	self removeChildren.
	self addChild: self flippedSide
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> flippedSide [

	^ flippedSide ifNil: [ self initializeFlippedSide ]
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initialize [
	super initialize.
	self size: 80 @ 80.
	self background: self backgroundPaint.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: self cornerRadius).
	self card: (MgdCardModel new symbol: $a).
	self drawCardElement.
	self layout: BlFrameLayout new.
	self addEventHandlerOn: BlClickEvent do: [ :anEvent | self click ]
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initializeAnnouncements [

	card announcer
		when: MgdCardDisappearAnnouncement
		send: #disappear
		to: self.
	card announcer
		when: MgdCardFlipBackAnnouncement
		send: #drawBackSide
		to: self
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initializeBackSide [

	| firstLine secondLine cross |
	firstLine := self initializeFirstLine.
	secondLine := self initializeSecondLine.

	cross := BlElement new
		         addChildren: {
				         firstLine.
				         secondLine };
		         constraintsDo: [ :c |
			         c horizontal matchParent.
			         c vertical matchParent ].

	^ cross
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initializeFirstLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightGreen width: 3);
			geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	line
		when: BlElementLayoutComputedEvent
		do: [ :e | line geometry from: 0 @ 0 to: line parent extent ].
	^ line
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initializeFlippedSide [

	| elt |
	elt := BlTextElement new text: self card symbol asRopedText.
	elt text fontName: 'Source Sans Pro'.
	elt text fontSize: 50.
	elt text foreground: Color white.
	elt constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	^ elt
]

{ #category : #'as yet unclassified' }
MgdRawCardElement >> initializeSecondLine [

	| line |
	line := BlElement new
		        border: (BlBorder paint: Color lightGreen width: 3);
			geometry: BlLineGeometry new;
		        outskirts: BlOutskirts centered.
	line when: BlElementLayoutComputedEvent do: [ :e |
		line geometry from: 0 @ line parent height to: line parent width @ 0 ].
	^ line
]
