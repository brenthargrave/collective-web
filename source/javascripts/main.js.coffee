#= require_tree .
#= require jquery
#= require jquery-externalize

$ ->
  $('a[href*="//"]').externalize()

