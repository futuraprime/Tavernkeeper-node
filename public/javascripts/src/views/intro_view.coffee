define [
    'backbone'
    'views/base_view'
    'collections/Taverns'
    'models/Tavern'
    'jade!tmpl/intro'
], (
    Backbone
    BaseView
    Taverns
    Tavern
    template
) ->
    class Intro extends BaseView
        constructor : ->
            super
            @setElement 'body' # this is a view that takes over the whole screen
            @taverns = new Taverns
            @listenTo(@taverns, 'sync', @render)

            @taverns.fetch
                success : @render

        events : 
            'submit form.new-tavern' : 'createTavern'

        render : =>
            @$el.html template
                taverns : @taverns.toJSON()

        createTavern : (evt) ->
            evt.preventDefault()
            data = { name: $(evt.target).find("[name=name]").val()}
            # tavern = new Tavern data
            tavern = @taverns.create data,
                wait: true

        remove : ->
            super
            @stopListening()
