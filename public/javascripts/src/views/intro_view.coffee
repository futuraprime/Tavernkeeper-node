define [
    'backbone'
    'views/base_view'
    'models/Tavern'
    'jade!tmpl/intro'
], (
    Backbone
    BaseView
    Tavern
    template
) ->
    class Intro extends BaseView
        constructor : ->
            super
            @setElement 'body' # this is a view that takes over the whole screen

        events : 
            'submit form.new-tavern' : 'createTavern'

        render : ->
            @$el.html template
                taverns : [
                    name : 'bleep'
                ]

        createTavern : (evt) ->
            evt.preventDefault()
            data = { name: $(evt.target).find("[name=name]").val()}
            tavern = new Tavern data
            tavern.save()
