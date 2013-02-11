define [
    'backbone'
    'views/base_view'
    'views/tavern_view'
    'collections/Taverns'
    'models/Tavern'
    'jade!tmpl/intro'
], (
    Backbone
    BaseView
    TavernView
    Taverns
    Tavern
    template
) ->
    class Intro extends BaseView
        constructor : ->
            super
            @taverns = new Taverns
            @listenTo(@taverns, 'add remove sync', @render)

            @taverns.fetch
                success : @render

        events : 
            'submit form.new-tavern' : 'createTavern'
            'click .visit-tavern' : 'showTavern'
            'click .delete-tavern' : 'removeTavern'

        render : =>
            @$el.html template
                taverns : @taverns.toJSON()
            document.body.appendChild @el

        createTavern : (evt) ->
            evt.preventDefault()
            data = { name: $(evt.target).find("[name=name]").val()}
            # tavern = new Tavern data
            tavern = @taverns.create data,
                wait: true

        # this method only necessary until routing is set up
        showTavern : (evt) ->
            evt.preventDefault()
            tavern = @taverns.get(evt.currentTarget.dataset.id)
            tavern_view = new TavernView(tavern)
            @remove()
            tavern_view.render()

        removeTavern : (evt) ->
            evt.preventDefault()
            tavern = @taverns.get(evt.currentTarget.dataset.id)
            tavern.destroy
                success: -> 'destroyed the tavern!'
            @taverns.remove tavern

        remove : ->
            super
            @stopListening()
