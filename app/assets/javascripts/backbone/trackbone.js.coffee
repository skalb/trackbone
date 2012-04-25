#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Trackbone =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

window.toggleSelected = (el) ->
  $(el).addClass('selected')
  # $(el).siblings().removeClass('selected')