class AddBandRefToAlbums < ActiveRecord::Migration[5.2]
  def change
    add_reference :albums, :band, foreign_key: true
  end
end
