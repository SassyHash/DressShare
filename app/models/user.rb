class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, 
    :remember_me, :school_id, :uid, :provider
  attr_protected :points

  has_many :dresses, :foreign_key => :owner_id
  has_many :rentals
  has_many :borrowed_dresses, :through => :rentals, :source => :dresses
  belongs_to :school


  validates :email, :presence => true, :uniqueness => {:case_sensitive => false, :message => 'You already have an account.'},
            :format => {:with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, :message => "Invalid E-mail" }
  validates :last_name, :presence => true
  validates :first_name, :presence => true
  validates :school_id, :presence => true

  before_save :lower_case_email

  def forgot_password
    @user = User.find_by_email(params[:email])
    random_password = Array.new(10).map { (65 + rand(58)).chr }.join
    @user.password = random_password
    @user.save!
    Mailer.create_and_deliver_password_change(@user, random_password)
  end

  def lower_case_email
    self.email = self.email.chomp.downcase
  end

end
