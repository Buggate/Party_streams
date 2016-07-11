class AddAttachmentImageToBookings < ActiveRecord::Migration
  def self.up
    change_table :bookings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bookings, :image
  end
end
