class RemoveIsMerchantFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :is_merchant, :boolean
  end
end
