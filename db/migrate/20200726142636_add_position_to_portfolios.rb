class AddPositionToPortfolios < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :position, :integer
  end
end
