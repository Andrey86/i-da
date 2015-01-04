Template.EventView.helpers
  eventParty: ->
    Meteor.users.find
      _id: $in: @party

  canJoin: ->
    Meteor.userId() not in @party

  canLeave: ->
    Meteor.userId() in @party and @party.length > 1

  leader: ->
    Meteor.users.findOne @leaderId

Template.EventView.events
  'click #join-btn': ->
    Meteor.call "joinEvent", @_id
  'click #leave-btn': ->
    Meteor.call "leaveEvent", @_id