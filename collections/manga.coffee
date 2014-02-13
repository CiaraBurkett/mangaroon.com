@Manga = new Meteor.Collection("manga")

@Meteor.methods
    manga: (mangaAttributes) ->
        user = Meteor.user()
        mangaWithSameLink = Manga.findOne(url: mangaAttributes.url)
        # Ensure the user is logged in
        unless user
            throw new Meteor.Error(401, "You need to login to add a new manga!")
        # Ensure the manga has a title
        unless mangaAttributes.title
            throw new Meteor.Error(422, "Don't forget to add the manga title.")
        # Check that there are no previous mangas with the same link
         if mangaAttributes.url and mangaWithSameLink
             throw new Meteor.Error(302, "This manga has already been posted.",
             mangaWithSameLink._id)

         # Pick out the whitelisted keys
         manga = _.extend(_.pick(mangaAttributes, "cover", "title", "author", "description"),
             userId: user._id
             author: user.username
             submitted: new Date().getTime()
         )

         mangaId = Manga.insert(manga)

         mangaId

