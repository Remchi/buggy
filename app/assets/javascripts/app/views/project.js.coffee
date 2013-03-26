class App.Views.Project extends Backbone.View

  template: HandlebarsTemplates['app/templates/project']

  initialize: ->
    @listenTo @model, 'destroy', @remove

  events:
    "click a": "showDetails"

  showDetails: (e) ->
    e.preventDefault()
    App.Vent.trigger "project:show", @model
    Backbone.history.navigate "/projects/" + @model.id

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
