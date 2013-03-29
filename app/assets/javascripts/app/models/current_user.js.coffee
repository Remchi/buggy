class App.Models.CurrentUser extends Backbone.Model

  initialize: ->
    @listenTo App.Vent, "user:logged_in", @login

  login: (id, username) ->
    @set id: id, username: username, loggedIn: true
