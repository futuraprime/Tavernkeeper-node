requirejs.config({
    baseUrl: '/javascripts/app/',
    paths : {
        'tmpl' : '../../templates',
        'backbone-core' : '../lib/backbone',
        'backbone' : '../lib/backbone-relational',
        'underscore' : '../lib/underscore-min',
        'jade' : '../lib/jade',
        'jquery' : '../lib/jquery-1.9.1.min'
    },
    shim : {
        'backbone' : {
            deps: ['backbone-core'],
            exports : 'Backbone'
        },
        'backbone-core' : {
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
        Backbone.history.start();
    }
);
