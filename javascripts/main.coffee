handleLink = ->
  $('a').off('click').on 'click', (e) ->
    $el = $ e.currentTarget
    href = $el.attr 'href'
    return if href[0] isnt '/'
    e.preventDefault();
    path = url 'path', href
    route_url(path or '/')
    return false

handlePath = (path, $base_el) ->

  switch path
    when '/'
      $el = $base_el.find('.rewrite')
      $base_el.find('.additions').remove
      $el.lettering()
      $spans = $el.find('> span')
      async.eachLimit $spans, 4, ((char, next) ->
        $char = $ char
        x = Math.random() * 700 - 350
        y = Math.random() * 700 - 350
        $char.attr {
          'style': "transform: translate(#{x}px, #{y}px);"
        }
        setTimeout (->
          $char.addClass 'show'
          next()
        ), 400
      ), ->
        $sub = $('<span class = "additions"> Welcome to Our Wedding Website </span>')
        $sub.hide()
        $base_el.append $sub
        setTimeout ( ->
          $sub.fadeIn()
        ), 1000


route_url = (path) ->
  $('#body').attr('class','')
  path = path || url 'path'

  data = path.split('/')
  history.replaceState(null, null, path);

  new_path = "/#{data[1] or ''}"



  $("[data-route]").hide()
  $el = $("[data-route='#{new_path}']")
  handlePath new_path, $el
  $el.fadeIn()

  $link = $("#navigation a[href='#{new_path}']")
  $link.addClass 'active'
  $link.siblings().removeClass 'active'

route_url()
handleLink()


