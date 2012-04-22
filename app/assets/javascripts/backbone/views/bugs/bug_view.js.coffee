Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.BugView extends Backbone.View
  template: JST["backbone/templates/bugs/bug"]

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
