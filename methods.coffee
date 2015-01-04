Meteor.methods
  updateProfile: (doc) ->
    Meteor.users.update Meteor.userId(),
      $set:
        profile: doc
