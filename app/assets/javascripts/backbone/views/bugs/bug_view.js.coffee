Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.BugView extends Backbone.View
  template: JST["backbone/templates/item"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  initialize: () ->
    # For some reason, the model no longer has a reference to
    # it's collection when we select() it
    # As a hack, I'm keeping a reference to the collection
    @collection = @options.model.collection

  destroy: () ->
    # This is a hack to get around the unexplained reason
    # why model.collection is undef at this point 
    @model.collection = @collection
    
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
