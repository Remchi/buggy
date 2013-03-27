class App.Views.Project extends Backbone.View

  template: HandlebarsTemplates['app/templates/project']

  initialize: ->
    @listenTo @model, 'destroy', @remove
    @listenTo @model, 'change:name', @render
    @listenTo App.Vent, 'test', @log

  log: ->
    console.log "test"

  events:
    "click a": "showDetails"

  showDetails: (e) ->
    e.preventDefault()
    App.Vent.trigger "project:show", @model
    Backbone.history.navigate "/projects/" + @model.id

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
