@Events = new Meteor.Collection "events"

Events.allow
  insert: (userId, doc) ->
    true
  update: (userId, doc, fieldNames, modifier) ->
    true