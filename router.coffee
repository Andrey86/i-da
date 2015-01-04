Router.configure
  layoutTemplate: 'Layout'
  onBeforeAction: ->
    if Meteor.userId()
      @next()
    else
      @render 'Login'

Router.route '/',
  template: 'EventList'
  name: "event.list"
  waitOn: ->
    Meteor.subscribe 'events'

Router.route 'events/:_id',
  template: 'EventView'
  name: "event.show"
  data: ->
    Events.findOne @params._id
  waitOn: ->
    [
      Meteor.subscribe 'singeEvent', @params._id
      Meteor.subscribe 'eventParty', @params._id
    ]

Router.route 'create_event',
  template: 'EventCreate'
  name: "event.create"

Router.route 'profile/:_id',
  template: 'Profile'
  name: "profile.edit"
  data: ->
    Meteor.users.findOne @params._id
