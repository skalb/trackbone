Trackbone.Views.Projects ||= {}

class Trackbone.Views.ItemView extends Backbone.View
  template: JST["backbone/templates/item"]

  events:
    "click .select" : "select"
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  select: () -> 
    if @model.loadChildren
      window.toggleSelected(@el)
      @model.loadChildren()
      do (@model, @renderChildren) ->
        @model.children.fetch(
          success: @renderChildren(@model.children)
        )
        @model.children.fetch()

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this