smartfile = new SmartFile()

smartfile.configure
    key: "ScVRhVgX34agT0TPlYVTm78weHEgMS"
    password: "gb9k7Vnn3CxuEoG52pMTdao1yBvUKY"
    basePath: "uploads"

smartfile.onUpload = (result, options) ->
    # Result is the Smartfile API JSON response
    console.log "File uploaded to " + result[0].path
    return

smartfile.onUploadFail = (error, options) ->
    console.log "Smartfile returned error", error.statusCode, error.detail
    return

