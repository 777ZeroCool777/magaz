class Film < Product

  # метод обновляет поля класса
  def update_product(options)
    @film_name = options[:film_name]
    @direct_name = options[:direct_name]
    @year = options[:year]
  end

  # метод возвращает инфу о товаре - всё кроме цены и кол-ва
  def product_info
    "Фильм \"#{@film_name}\", реж. #{@direct_name} (#{@year})"
  end
end