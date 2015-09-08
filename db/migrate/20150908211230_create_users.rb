class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :image
      t.string :bio
      t.string :website
      t.string :extra
      t.string :token
    end
  end
end
