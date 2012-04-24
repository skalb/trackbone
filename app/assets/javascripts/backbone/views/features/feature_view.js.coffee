Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.FeatureView extends Backbone.View
  template: JST["backbone/templates/item"]

  initialize: () ->
    # For some reason, the model no longer has a reference to
    # it's collection when we select() it
    # As a hack, I'm keeping a reference to the collection
    @collection = @options.model.collection

  events:
    "click .select" : "select"
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  select: () -> 
    window.toggleSelected(@el)
    
    # This is a hack to get around the unexplained reason
    # why model.collection is undef at this point 
    @model.collection = @collection
    
    @model.loadBugs()
    do (@model) ->
      @model.bugs.fetch success: ->
        bugsView = new Trackbone.Views.Bugs.IndexView(items: @model.bugs)
        $("#list-bugs").html(bugsView.render().el)

        # We should probably only render this once instead of each load
        newBugsView = new Trackbone.Views.Bugs.NewView(collection: @model.bugs)
        $("#new-bugs").html(newBugsView.render().el)

    @model.bugs.fetch()

  destroy:( ) ->
    # This is a hack to get around the unexplained reason
    # why model.collection is undef at this point 
    @model.collection = @collection

    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
