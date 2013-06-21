screenState = 'normal'
mediaQuerySmall  = window.matchMedia "(max-width: 701px)"

wrapper = document.querySelectorAll '.wrapper'
header = document.querySelectorAll '.header'
firstGuest = document.querySelectorAll '.guest:first-of-type'
allGuests = document.querySelectorAll '.guest'
infos = document.querySelectorAll '.guest-info'
totalGuests = allGuests.length

wrapperOriginalWidth = window.getComputedStyle(wrapper[0]).getPropertyValue 'width'
firstGuestOriginalWidth = null
guestsOriginalWidth = null
# gridOriginalBorder = null

setSmallLayout = ->
	screenState = 'small'
	wrapper[0].style.width = '100%'
	header[0].style.display = 'none'
	firstGuest[0].style.width = '100%'
	firstGuest[0].style.height = window.getComputedStyle(firstGuest[0]).getPropertyValue 'width'
	# firstGuest[0].style.borderRight = 'none'

	if totalGuests > 1
		newDimesion = parseInt(firstGuest[0].style.height.replace('px', '') / 2) + 'px'
		for i in [1...totalGuests]
			allGuests[i].style.width = allGuests[i].style.height = infos[i].style.width = infos[i].style.height = newDimesion
			# allGuests[i].style.border = 'none'

		return

setNormalLayout = ->
	unless screenState is 'normal'
		screenState = 'normal'
		wrapper[0].style.width = wrapperOriginalWidth
		header[0].style.display = 'block'
		firstGuest[0].style.width = firstGuestOriginalWidth
		firstGuest[0].style.height = firstGuestOriginalWidth
		# firstGuest[0].style.borderRight = gridOriginalBorder

		for i in [1...totalGuests]
			allGuests[i].style.width = allGuests[i].style.height = infos[i].style.width = infos[i].style.height = guestsOriginalWidth

		return

if totalGuests > 0
	firstGuestOriginalWidth = window.getComputedStyle(firstGuest[0]).getPropertyValue 'width'
	# gridOriginalBorder = window.getComputedStyle(firstGuest[0]).getPropertyValue 'border-right'

	if totalGuests > 1
		guestsOriginalWidth = window.getComputedStyle(allGuests[1]).getPropertyValue 'width'

	setSmallLayout() if mediaQuerySmall.matches

	window.onresize = ->
		if mediaQuerySmall.matches then setSmallLayout() else setNormalLayout()