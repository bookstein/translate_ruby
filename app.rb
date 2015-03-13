#!/usr/bin/env ruby
require 'sinatra'
require 'haml'
require 'active_record'

set :root, File.dirname(__FILE__) # set root as parent directory of current file

# load tab-separated file as a hash
translations = Hash.new
datafile = File.open("translations.txt", "r").each do |line|
  id, ruby_method, python_method = line.strip.split
  translations[ruby_method] = python_method
  translations
end



# render index page (route) with get
get '/' do
  @translations = translations
  haml :index, :format => :html5, :locals => {:translations => translations}
end
