class ChangeColumnCategoryToMenus < ActiveRecord::Migration[5.2]
  def change
    remove_column :menus, :category
    add_column :menus, :category, :string
  end
end
