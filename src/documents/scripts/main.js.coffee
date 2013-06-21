screenState = 'normal'
mediaQuerySmall  = window.matchMedia "(max-width: 701px)"

firstGuest = document.querySelectorAll '.guest:first-of-type'
allGuests = document.querySelectorAll '.guest'
totalGuests = allGuests.length

guestOriginalDimention = 233
gridOriginalSpacing = 1

setSmallLayout = ->
	screenState = 'small'
	firstGuest[0].style.height = window.getComputedStyle(firstGuest[0]).getPropertyValue 'width'

	if totalGuests > 1
		guestsComputedWidth = window.getComputedStyle(allGuests[1]).getPropertyValue 'width'
		allGuests[i].style.height = guestsComputedWidth for i in [1..totalGuests-1]
		return

setNormalLayout = ->
	unless screenState is 'normal'
		screenState = 'normal'
		firstGuest[0].style.height = "#{(guestOriginalDimention * 2) + gridOriginalSpacing}px"
		allGuests[i].style.height = "#{guestOriginalDimention}px" for i in [1..totalGuests-1]
		return

if totalGuests > 0
	firstGuestOriginalWidth = window.getComputedStyle(firstGuest[0]).getPropertyValue 'width'

	if totalGuests > 1
		allGuestsOriginalWidth = window.getComputedStyle(allGuests[1]).getPropertyValue 'width'

	setSmallLayout() if mediaQuerySmall.matches

	window.onresize = ->
		if mediaQuerySmall.matches then setSmallLayout() else setNormalLayout()