Meteor.publish 'events', ->
  Events.find()

Meteor.publish 'singeEvent', (_id) ->
  Events.find(_id)
