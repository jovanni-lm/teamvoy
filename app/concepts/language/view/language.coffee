$(document).ready ->
  $('#search_for').keyup ->
    $(this).parents('form').submit()
