class UserMailer < ActionMailer::Base
  default from: "notifications@sassyha.sh"

  def request_owner(owner, renter, rental)
    @owner = owner
    @url="http://sassyha.sh/rentals/#{rental.id}"
    @renter = renter
    @rental = rental
    mail(:to => owner.email, :subject => "Someone wants to borrow your dress!")
  end

  def notify_renter

  end
end
