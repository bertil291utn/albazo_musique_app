module ArtistsHelper
  @i = 0

  def genre_edit(genre)
    genre ? genre.map(&:to_param) : ""
  end

  def network_edit(network, index)
    network ? network.map(&:network_id)[index.to_i] : ""
  end

  def slug_user(obj)
    obj.network.URL + obj.user_name
  end
end
