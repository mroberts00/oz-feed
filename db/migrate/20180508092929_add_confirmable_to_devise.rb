class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    add_column :donors, :confirmation_token, :string
    add_column :donors, :confirmed_at, :datetime
    add_column :donors, :confirmation_sent_at, :datetime
    # add_column :users, :unconfirmed_email, :string # Only if using reconfirmable
    add_index :donors, :confirmation_token, unique: true
    # Donor.reset_column_information # Need for some types of updates, but not for update_all.
    # To avoid a short time window between running the migration and updating all existing
    # users as confirmed, do the following
    Donor.all.update_all confirmed_at: DateTime.now
    # All existing user accounts should be able to log in after this.
  end

  def down
    remove_columns :donors, :confirmation_token, :confirmed_at, :confirmation_sent_at
    # remove_columns :donors, :unconfirmed_email # Only if using reconfirmable
  end
end
