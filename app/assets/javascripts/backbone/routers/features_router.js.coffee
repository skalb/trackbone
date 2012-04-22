class Trackbone.Routers.FeaturesRouter extends Backbone.Router
  initialize: (options) ->
    @features = new Trackbone.Collections.FeaturesCollection()
    @features.reset options.features

  routes:
    "new"      : "newFeature"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newFeature: ->
    @view = new Trackbone.Views.Features.NewView(collection: @features)
    $("#new-features").html(@view.render().el)

  index: ->
    @view = new Trackbone.Views.Features.IndexView(features: @features)
    $("#features").html(@view.render().el)

  show: (id) ->
    feature = @features.get(id)

    @view = new Trackbone.Views.Features.ShowView(model: feature)
    $("#features").html(@view.render().el)

  edit: (id) ->
    feature = @features.get(id)

    @view = new Trackbone.Views.Features.EditView(model: feature)
    $("#features").html(@view.render().el)
