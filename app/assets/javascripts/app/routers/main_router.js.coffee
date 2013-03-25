class App.Routers.MainRouter extends Backbone.Router

  routes:
    "": "index"
    "projects": "project"

  initialize: ->
    @headerView = new App.Views.Header()
    @contentView = new App.Views.Content()

  index: ->
    @layoutViews()

  project: ->
    @layoutViews()

  layoutViews: ->
    $('#header').html(@headerView.render().el)
    $('#content').html(@contentView.render().el)

