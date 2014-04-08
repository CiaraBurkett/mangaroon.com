
Template.newManga.events "submit form": (e) ->
    e.preventDefault()

    manga =
        cover: $(e.target).find("[name=cover]").val()
        embedCode: $(e.target).find("[name=embedCode]").val()
        title: $(e.target).find("[name=title]").val()
        author: $(e.target).find("[name=author]").val()
        description: $(e.target).find("[name=description]").val()

    Meteor.call "manga", manga, (error, id) ->
        return alert(error.reason) if error

        Router.go "mangaPage",
            _id: id

        return
