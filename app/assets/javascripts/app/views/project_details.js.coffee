class App.Views.ProjectDetails extends Backbone.View

  template: HandlebarsTemplates['app/templates/project_details']

  initialize: ->
    @listenTo @model, "sync", @render
    @model.fetch()

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
