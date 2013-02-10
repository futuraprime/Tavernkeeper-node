(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(['backbone', 'views/base_view', 'jquery', 'views/intro_view'], function(Backbone, BaseView, $, IntroView) {
    var App;
    return App = (function(_super) {

      __extends(App, _super);

      function App() {
        var _this = this;
        App.__super__.constructor.apply(this, arguments);
        console.log('starting app');
        this.intro = new IntroView;
        $(function() {
          return _this.render();
        });
      }

      App.prototype.render = function() {
        $('body').empty().append(this.el);
        return this.el.appendChild(this.intro.render());
      };

      return App;

    })(BaseView);
  });

}).call(this);
