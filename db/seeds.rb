# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

Nokogiri::HTML(open('https://news.ycombinator.com/news?p=1')).css(".storylink").each { |link| Story.create(title: link.content, url: link.values.first, created_by_id: 1 }

# https://news.ycombinator.com
# https://news.ycombinator.com/news?p=2
# https://news.ycombinator.com/news?p=3
#
# File.open(Rails.root.join("db/seeds/images/img1.jpg"))
