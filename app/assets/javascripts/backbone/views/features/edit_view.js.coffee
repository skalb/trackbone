Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.EditView extends Backbone.View
  template : JST["backbone/templates/features/edit"]

  events :
    "submit #edit-feature" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (feature) =>
        @model = feature
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
