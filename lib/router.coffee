Router.configure
    layoutTemplate: "layout"
    loadingTemplate: "loading"
    waitOn: () ->
        Meteor.subscribe "posts"

Router.map () ->
    @route "mangaList",
        path: "/"
