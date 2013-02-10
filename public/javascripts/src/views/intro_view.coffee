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
        render : ->
            @$el.html template
                taverns : [
                    name : 'bleep'
                ]
            @el
