class AddDetailsToBooking < ActiveRecord::Migration
  
  def up

  	add_column("bookings", "live_schedule_date", :date )
  	 add_column("bookings", "on_demand_schedule_date", :date )

  end

  def down

  	remove_column("bookings", "live_schedule_date", :date )
  	remove_column("bookings", "on_demand_schedule_date", :date )


  end


end
