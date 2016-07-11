class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index, :show]
 

  
  def index

    @bookings = current_user.bookings
    

  end

 
  def show
  end

  
  def new

    
    @booking = current_user.bookings.build

  end

  
  def edit
  end

  
  def create

    @booking = current_user.bookings.build(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   def upvote

    @booking = Booking.find(params[:id])
    @booking.upvote_by current_user
      redirect_to :back

  end

  def downvote

    @booking = Booking.find(params[:id])
    @booking.downvote_by current_user
      redirect_to :back
  end

  private
    
    def set_booking
      @booking = Booking.find(params[:id])

    end

  
  
   def authorized_user

      @booking = current_user.booking.find_by(id: params[:id])
      redirect_to links_path, notice: "Not authorized to edit this booking" if @booking.nil?

    end



   
    def booking_params

      params.require(:booking).permit(:title, :description, :venue_address, :hostname, :age,
                                      :video, :picture, :both, :duration, :image, :live_schedule_date,
                                       :on_demand_schedule_date)

    end
end
