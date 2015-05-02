class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.string :body
      t.references :article, index: true, foreign_key: true
      t.string :ancestry, index: true
      t.timestamps null: false
    end
  end
end