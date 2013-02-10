define [
    'backbone'
    'views/base_view'
    'jade!tmpl/intro'
], (
    Backbone
    BaseView
    template
) ->
    class Intro extends BaseView
        el : 'body' # this is a view that takes over the whole screen

        render : ->
            @$el.html template
                taverns : [
                    name : 'bleep'
                ]
