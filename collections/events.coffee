@Events = new Meteor.Collection "events"

Events.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    doc.leaderId is userId or
    _.isEqual(modifier, $addToSet: party: userId) or
    _.isEqual(modifier, $pull: party: userId)
