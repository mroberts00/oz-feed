class AddConfirmableToBusinesses < ActiveRecord::Migration[5.2]
  def up
    add_column :businesses, :confirmation_token, :string
    add_column :businesses, :confirmed_at, :datetime
    add_column :businesses, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :businesses, :confirmation_token, unique: true
    # Business.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    Business.all.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end
 
  def down
    remove_columns :businesses, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :businesses, :unconfirmed_email # Only if using reconfirmable
  end
end
