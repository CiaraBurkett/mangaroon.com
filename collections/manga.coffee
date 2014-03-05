@Manga = new Meteor.Collection("manga")

@Manga.allow
    update: ownsDocument
    remove: ownsDocument

@Manga.deny
    update: (userId, manga, fieldNames) ->
        # May only edit the following three fields
        return (_.without(fieldNames, "title", "authot", "description").length > 0)

@Meteor.methods manga: (mangaAttributes) ->
    user = Meteor.user()
    mangaWithSameLink = Manga.findOne(url: mangaAttributes.url)

    # Ensure the user is logged in
    throw new Meteor.Error(401, "You need to be logged in to post new mangas!") unless user

    # Ensure the manga has a title
    throw new Meteor.Error(422, "Don't forget to add the manga title.") unless mangaAttributes.title

    # Check that there are no previous manga with the same link
    throw new Meteor.Error(302, "This manga has already been posted.", mangaWithSameLink._id) if mangaAttributes.url and mangaWithSameLink

    # Pick out the whitelisted keys
    manga = _.extend(_.pick(mangaAttributes, "cover", "title", "author", "description"),
        userId: user._id
        author: user.username
        submitted: new Date().getTime()
    )
    mangaId = Manga.insert(manga)
    mangaId
