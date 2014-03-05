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

    @route "mangaEdit",
        path: "/manga/:_id/edit"
        data: ->
            Manga.findOne @params._id

    @route "newManga",
        path: "/new"

    @route "dashboard",
        path: "/dashboard"

requireLogin = () ->
    unless Meteor.user()
        if Meteor.loggingIn()
            @render(@loadingTemplate)
        else
            @render "accessDenied"
            @stop()
    return

Router.before requireLogin,
    only: "newManga"
