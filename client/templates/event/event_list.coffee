Template.EventList.helpers
  events: ->
    Events.find
      _id: $in: Session.get("closeEvents") or []

Template.EventList.events
  "slide #range-slider": ->
    range = $("#range-slider").slider("getValue")
    if range != Session.get "rangeValue"
      Session.set "rangeValue", range
      Meteor.call 'getCloseEvents', range, (err, result) ->
        Session.set "closeEvents", result

Template.EventList.rendered = ->
  $("#range-slider").slider
    min: 1
    max: 30
    formater: (value) -> "до #{value} км"
