class UserMailer < ActionMailer::Base
  default from: "notifications@sassyha.sh"

  def request_owner(owner, renter, rental)
    @owner = owner
    @url="http://sassyha.sh/rentals/#{rental.id}"
    @renter, @rental = renter, rental
    @dress = rental.dress
    mail(:to => owner.email, :subject => "Someone Wants To Borrow Your Dress!")
  end

  def notify_renter_accepted(renter, rental)
    @renter, @rental = renter, rental
    @owner, @dress = rental.owner, rental.dress
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => renter.email, :subject => "Your Rental Request Has Been Accepted!")
  end

  def notify_renter_denied(renter, rental)
    @renter, @rental = renter, rental
    @owner, @dress = rental.owner, rental.dress
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => renter.email, :subject => "Your Rental Request Has Been Denied.")
  end

  def notify_renter_owner_changes(renter, owner, rental)
    @renter, @owner = renter, owner
    @rental = rental
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => renter.email, :subject => "Your rental request has been changed.")
    mail(:to => owner.email, :subject => "Rental request for your dress has been changed")
  end
end
