Template.PeopleList.helpers
  people: ->
    # Временно. Сделать, как с событиями.
    Meteor.users.find()