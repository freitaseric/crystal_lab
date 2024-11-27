require "http/server"

server = HTTP::Server.new [
  HTTP::ErrorHandler.new,
  HTTP::LogHandler.new,
  HTTP::CompressHandler.new,
  HTTP::StaticFileHandler.new "public"
  ]

address = server.bind_tcp 4321
puts "Listening on http://#{address}"

server.listen