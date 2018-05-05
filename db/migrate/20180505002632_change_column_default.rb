class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :business_profiles, :state, :string, default: 'NSW'
   end
   
   def down
    change_column :business_profiles, :state, :string, default: nil
   end
end
