Template.newManga.events
    "submit form": (e) ->
        e.preventDefault()

    manga =
        cover: $(e.target).find("[name=cover]").val(),
        title: $(e.target).find("[name=title]").val(),
        author: $(e.target).find("[name=author]").val(),
        description: $(e.target).find("name=description]").val()

    manga._id = Manga.insert(manga)
    Router.go "mangaPage", manga
