class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :email
      t.decimal :telefone
      t.string :endereco
      t.string :site

      t.timestamps
    end
  end
end
