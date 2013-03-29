class App.Views.Content extends Backbone.View

  className: "row"

  template: HandlebarsTemplates['app/templates/content']

  render: ->
    @$el.html(@template())
    @

  initialize: ->
    @listenTo App.Vent, "project:create", @swapMainToEmpty
    @listenTo App.Vent, "project:new", @swapMainToNewProject
    @listenTo App.Vent, "project:show", @projectShow
    @listenTo App.Vent, "project:destroy", @swapMainToEmpty
    @listenTo App.Vent, "project:edit", @editProject
    @listenTo App.Vent, "user:logged_in", @swapMainToEmpty
    @listenTo App.Vent, "access_denied", @accessDenied

  accessDenied: ->
    @swapMain(new App.Views.AccessDenied())

  editProject: (model) ->
    @swapMain(new App.Views.NewProject({ model: model }))
    Backbone.history.navigate('projects/edit/' + model.id)

  projectShow: (model) ->
    @swapMain(new App.Views.ProjectDetails({ model: model }))

  swapMainToEmpty: ->
    @swapMain(new App.Views.Empty())

  swapMainToNewProject: ->
    @swapMain(new App.Views.NewProject({ model: new App.Models.Project }))
    Backbone.history.navigate("/projects/new")

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.leave() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentSideView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentSideView: (v) ->
    @currentSideView.leave() if @currentSideView
    @currentSideView = v
