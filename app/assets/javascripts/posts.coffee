$(document).on "turbolinks:load", ->
  $(".posts-index").ready ->
    next_page = 2
    finish_posts = false
    loading = false
      
    reload = (page) ->
      $('.load').show()
      loading = true
      $.get '/posts.js?page=' + page, (data) ->
        loading = false
        $('.load').hide()
        if(data.length == 0)
          finish_posts = true

    $(window).scroll ->
      if $(window).scrollTop() + $(window).height() == $(document).height()
        if(finish_posts == false && loading == false)
          reload(next_page++)
      return

    $(document).on "click", ".reload", (e)->
      $('#posts').html('')
      reload(1)
      next_page = 2
      finish_posts = false
