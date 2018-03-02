class AddLastSignInToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :last_sign_in, :datetime
  end
end
