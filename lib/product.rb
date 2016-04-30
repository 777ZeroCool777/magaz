class Product

  attr_reader :price, :kol_vo

  def initialize(price, kol_vo)
    @price = price
    @kol_vo = kol_vo
  end

  def update
    # todo # дочерние классы сами разберутся
  end

  def product_info
    # todo # дочерние в курсе
  end

  # метод показывает всю инфу о товаре
  def show_product_info
    "#{product_info} - #{price} руб. [осталось: #{kol_vo}]"
  end

  # статический метод - показывает все товары
  def self.show_all_products(products)
    products.each_with_index do |type, index|
      puts "#{index}: #{type.show_product_info}"
    end
  end

  # обрабатывает запрос о покупке
  def buy
    if kol_vo > 0
      puts "\n***"
      puts "Вы купили товар #{product_info}"
      puts "***"
      @kol_vo -= 1
      price
    else
      puts "\nТовара нет на складе"
      0
    end
  end

  # статический метод - возвращает массив с продуктами
  def self.read_from_xml(file_name)

    begin
      file_name = File.dirname(__FILE__) + "../../" + file_name
    rescue Errno::ENOENT => e
      puts "Файл products.xml не найден :("
      abort e.message
    end

    file = File.new(file_name, "r:utf-8")

    doc = REXML::Document.new(file)

    file.close

    result = []

    product = nil

    doc.elements.each("/products/product") do |product_node|
      price = product_node.attributes["price"].to_i
      kol_vo = product_node.attributes["kol_vo"].to_i


      product_node.elements.each("book") do |book_node|
        product = Book.new(price, kol_vo)
        product.update(
            book_name: book_node.attributes["book_name"],
            author: book_node.attributes["author_name"]
        )
      end

      product_node.elements.each("film") do |film_node|
        product = Film.new(price, kol_vo)
        product.update(
            film_name: film_node.attributes["film_name"],
            direct_name: film_node.attributes["direct_name"],
            year: film_node.attributes["year"]
        )
      end

      product_node.elements.each("music_album") do |music_album_node|
        product = MusicAlbum.new(price, kol_vo)
        product.update(
            album_name: music_album_node.attributes["album_name"],
            author_name: music_album_node.attributes["author_name"],
            genre: music_album_node.attributes["genre"]
        )
      end
      result.push(product)
    end

    result
  end
end