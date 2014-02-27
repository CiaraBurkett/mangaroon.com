smartfile = new SmartFile()

smartfile.upload file,
    path: "uploads"
, (err,res) ->
    if err
        console.log "upload failed", err
        return

    # Log the public URL of the upload
    console.log "Upload public url:" + smartfile.resolvePublic(res)
    return
