class Book < Product

  # метод обновляет поля класса
  def update_product(options)
    @book_name = options[:book_name]
    @author_name = options[:author_name]
  end

  # метод возвращает инфу о товаре - всё кроме цены и кол-ва
  def product_info
    "Книга \"#{@book_name}\", автор #{@author_name}"
  end
end