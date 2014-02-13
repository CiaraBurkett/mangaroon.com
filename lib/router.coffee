Router.configure
    layoutTemplate: "layout"
    loadingTemplate: "loading"
    waitOn: () ->
        Meteor.subscribe "manga"

Router.map () ->
    @route "mangaList",
        path: "/"

    @route "mangaPage",
        path: "/manga/:_id"
        data: () ->
            Manga.findOne @params._id

    @route "newManga",
        path: "/new"

requireLogin = () ->
    unless Meteor.user()
        @render "accessDenied"
        @stop()
    return

Router.before requireLogin,
    only: "newManga"
