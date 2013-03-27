class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['app/templates/new_project']

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, 'sync', @render
    @listenTo @model, 'invalid', @renderErrors

    @model.fetch() unless @model.isNew()

  renderErrors: (model, errors) ->
    @$('.error').removeClass('error')
    @$('span.help-inline').remove()
    _.each errors, @renderError, @

  renderError: (errors, attribute) ->
    err = errors.join "; "
    @$('#' + attribute).closest('div.control-group').addClass('error')
    @$('#' + attribute).closest('div.controls').append('<span class="help-inline">' + err + '</span>')

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: @$('#name').val()
    @model.set description: @$('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model
