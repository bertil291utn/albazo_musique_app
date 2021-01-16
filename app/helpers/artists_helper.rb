module ArtistsHelper
  def genre_edit(genre)
    genre ? genre.map(&:to_param) : ""
  end

  def slug_user(obj)
    obj.network.URL + obj.user_name
  end
end
