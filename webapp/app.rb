#!/usr/bin/env ruby

require "sinatra"
require "openssl"
require "base64"

configure do
  enable :inline_templates
end

helpers do
  include ERB::Util
end

set :environment, :production

get "/" do
  @title = "Sesame Street"
  erb :index
end

get "/get_file" do
  filename = params["filename"].to_s
  if filename =~ /^[a-z.\/]*$/
    return open(filename).read
  end
end



__END__

@@ layout
<!doctype html>
<html>
 <head>
   <style>
    html, body {
        height: 100%;
        background-color: black;
        height: 100%;
        margin: 0px;
        padding: 0px;
        color: white;
        font-family: courier, monospace;
        text-align: center;
    }
    h1 {
        margin-top: 5%;
    }
    a {
        color: green;
    }
    input {
        padding: 10px;
    }
  </style>
  <title><%= h @title %></title>
 </head>
 <body>
  <div class="box">
    <h1><%= h @title %></h1>
    <p><%= yield %></p>
  </div>
 </body>
</html>

@@ index
Welcome to sesame street!
<br />
<img src="/get_file?filename=images/cookie.jpg" />
