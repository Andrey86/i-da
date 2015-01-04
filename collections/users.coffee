Meteor.users.allow
  update: (userId, doc, fieldNames, modifier) ->
    if doc._id is userId and fieldNames.length is 1 and fieldNames[0] is 'coordinates'
      true
    else
      false
