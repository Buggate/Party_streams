class CreateBookings < ActiveRecord::Migration


    def up

    create_table :bookings do |t|
    	t.string :title
        t.text :description
        t.text :venue_address
        t.string :hostname
        t.string :age
        t.date :live
        t.time :live
        t.date :on_demand
        t.time :on_demand
        t.boolean :video
        t.boolean :picture
        t.boolean :both
        t.string :duration
        t.references :user

        t.timestamps
    
    end
  end


   def down

    drop_table :bookings


  end

end




   

