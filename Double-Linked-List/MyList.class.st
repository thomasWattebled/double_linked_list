Class {
	#name : #MyList,
	#superclass : #Object,
	#instVars : [
		'tail',
		'head'
	],
	#category : #'Double-Linked-List'
}

{ #category : #adding }
MyList >> add: aValue [

	| prevTail node|
	node := Node new value: aValue .
	head ifNil: [ head := node.
						tail := node.
						^ aValue ].				
	tail ifNotNil: [ prevTail := tail ].
	prevTail next: node.
	node prev: prevTail .
	self tail: node.
	^ aValue
]

{ #category : #adding }
MyList >> add: aValue after: aValueInList [
	
	| nextNode midNode prevNode |
	prevNode := self find: aValueInList.
	midNode := Node new value: aValue.
	prevNode next ifNotNil: [ 
			nextNode := prevNode next.
			prevNode next: midNode. 
			midNode prev: prevNode .
			midNode next: nextNode .
			nextNode prev: midNode .  ] 
		ifNil: [  tail:= midNode.
			midNode prev: prevNode  ] .
	
	
	
]

{ #category : #adding }
MyList >> add: aValue before: aValueInList [
	
	| nextNode midNode prevNode |
	nextNode := self find: aValueInList.
	midNode := Node new value: aValue.
	nextNode prev ifNotNil: [ 
			prevNode := nextNode prev.
			prevNode next: midNode. 
			midNode prev: prevNode .
			midNode next: nextNode .
			nextNode prev: midNode .  ] 
		ifNil: [  head:= midNode.
			midNode next: nextNode ] .
	
	
	
]

{ #category : #adding }
MyList >> find: aValue [

	| current |
	current := head.
	 [ current isNil ] whileFalse: [
        (current value = aValue)
            ifTrue: [ ^ current ] 
            ifFalse: [ current := current next ] 
    ].
^ false
]

{ #category : #adding }
MyList >> head [

^ head
]

{ #category : #adding }
MyList >> head: aNode [

head := aNode
]

{ #category : #adding }
MyList >> includes: aValue [

	| current |
	current := head.
	 [ current isNil ] whileFalse: [
        (current value = aValue)
            ifTrue: [ ^ true ] 
            ifFalse: [ current := current next ] 
    ].
^ false
]

{ #category : #adding }
MyList >> isEmpty [

^ head isNil
]

{ #category : #adding }
MyList >> size [ 

	| compteur current |
	compteur := 0.
	current := head.
	 [ current isNil ] whileFalse: [
        compteur := compteur +1.
        current := current next ].
^ compteur
]

{ #category : #adding }
MyList >> tail [ 

^ tail
]

{ #category : #adding }
MyList >> tail: aNode [

tail := aNode
]
