Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.ShowView extends Backbone.View
  template: JST["backbone/templates/features/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
