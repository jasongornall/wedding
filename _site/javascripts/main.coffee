handleLink = ->
  $('a').off('click').on 'click', (e) ->
    $el = $ e.currentTarget
    href = $el.attr 'href'
    return if href[0] isnt '/'
    e.preventDefault();
    path = url 'path', href
    route_url(path or '/')
    return false

handlePath = (path) ->
  console.log path, '123'
  switch path
    when '/'
      return console.log 'a'
      $('.rewrite').typeIt({
        strings: ['Enter your string here!', 'Another string!']
        breakLines: true
      });

route_url = (path) ->
  $('#body').attr('class','')
  path = path || url 'path'

  data = path.split('/')
  history.replaceState(null, null, path);

  new_path = "/#{data[1] or ''}"

  handlePath new_path

  $("[data-route]").hide()
  $("[data-route='#{new_path}']").fadeIn()

  $link = $("#navigation a[href='#{new_path}']")
  $link.addClass 'active'
  $link.siblings().removeClass 'active'

route_url()
handleLink()


