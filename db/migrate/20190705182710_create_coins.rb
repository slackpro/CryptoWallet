class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :moeda
      t.string :sigla
      t.string :url_imagem

      t.timestamps
    end
  end
end
