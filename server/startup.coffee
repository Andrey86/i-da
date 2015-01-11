Meteor.startup ->
  if not Categories.find().count()
    mtgId = Categories.insert
      title: "MTG"
    Categories.insert
      title: "футбол"

  if not Events.find().count()
    Events.insert
      title: "игра в Magic"
      description: "просто игра вечером"
      categoryId: mtgId
      place:
        address: "Лениская слобода, 19"
        loc:
          type: "Point"
          coordinates: [37.653065, 55.708633]
      party: []
      leaderId: 'asdqwe'
      tags: ['magic', 'мотыга']
