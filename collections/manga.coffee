@Manga = new Meteor.Collection("manga")

@Manga.allow insert: (userId, doc) ->
    # Only allow posting if User is logged in
    !!userId
