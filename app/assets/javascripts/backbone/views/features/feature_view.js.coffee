Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.FeatureView extends Backbone.View
  template: JST["backbone/templates/features/feature"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
