Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.ProjectView extends Backbone.View
  template: JST["backbone/templates/shared/item"]

  events:
    "click .select" : "select"
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  select: () -> 
    window.toggleSelected(@el)
    @model.loadFeatures()
    do (@model) ->
      @model.features.fetch success: ->
        featuresView = new Trackbone.Views.Features.IndexView(features: @model.features)
        $("#list-features").html(featuresView.render().el)

        # We should probably only render this once instead of each load
        newFeaturesView = new Trackbone.Views.Features.NewView(collection: @model.features)
        $("#new-features").html(newFeaturesView.render().el)

        $("#list-bugs").html('')
        $("#new-bugs").html('')
    @model.features.fetch()

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this