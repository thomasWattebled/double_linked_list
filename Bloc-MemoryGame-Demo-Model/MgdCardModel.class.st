Class {
	#name : #MgdCardModel,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #'Bloc-MemoryGame-Demo-Model'
}

{ #category : #initialization }
MgdCardModel >> announcer [ 
^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #initialization }
MgdCardModel >> disappear [
	self notifyDisappear
]

{ #category : #initialization }
MgdCardModel >> flip [ 

	flipped := flipped not.
	self notifyFlipped
]

{ #category : #initialization }
MgdCardModel >> initialize [ 
	super initialize .
	flipped := false.
]

{ #category : #initialization }
MgdCardModel >> isFlipped [

^ flipped
]

{ #category : #initialization }
MgdCardModel >> notifyDisappear [
	self announcer announce: MgdCardDisappearAnnouncement new. 
]

{ #category : #initialization }
MgdCardModel >> notifyFlipped [
	self announcer announce: MgdCardFlippedAnnouncement new. 
]

{ #category : #initialization }
MgdCardModel >> printOn: aStream [

	aStream 
		nextPutAll: 'Card';
		nextPut: Character space;
		nextPut: $(;
		nextPut: self symbol;
		nextPut: $).
]

{ #category : #initialization }
MgdCardModel >> symbol [
	^ symbol
]

{ #category : #initialization }
MgdCardModel >> symbol: aCharacter [

	symbol := aCharacter 
]
