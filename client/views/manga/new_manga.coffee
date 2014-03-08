sf = new SmartFile(publicRootUrl: "https://file.ac/2ewsByMDlIQ/")

Template.newManga.events "submit form": (e) ->
    e.preventDefault()

    manga =
        cover: $(e.target).find("[name=cover]").val()
        title: $(e.target).find("[name=title]").val()
        author: $(e.target).find("[name=author]").val()
        description: $(e.target).find("[name=description]").val()

    file = manga.cover.files[0]

    sf.upload file, (err, result) ->
        manga.reset()
        console.log "Upload public URL:" + sf.resolvePublic(result)
        return

    Meteor.call "manga", manga, (error, id) ->
        return alert(error.reason) if error

        Router.go "mangaPage",
            _id: id

        return
