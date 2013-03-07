class UserMailer < ActionMailer::Base
  default from: "notifications@sassyha.sh"

  def request_owner(owner, renter, rental)
    @owner = owner
    @url="http://sassyha.sh/rentals/#{rental.id}"
    @renter, @rental = renter, rental
    @dress = rental.dress
    # dress_url = 'http://localhost:3000/dresses/#{@dress.id}/photo.jpg'
    # attachments.inline['image.jpg'] = File.read(dress_url)
    mail(:to => owner.email, :subject => "Someone Wants To Borrow Your Dress!").deliver
  end

  def notify_renter_accepted(renter, rental)
    @renter, @rental = renter, rental
    @owner, @dress = rental.owner, rental.dress
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => renter.email, :subject => "Your Rental Request Has Been Accepted!").deliver
  end

  def notify_renter_denied(renter, rental)
    @renter, @rental = renter, rental
    @owner, @dress = rental.owner, rental.dress
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => renter.email, :subject => "Your Rental Request Has Been Denied.").deliver
  end

  def notify_renter_owner_changes(renter, owner, rental)
    @renter, @owner = renter, owner
    @rental = rental
    @url = "http://sassyha.sh/rentals/#{rental.id}"
    mail(:to => retnter.email), :subject
  end
end
