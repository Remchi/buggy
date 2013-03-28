class App.Views.NewIssue extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_issue']

  events:
    "click button": "saveIssue"

  initialize: ->
    @listenTo @model, 'error', @parseErrorResponse
    @listenTo @model, 'sync', @success

  success: ->
    @clearForm()
    App.Vent.trigger "issue:create", @model

  clearForm: ->
    @$('#name').val("")
    @$('#description').val("")
    @clearErrors()
    delete @model.id

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveIssue: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save()

_.extend App.Views.NewIssue.prototype, App.Mixins.Validatable
