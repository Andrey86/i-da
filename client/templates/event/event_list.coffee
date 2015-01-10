Template.EventList.helpers
  events: ->
    selector = _id: $in: Session.get("closeEvents") or []
    if Session.get("tagsFilter")
      selector.tags = $all: Session.get("tagsFilter")
    Events.find selector

Template.EventList.events
  "slide #range-slider": ->
    range = $("#range-slider").slider("getValue")
    if range != Session.get "rangeValue"
      Session.set "rangeValue", range
      Meteor.call 'getCloseEvents', range, (err, result) ->
        Session.set "closeEvents", result

  "change #tags-search": (e) ->
    Session.set "tagsFilter", e.val

Template.EventList.rendered = ->
  $("#range-slider").slider
    min: 1
    max: 30
    formater: (value) -> "до #{value} км"

  $("#tags-search").select2
    tags: []
