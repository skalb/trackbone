Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.BugView extends Backbone.View
  template: JST["backbone/templates/shared/item"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
