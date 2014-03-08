# sf = new SmartFile(publicRootUrl: "https://file.ac/2ewsByMDlIQ/")

# Template.newManga.events submit: (event, template) ->
#     event.preventDefault()
#     form = template.find("newManga")
#     file = form.cover.files[0]
#     sf.upload file, (err, result) ->
#         form.reset()
#         console.log "Upload public URL:" + sf.resolvePublic(result)
#         return
#     return

