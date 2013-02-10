(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'underscore'], function(Backbone, _) {
    var BaseView;
    return BaseView = (function(_super) {

      __extends(BaseView, _super);

      function BaseView() {
        BaseView.__super__.constructor.apply(this, arguments);
        this.subviews = {};
      }

      BaseView.prototype.adopt = function(view) {
        return this.subviews[view.cid] = view;
      };

      BaseView.prototype.orphan = function(cid) {
        var view;
        if (cid.cid != null) {
          cid = cid.cid;
        }
        view = this.subviews[cid];
        delete this.subviews[cid];
        return view;
      };

      BaseView.prototype.cleanSubview = function(cid) {
        var view, _i, _len, _ref, _results;
        if (cid != null) {
          return this.orphan(cid).remove();
        } else {
          _ref = this.subviews;
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            view = _ref[_i];
            _results.push(this.cleanSubview(view.cid));
          }
          return _results;
        }
      };

      return BaseView;

    })(Backbone.View);
  });

}).call(this);
