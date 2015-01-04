Meteor.startup ->
  i18n.setLanguage "ru"

  if navigator.geolocation
    Meteor.setInterval ->
      if Meteor.userId()
        navigator.geolocation.getCurrentPosition (position) ->
          Meteor.users.update Meteor.userId(),
            $set:
              "profile.coordinates": position.coords
    , 1000


SimpleSchema.debug = true