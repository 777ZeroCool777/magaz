class MusicAlbum < Product

  # метод обновляет поля класса
  def update_product(options)
    @album_name = options[:album_name]
    @author_name = options[:author_name]
    @genre = options[:genre]
  end

  # метод возвращает инфу о товаре - всё кроме цены и кол-ва
  def product_info
    "Диск \"#{@album_name}\", - #{@author_name}, жанр (#{@genre})"
  end
end