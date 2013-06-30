screenState = 'normal'
mediaQuerySmall  = window.matchMedia "(max-width: 701px), (max-device-width: 701px)"

firstGuest = document.querySelectorAll('.guest:first-of-type')[0]
allGuests = document.querySelectorAll '.guest'
infos = document.querySelectorAll '.guest-info'
totalGuests = allGuests.length
totalInfos = infos.length

firstGuestOriginalDimension = null
guestsOriginalDimension = null

# apagar depois
guestPlaceholders = document.querySelectorAll '.guest-placeholder'
totalGuestPlaceholders = guestPlaceholders.length
# apagar depois

setSmallLayout = ->
	screenState = 'small'
	firstGuest.style.height = getWidth firstGuest
	newDimesion = getWidth allGuests[1]

	for i in [1...totalGuests]
		allGuests[i].style.height = newDimesion

	for i in [1...totalInfos]
		infos[i].style.height = newDimesion

	# apagar depois
	for i in [0...totalGuestPlaceholders]
		guestPlaceholders[i].style.lineHeight = newDimesion
	# apagar depois

	return

setNormalLayout = ->
	unless screenState is 'normal'
		screenState = 'normal'
		firstGuest.style.height = firstGuestOriginalDimension

		for i in [1...totalGuests]
			allGuests[i].style.height = guestsOriginalDimension

		for i in [1...totalInfos]
			infos[i].style.height = guestsOriginalDimension

		# apagar depois
		for i in [0...totalGuestPlaceholders]
			guestPlaceholders[i].style.lineHeight = guestsOriginalDimension
		# apagar depois

	return

getWidth = (element) ->
	window.getComputedStyle(element).getPropertyValue 'width'

if totalGuests > 0
	firstGuestOriginalDimension = getWidth(firstGuest)
	guestsOriginalDimension = getWidth(allGuests[1])

	setSmallLayout() if mediaQuerySmall.matches

	window.onresize = ->
		if mediaQuerySmall.matches then setSmallLayout() else setNormalLayout()