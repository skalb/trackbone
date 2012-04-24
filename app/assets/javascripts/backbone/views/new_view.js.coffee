Trackbone.Views.Projects ||= {}

class Trackbone.Views.NewView extends Backbone.View
  template: JST["backbone/templates/new"]

  events:
    "submit #new-item": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    name = @.$("#new-item #name").val()
    if name
      $("#new-item #name").val('')
      @collection.create(name: name)

  render: ->
    $(@el).html(@template(type: @options.type))

    return this