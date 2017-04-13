# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

Nokogiri::HTML(open('https://news.ycombinator.com/news?p=1')).css(".storylink").each { |link| Story.create(title: link.content, url: link.values.first, created_by_id: 1, image_data: "{\"original\":{\"id\":\"4.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"img1.jpg\",\"size\":8350801,\"mime_type\":null}},\"large\":{\"id\":\"5.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"down20170413-59947-i2whri.jpg\",\"size\":581387,\"mime_type\":null}},\"medium\":{\"id\":\"6.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"down20170413-59947-i2whri20170413-59947-xzxmma.jpg\",\"size\":248120,\"mime_type\":null}},\"small\":{\"id\":\"7.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"down20170413-59947-i2whri20170413-59947-xzxmma20170413-59947-1yq391i.jpg\",\"size\":97255,\"mime_type\":null}},\"thumbnail\":{\"id\":\"8.jpg\",\"storage\":\"store\",\"metadata\":{\"filename\":\"down20170413-59947-i2whri20170413-59947-xzxmma20170413-59947-1yq391i20170413-59947-1g7uy3y.jpg\",\"size\":6351,\"mime_type\":null}}}") }

# https://news.ycombinator.com
# https://news.ycombinator.com/news?p=2
# https://news.ycombinator.com/news?p=3
#
# File.open(Rails.root.join("db/seeds/images/img1.jpg"))
