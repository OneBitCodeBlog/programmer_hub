$(document).on "turbolinks:load", ->
  readURL = (input) ->
    if input.files and input.files[0]
      reader = new FileReader

      reader.onload = (e) ->
        $('#image_upload_preview').attr 'src', e.target.result
        return

      reader.readAsDataURL input.files[0]
    return

  $('#user_avatar').on 'change', ->
    readURL this
    return false