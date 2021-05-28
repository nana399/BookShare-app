class AddColumnBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :overrall, :integer
  end
end
