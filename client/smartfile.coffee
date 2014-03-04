smartfile = new SmartFile(publicRootUrl: "https://file.ac/2ewsByMDlIQ/")

Template.newManga.events submit: (event, template) ->
    event.preventDefault()
    form = template.find("newManga")
    file = form.cover.files[0]
    smartfile.upload file, (err, result) ->
        form.reset()
        console.log "Upload public URL:" + smartfile.resolvePublic(result)
        return
    return

