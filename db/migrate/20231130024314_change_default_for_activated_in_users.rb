class ChangeDefaultForActivatedInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :activated, from: false, to: true
  end
end
