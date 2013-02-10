requirejs.config({
    baseUrl: '/javascripts/app/',
    paths : {
        'tmpl' : '../../templates',
        'backbone' : '../lib/backbone',
        'underscore' : '../lib/underscore-min',
        'jade' : '../lib/jade',
        'jquery' : '../lib/jquery-1.9.1.min'
    },
    shim : {
        'backbone' : {
            deps: ['underscore', 'jquery'],
            exports : 'Backbone'
        },
        'underscore' : {
            exports : '_'
        },
        'jquery' : {
            exports : 'jQuery'
        }
    }
});

requirejs(
    ['backbone', 'app'],
    function(Backbone, App) {
        window.app = new App();
        Backbone.history.start({pushState: true, hashChange: false, silent: true});
    }
);
