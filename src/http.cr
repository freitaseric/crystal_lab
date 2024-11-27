require "http/server"
require "http/status"

def index(req, res)
  res.content_type = "text/plain"
  res.print "Hello from Web Server!"
end

def about(req, res)
  res.content_type = "text/plain"
  res.print "About Us"
end

def not_found(req, res)
  res.content_type = "text/plain"
  res.status = HTTP::Status::NOT_FOUND
  res.print "404 Not Found"
end

server = HTTP::Server.new do |ctx|
  case ctx.request.path
  when "/"
    index ctx.request, ctx.response
  when "/about"
    about ctx.request, ctx.response
  else
    not_found ctx.request, ctx.response
  end
end

address = server.bind_tcp 8080
puts "Listening on http://#{address}"

server.listen
