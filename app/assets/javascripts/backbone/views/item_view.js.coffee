Trackbone.Views.Projects ||= {}

class Trackbone.Views.ItemView extends Backbone.View
  template: JST["backbone/templates/item"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"
  className: "item"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    name = @model.get("name")
    id = @model.get("id")
    url = "#{@model.collection.url()}/#{id}"
    $(@el).html(@template(name: name, id: id, url: url))
    if (@options.selected)
      window.toggleSelected(@el)
    return this