class AlterBookingDetails < ActiveRecord::Migration

  def change

    remove_column("bookings", "live", :time )
  	remove_column("bookings", "on_demand", :time )

  	add_index :bookings, "user_id"

  end

end
