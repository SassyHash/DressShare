class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :remember_me
  attr_protected :points

  has_many :dresses, :foreign_key => :owner_id
  has_many :rentals

  has_many :borrowed_dresses, :through => :rentals, :source => :dresses


  validates :email, :presence => true, :uniqueness => {:case_sensitive => false},
            :format => {:with => /\A([^@\s]+)@dartmouth.edu/i, :message => "Invalid Dartmouth E-mail. Do you already have an account?" }
  validates :last_name, :presence => true
  validates :first_name, :presence => true

  before_save {|user| user.email = email.downcase }

  def forgot_password
    @user = User.find_by_email(params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end

end
