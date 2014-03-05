Template.mangaPage.helpers
    ownManga: ->
        @userId is Meteor.userId()
