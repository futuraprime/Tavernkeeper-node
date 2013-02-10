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
            @listenTo(@taverns, 'add remove sync', @render)

            @taverns.fetch
                success : @render

        events : 
            'submit form.new-tavern' : 'createTavern'
            'click .delete-tavern' : 'removeTavern'

        render : =>
            @$el.html template
                taverns : @taverns.toJSON()

        createTavern : (evt) ->
            evt.preventDefault()
            data = { name: $(evt.target).find("[name=name]").val()}
            # tavern = new Tavern data
            tavern = @taverns.create data,
                wait: true

        removeTavern : (evt) ->
            evt.preventDefault()
            tavern = @taverns.get(evt.currentTarget.dataset.id)
            tavern.destroy
                success: -> 'destroyed the tavern!'
            @taverns.remove tavern

        remove : ->
            super
            @stopListening()
