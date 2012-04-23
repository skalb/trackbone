Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.IndexView extends Backbone.View
  template: JST["backbone/templates/features/index"]

  initialize: () ->
    @options.features.bind('reset', @addAll)

  addAll: () =>
    @options.features.each(@addOne)

  addOne: (feature) =>
    view = new Trackbone.Views.Features.FeatureView({model : feature})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(features: @options.features.toJSON() ))

    return this
