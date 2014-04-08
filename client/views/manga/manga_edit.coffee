Template.mangaEdit.events
    "submit form": (e) ->
        e.preventDefault()
        currentMangaId = @_id
        mangaProperties =
            title: $(e.target).find("[name=title]").val()
            embedCode: $(e.target).find("[name=embedCode]").val()
            description: $(e.target).find("[name=description]").val()

        Manga.update currentMangaId,
            $set: mangaProperties
        , (error) ->
            if error
                # Display the error to the user
                alert error.reason
            else
                Router.go "mangaPage",
                _id: currentMangaId

            return
        return
    
    "click .delete": (e) ->
        e.preventDefault()
        if confirm("Delete this manga?")
            currentMangaId = @_id
            Manga.remove currentMangaId
            Router.go "mangaList"
        return
