class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user
      t.references :post
      t.references :main_comment, foreign_key: { to_table: :comments }
      t.text :content
      t.timestamps
    end
  end
end
