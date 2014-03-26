Meteor.publish "manga", ->
    Manga.find()

Meteor.publish "singleUser", (userId) ->
    Meteor.users.find userId

Meteor.publish "authors", (userIds) ->
    return Meteor.users.find _id: $in: userIds
