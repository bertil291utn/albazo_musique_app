module ArtistsHelper
  def genre_edit(genre)
    genre ? genre.map(&:to_param) : ""
  end
end
