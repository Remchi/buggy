App.Mixins.Validatable = 
  renderErrors: (model, errors) ->
    @clearErrors()
    _.each errors, @renderError, @

  clearErrors: ->
    @$('.error').removeClass('error')
    @$('span.help-inline').remove()


  renderError: (errors, attribute) ->
    err = errors.join "; "
    @$('#' + attribute).closest('div.control-group').addClass('error')
    @$('#' + attribute).closest('div.controls').append('<span class="help-inline">' + err + '</span>')

  parseErrorResponse: (model, resp) ->
    if resp and resp.responseText
      errors = JSON.parse resp.responseText
      @renderErrors(model, errors.errors)
