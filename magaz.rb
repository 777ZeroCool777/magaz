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

require_relative 'lib/product.rb'
require_relative 'lib/film.rb'
require_relative 'lib/book.rb'
require_relative 'lib/music_album.rb'

products = [] # в этом массиве будут храниться продукты

# создаю продукты и пихаю их в массив products

film = Film.new(990, 5)

film.update_product(:film_name => "Леон", :direct_name => "Люк Бессон", :year => 1994)

products.push(film)


film = Film.new(990, 2)

film.update_product(:film_name => "Человек дождя", :direct_name => "Барри Левинсон", :year => 1998)

products.push(film)


film = Film.new(1490, 1)

film.update_product(:film_name => "Тёмный рыцарь", :direct_name => "Кристофер Нолан", :year => 2008)

products.push(film)


book = Book.new(349, 10)

book.update_product(:book_name => "Приключения Том Сойера", :author_name => "Марк Твен")

products.push(book)


music_album = MusicAlbum.new(550, 10)

music_album.update_product(:album_name => "Judas Priest", :author_name => "Turbo",\
 :genre => "Heavy Metal")

products.push(music_album)

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