Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.NewView extends Backbone.View
  template: JST["backbone/templates/features/new"]

  events:
    "submit #new-feature": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (feature) =>
        @model = feature
        window.location.hash = "/#{@model.id}"

      error: (feature, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
