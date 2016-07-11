class AddMemberAndStripeIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member, :boolean
    add_column :users, :stripeid, :string
  end
end
