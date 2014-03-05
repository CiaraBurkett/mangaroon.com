Template.mangaItem.helpers
    ownManga: ->
        @userId is Meteor.userId()
