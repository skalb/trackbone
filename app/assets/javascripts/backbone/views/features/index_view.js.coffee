#= require ../index_view

Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Features"

  getView: (options) =>
    new Trackbone.Views.Features.FeatureView(options)
