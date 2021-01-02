class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user
      t.text    :text
      t.boolean :is_private, default: false
      t.timestamps
    end
  end
end
