Trackbone.Views.Projects ||= {}

class Trackbone.Views.Projects.NewView extends Backbone.View
  template: JST["backbone/templates/projects/new"]

  events:
    "submit #new-project": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    name = $("#new-project #name").val()
    if name
      $("#new-project #name").val('')
      @collection.create(name: name)

  render: ->
    $(@el).html(@template())

    return this
