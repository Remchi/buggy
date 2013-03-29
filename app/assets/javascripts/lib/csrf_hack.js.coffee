window.csrf = (token) ->
  $.ajaxSetup
    beforeSend: (xhr, settings) ->
      return if (settings.type is "GET")
      xhr.setRequestHeader('X-CSRF-Token', token) if token

$ ->
  window.csrf($('meta[name="csrf-token"]').attr('content'))
