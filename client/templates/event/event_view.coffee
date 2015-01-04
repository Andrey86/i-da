Template.EventView.helpers
  eventParty: ->
    Meteor.users.find
      _id: $in: @party

  canJoin: ->
    Meteor.userId() not in @party

  canLeave: ->
    Meteor.userId() in @party

Template.EventView.events
  'click #join-btn': ->
    Events.update @_id,
      $addToSet: party: Meteor.userId()
  'click #leave-btn': ->
    Events.update @_id,
      $pull: party: Meteor.userId()