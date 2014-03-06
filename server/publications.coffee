Meteor.publish "manga", ->
    Manga.find()

Meteor.publish "singleUser", (userId) ->
    Meteor.users.find userId
