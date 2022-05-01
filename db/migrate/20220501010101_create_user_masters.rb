class CreateUserMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :user_masters do |t|
      t.string :user_id, limit: 16, null: false, comment: 'ログインID'
      t.string :user_name, limit: 60, null: false, comment: 'ログインユーザ名'
      t.string :password_digest, limit: 128, null: false, comment: 'ログインパスワード'
      t.integer :user_level, limit: 1, null: false, comment: 'ユーザ権限'
      t.string :updated_id, limit: 80, null: false, comment: '最終更新ID'

      t.timestamps
    end
    add_index :user_masters, [:user_id], unique: true, name: 'unique_user_id'
  end

end
