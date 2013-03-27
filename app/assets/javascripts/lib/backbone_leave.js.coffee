Backbone.View.prototype.leave = ->
  @remove()
  @off()
  if @childViews
    @childViews.forEach (v) -> v.leave()
