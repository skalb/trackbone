Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.NewView extends Backbone.View
  template: JST["backbone/templates/bugs/new"]

  events:
    "submit #new-bug": "save"

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
      success: (bug) =>
        @model = bug
        window.location.hash = "/#{@model.id}"

      error: (bug, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
