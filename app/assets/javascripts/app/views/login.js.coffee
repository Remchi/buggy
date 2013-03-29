class App.Views.Login extends Backbone.View

  template: HandlebarsTemplates['app/templates/login']

  events:
    "click button": "login"

  initialize: ->
    @listenTo @model, "error", @renderError

  renderError: ->
    @$('.alert').html("Credentials are not valid").show()

  login: (e) ->
    e.preventDefault()
    @model.set username: @$('#username').val()
    @model.set password: @$('#password').val()
    @model.save()

  render: ->
    @$el.html(@template())
    @
