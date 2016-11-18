class AddRoProductLocaleRegionAndPlantformAndRoProductBoardAndRoProductLocaleLanguageToProps < ActiveRecord::Migration
  def change
    add_column :props, :ro_product_locale_region, :string
    add_column :props, :ro_hardware, :string
    add_column :props, :ro_product_board, :string
    add_column :props, :ro_product_locale_language, :string
  end
end