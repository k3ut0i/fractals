"
A Morph to draw simple pixels on.
Mostly using drawDotOn:at:color:
"
Class {
	#name : #DotCanvas,
	#superclass : #BorderedMorph,
	#instVars : [
		'width',
		'height',
		'dots'
	],
	#category : #'Newton-Fractals'
}

{ #category : #'instance creation' }
DotCanvas class >> width: w height: h dots: d [

	| s |
	s := self new.
	s width: w.
	s height: h.
	s dots: d.
	^ s.
]

{ #category : #accessing }
DotCanvas >> dots: aCollection [

	dots := aCollection
]

{ #category : #drawing }
DotCanvas >> drawDotOn: aCanvas at: aPoint color: aColor [
	aCanvas fillRectangle: (aPoint rectangle: aPoint + (1@1)) color:  aColor.

	
]

{ #category : #drawing }
DotCanvas >> drawDots: aCollection on: aCanvas [

	aCollection do: [ :aPoint | self drawDotOn: aCanvas at: aPoint color: Color black ].
]

{ #category : #drawing }
DotCanvas >> drawOn: aCanvas [

	super drawOn: aCanvas.
	self drawDots: dots on: aCanvas.
]

{ #category : #initialization }
DotCanvas >> initialize [

	super initialize.
	width ifNil: [ width := 1000 ].
	height ifNil: [ height := 1000 ].
	dots ifNil: [ dots := #() ].
	self extent: width @ height.
]
