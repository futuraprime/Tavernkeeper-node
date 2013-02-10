requirejs.config({
    baseUrl: '/javascripts/app/',
    paths : {
        'tmpl' : '../../templates',
        'backbone' : '../lib/backbone-min',
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
    ['jquery', 'backbone', 'app'],
    function($, Backbone, App) {
        window.app = new App();
    }
);
