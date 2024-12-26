"
Information that each pixel in the image holds.
- color
- pixel position in the image
- cnum: the complex number that corresponds to the pixel
- converges: Does the point converge? It could be an inflection point that diverges on either side of pertubation??
"
Class {
	#name : #PixelInfo,
	#superclass : #Object,
	#instVars : [
		'color',
		'position',
		'cnum',
		'converges'
	],
	#category : #'Newton-Fractals'
}

{ #category : #accessing }
PixelInfo >> cnum [
	^ cnum
]

{ #category : #accessing }
PixelInfo >> cnum: aCNumber [
	cnum := aCNumber.
]

{ #category : #accessing }
PixelInfo >> color [
	^ color
]

{ #category : #accessing }
PixelInfo >> color: aColor [
	color := aColor.
]

{ #category : #accessing }
PixelInfo >> converges [
	^ converges

]

{ #category : #accessing }
PixelInfo >> converges: aBool [
	converges := aBool.
]

{ #category : #accessing }
PixelInfo >> position [
	^ position

]

{ #category : #accessing }
PixelInfo >> position: aPoint [
	position := aPoint.
]
