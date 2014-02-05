Router.configure
    layoutTemplate: "layout"
    loadingTemplate: "loading"
    waitOn: () ->
        Meteor.subscribe "manga"

Router.map () ->
    @route "mangaList",
        path: "/"
