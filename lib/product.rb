class Product

  attr_reader :price, :kol_vo

  def initialize(price, kol_vo)
    @price = price
    @kol_vo = kol_vo
  end

  def update_product
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
end