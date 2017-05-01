// Generated by CoffeeScript 1.8.0
var handleLink, route_url;

handleLink = function() {
  return $('a').off('click').on('click', function(e) {
    var $el, href, path;
    $el = $(e.currentTarget);
    href = $el.attr('href');
    if (href[0] !== '/') {
      return;
    }
    e.preventDefault();
    path = url('path', href);
    route_url(path || '/');
    return false;
  });
};

route_url = function(path) {
  var $link, data, new_path;
  $('#body').attr('class', '');
  path = path || url('path');
  data = path.split('/');
  history.replaceState(null, null, path);
  new_path = "/" + data[1];
  $("[data-route]").hide();
  $("[data-route='" + new_path + "']").fadeIn();
  $link = $("#navigation a[href='" + new_path + "']");
  $link.addClass('active');
  return $link.siblings().removeClass('active');
};

route_url();

handleLink();
