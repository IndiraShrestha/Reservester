class ReservationMailer < ApplicationMailer
  default from: "service@reservester.com"

  #user the tutorial https://www.youtube.com/watch?v=_owXcVLQ20g and https://launchschool.com/blog/handling-emails-in-rails

  def reservation_confirmation(reservation, restaurant)
    @reservation = reservation
    @restaurant = restaurant
    mail(
      to: @reservation.email,
 
      subject: "Reservation Confirmation" 
      )


  end  
end
