define [
    'backbone'
    'underscore'
], (
    Backbone
    _
) ->
    class BaseView extends Backbone.View
        constructor : ->
            super
            @subviews = {}

        adopt : (view) ->
            @subviews[view.cid] = view

        orphan : (cid) ->
            cid = cid.cid if cid.cid?
            view = @subviews[cid]
            delete @subviews[cid]
            view

        cleanSubview : (cid) ->
            if cid?
                @orphan(cid).remove()
            else
                @cleanSubview view.cid for own view in @subviews
