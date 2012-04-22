Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.EditView extends Backbone.View
  template : JST["backbone/templates/bugs/edit"]

  events :
    "submit #edit-bug" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (bug) =>
        @model = bug
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
