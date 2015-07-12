_isDescendant = (parent, child) ->
  node = child.parentNode

  while node isnt null
    if node is parent
      return true
    node = node.parentNode
  return false

getMouseEnterDirection = (event, el) ->
  width = el.offsetWidth
  height = el.offsetHeight
  x = (event.pageX - el.offsetLeft - (width / 2) * (if width > height then (height / width) else 1))
  y = (event.pageY - el.offsetTop - (height / 2) * (if height > width then (width / height) else 1))
  direction = Math.round(Math.atan2(y, x) / 1.57079633 + 5) % 4

  return direction

addClass = (event, el, state) ->
  direction = getMouseEnterDirection(event, el)
  class_suffix = ""

  el.classList.remove 'move-in-from-top'
  el.classList.remove 'move-in-from-right'
  el.classList.remove 'move-in-from-bottom'
  el.classList.remove 'move-in-from-left'
  el.classList.remove 'move-out-from-top'
  el.classList.remove 'move-out-from-right'
  el.classList.remove 'move-out-from-bottom'
  el.classList.remove 'move-out-from-left'

  switch direction
    when 0 then class_suffix = 'top'
    when 1 then class_suffix = 'right'
    when 2 then class_suffix = 'bottom'
    when 3 then class_suffix = 'left'

  el.classList.add('move-' + state + '-from-' + class_suffix)

guests = document.querySelectorAll('.guest:not(:first-child)')
isMouseOverGuest = false
[].forEach.call(guests, (element, i) ->
  element.addEventListener 'mouseover', (event) ->
    if not isMouseOverGuest
      isMouseOverGuest = true
      addClass(event, this, 'in')

  element.addEventListener 'mouseout', (event) ->
    if event.relatedTarget is null or not _isDescendant element, event.relatedTarget
      isMouseOverGuest = false
      addClass(event, this, 'out')
)
