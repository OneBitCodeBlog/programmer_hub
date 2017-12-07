$(document).on "turbolinks:load", -> 
  $('body').on 'ajax:success', '.like', (e, data, status, xhr) ->
    $(e.target).hide()
    $('.unlike_' + e.target.id).show()
    count = parseInt($('.like_count_' + e.target.id).html())
    $('.like_count_' + e.target.id).html(count + 1)

  $('body').on 'ajax:error', '.like', (e, data, status, xhr) ->
    Materialize.toast('Problem in like post', 4000, 'red')

  $('body').on 'ajax:success', '.unlike', (e, data, status, xhr) ->
    $(e.target).hide()
    $('.like_' + e.target.id).show()
    count = parseInt($('.like_count_' + e.target.id).html())
    $('.like_count_' + e.target.id).html(count - 1)

  $('body').on 'ajax:error', '.unlike', (e, data, status, xhr) ->
    Materialize.toast('Problem in unlike post', 4000, 'red')