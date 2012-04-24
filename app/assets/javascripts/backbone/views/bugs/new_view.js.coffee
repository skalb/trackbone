Trackbone.Views.Bugs ||= {}

class Trackbone.Views.Bugs.NewView extends Backbone.View
  template: JST["backbone/templates/new"]

  events:
    "submit #new-bug": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    name = $("#new-bug #name").val()
    if name
      $("#new-bug #name").val('')
      @collection.create(name: name)

  render: ->
    $(@el).html(@template(type: "Bug"))

    return this