Meteor.methods
  getCloseEvents: (km) ->
    user = Meteor.users.findOne(@userId)
    console.log [[user.profile.coordinates.longitude, user.profile.coordinates.latitude], km / 6371]
    (e._id for e in Events.find(
      "place.loc": $geoWithin: $centerSphere:
        [[user.profile.coordinates.longitude, user.profile.coordinates.latitude],
         km / 6371]
      ).fetch()
    )

  createEvent: (doc) ->
    console.log doc
    newEvent =
      title: doc.title
      description: doc.description
      datetime: doc.datetime
      tags: doc.tags or []
      leader: @userId
      place:
        address: doc.address

    eventId = Events.insert newEvent
    if doc.address
      results = Geo.getCoordinatesByAddress doc.address
      if results.length
        Events.update eventId,
          $set:
            "place.loc":
              type: "Point"
              coordinates: [
                results[0].geometry.location.lng
                results[0].geometry.location.lat
              ]
    eventId

  locationAutocomplete: Geo.locationAutocomplete
