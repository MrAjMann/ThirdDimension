class ChangeColumn < ActiveRecord::Migration[6.0]
  def change
    t.text :description
  end
end
