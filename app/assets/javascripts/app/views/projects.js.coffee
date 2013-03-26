class App.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['app/templates/projects']

  events:
    "click a.btn": "newProject"

  newProject: ->

  initialize: ->
    @listenTo @collection, "reset", @render
    @collection.fetch({ reset: true })

  render: ->
    @$el.html(@template())
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new App.Views.Project({ model: model })
    @$('ul').append(v.render().el)
