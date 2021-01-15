class AddSocialLinkToNetworks < ActiveRecord::Migration[6.1]
  def change
    add_column :networks, :social_link, :string
  end
end
