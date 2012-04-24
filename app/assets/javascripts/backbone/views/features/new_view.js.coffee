Trackbone.Views.Features ||= {}

class Trackbone.Views.Features.NewView extends Backbone.View
  template: JST["backbone/templates/new"]

  events:
    "submit #new-feature": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    name = $("#new-feature #name").val()
    if name
      $("#new-feature #name").val('')
      @collection.create(name: name)

  render: ->
    $(@el).html(@template(type: "Feature"))

    return this
