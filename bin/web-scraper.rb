# version=2
require 'json'
require 'open-uri'
require 'nokogiri'
html = open("https://www.officialcharts.com/charts/singles-chart/")
response = Nokogiri::HTML(html)
description = response.css("table")
# puts description
dict = Hash.new
songs = description.css("div[class='title-artist']")
song = ''
artist = ''
titles = songs.css('div').select do |title|
  if title['class'] == "title"
    song = title.text.strip
  end
  if title['class'] == "artist"
    artist = title.text.strip
  end
  if song != "" && artist != ""
    dict[song] = artist
  end
end
puts dict.to_json