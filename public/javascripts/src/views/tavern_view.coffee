define [
    'backbone'
    'views/base_view'
    'jade!tmpl/tavern'
], (
    Backbone
    BaseView
    template
) ->
    class TavernView extends BaseView
        constructor : (@model) ->
            super
            @listenTo @model, 'change', @render
            @model.fetch()

        render : =>
            @$el.html template @model.toJSON()
            document.body.appendChild @el
