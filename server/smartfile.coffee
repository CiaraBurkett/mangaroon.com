sf = new SmartFile()

sf.configure
    key: "ScVRhVgX34agT0TPlYVTm78weHEgMS"
    password: "gb9k7Vnn3CxuEoG52pMTdao1yBvUKY"
    basePath: "uploads"

sf.onUpload = (result, options) ->
    # Result is the Smartfile API JSON response
    console.log "File uploaded to " + result[0].path
    return

sf.onUploadFail = (error, options) ->
    console.log "Smartfile returned error", error.statusCode, error.detail
    return

