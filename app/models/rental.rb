class Rental < ActiveRecord::Base
  attr_accessible :dress_id, :end_date, :start_date, :user_id, :accepted

  validates :end_date, :presence => true
  validates :start_date, :presence => true
  validate :start_date_and_end_date
  validate :rental_too_long
  validate :dates_overlap

  belongs_to :dress
  belongs_to :user
  has_one :owner, :through => :dress


private
  def start_date_and_end_date
    if end_date && start_date
      errors.add(:end_date, "End date should be after start date.") if end_date < start_date
    end
  end

  def rental_too_long
    if end_date > start_date
      errors.add(:start_date, "Maximum rental length is three days.") if (end_date)-(start_date) > 3
    end
  end

  def dates_overlap
    others = Rental.where('dress_id = ?', dress_id)
    others.each do |other|
      if (start_date - other.end_date) * (other.start_date - end_date) >= 0
        errors.add(:end_date, "This dress is already requested for #{other.start_date} to #{other.end_date}")
        return
      end
    end
  end


end
