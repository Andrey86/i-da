Meteor.startup ->
  i18n.setLanguage 'ru'
  moment.locale 'ru'

  if navigator.geolocation
    Meteor.setInterval ->
      if Meteor.userId()
        navigator.geolocation.getCurrentPosition (position) ->
          Meteor.users.update Meteor.userId(),
            $set: loc:
              type: 'Point'
              coordinates: [
                position.coords.longitude
                position.coords.latitude
              ]
    , 1000


SimpleSchema.debug = true