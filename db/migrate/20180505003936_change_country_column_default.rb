class ChangeCountryColumnDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :business_profiles, :country, :string, default: 'Australia'
   end
   
   def down
    change_column :business_profiles, :country, :string, default: nil
   end
end
