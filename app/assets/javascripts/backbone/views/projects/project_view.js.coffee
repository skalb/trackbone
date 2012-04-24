#= require ../item_view

Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.ProjectView extends Trackbone.Views.ItemView
  template: JST["backbone/templates/item"]

  renderChildren: (children) -> 
    featuresView = new Trackbone.Views.Features.IndexView(items: children)
    $("#list-features").html(featuresView.render().el)

    # We should probably only render this once instead of each load
    newFeaturesView = new Trackbone.Views.Features.NewView(collection: children)
    $("#new-features").html(newFeaturesView.render().el)

    $("#list-bugs").html('')
    $("#new-bugs").html('')
