Meteor.publish 'events', ->
  Events.find()

Meteor.publish 'singeEvent', (_id) ->
  Events.find _id

Meteor.publish 'eventParty', (_id) ->
  event = Events.findOne _id
  Meteor.users.find
    _id: $in: event.party

Meteor.publish 'userProfile', (_id) ->
  Meteor.users.find _id,
    fields: profile: 1

Meteor.publish 'eventComments', (_id) ->
  Comments.find eventId: _id