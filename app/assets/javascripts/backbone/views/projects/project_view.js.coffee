Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.ProjectView extends Backbone.View
  template: JST["backbone/templates/projects/project"]

  events:
    "click .select" : "select"
    "click .destroy" : "destroy"

  tagName: "tr"

  select: () -> 
    @model.loadFeatures()
    do (@model) ->
      @model.features.fetch success: ->
        featuresView = new Trackbone.Views.Features.IndexView(features: @model.features)
        $("#features").html(featuresView.render().el)
        $("#bugs").html('')
    @model.features.fetch()

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
