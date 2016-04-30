# encoding: utf-8
# Магазинчик в котором за псевдоденьги можно купить псевдотовар
# Этот код необходим при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
###

require 'rexml/document'
require_relative 'lib/product.rb'
require_relative 'lib/film.rb'
require_relative 'lib/book.rb'
require_relative 'lib/music_album.rb'

file_name = "data/products.xml"

products = Product.read_from_xml(file_name)



###
bablo = 0 # сюда приходит доход от магазина
###

choice = nil

# интерфейс
until choice == "x"
  puts "Что хотите купить?"

  puts

  Product.show_all_products(products)

  puts "x. Покинуть магазин"

  choice = STDIN.gets.chomp

  if choice != "x" && choice.to_i >= 0 && choice.to_i <= products.length - 1
    laveshka = products[choice.to_i].buy

    bablo += laveshka

    puts
  end
end

puts "\nСпасибо за покупки, с вас #{bablo} руб."