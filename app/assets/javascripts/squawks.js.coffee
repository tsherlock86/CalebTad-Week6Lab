# From Rails Casts

jQuery ->
  $(window).scroll ->
    url = $('.pagination .next a').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 80
      $('.pagination').text("Loading more squawks...")
      $.getScript(url)
