# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

# Adapted from: https://leonid.shevtsov.me/post/need-random-sample-images-why-not-imgur/
# Note we have to change ['galler'] to ['data']
gallery = JSON.parse(open('http://imgur.com/gallery.json').read)['data']

# construct URLs
gallery.each {|i| i['url'] = "http://imgur.com/#{i['hash']}#{i['ext']}" }
# select images that aren't too big
gallery.select {|i| i['size'] < 200_000 }
# or images that aren't too small
gallery.select {|i| i['width'] > 400 && i['height'] > 400 }
# select only PNG images
gallery.select {|i| i['ext'] == '.png'}


User.all.each do |user|
user.update_attribute("image_url", gallery[rand(10)]['url'])
end



