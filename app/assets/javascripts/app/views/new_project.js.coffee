
class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_project']

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, 'sync', @render
    @listenTo @model, 'invalid', @renderErrors
    @listenTo @model, 'error', @parseErrorResponse

    @model.fetch() unless @model.isNew()


  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model

_.extend App.Views.NewProject.prototype, App.Mixins.Validatable
