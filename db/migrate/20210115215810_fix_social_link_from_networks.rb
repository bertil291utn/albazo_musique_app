class FixSocialLinkFromNetworks < ActiveRecord::Migration[6.1]
  def change
    rename_column :networks, :social_link, :URL
  end
end
