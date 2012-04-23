Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.IndexView extends Backbone.View
  template: JST["backbone/templates/features/index"]

  initialize: () ->
    @options.features.bind('sync', @render)
    @options.features.bind('reset', @addAll)

  addAll: () =>
    # I didn't figure out exactly why this reset was needed,
    # but without it the features are listed twice.
    @$("tbody").html('')
    @options.features.each(@addOne)

  addOne: (feature) =>
    view = new Trackbone.Views.Features.FeatureView({model : feature})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(features: @options.features.toJSON() ))
    @addAll()

    return this
