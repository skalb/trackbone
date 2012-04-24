#= require ../index_view

Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.IndexView extends Trackbone.Views.IndexView
  initialize: () ->
    super
    @options.type = "Features"

  getView: (feature) =>
    new Trackbone.Views.Features.FeatureView({model: feature})
