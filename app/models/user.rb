class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, authentication_keys: [:login]

  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true

  attr_accessor :login

  def login
    @login || self.username || self.email
  end

  def comment_created
    # Same as number_of_comments +=1
    self.number_of_comments = number_of_comments + 1
    save
    return number_of_comments
  end

  # Access the Relationship Object.
  has_many :followed_users,
           foreign_key: :follower_id,
           class_name: "Relationship",
           dependent: :destroy

  # Accesses the user through the relationship object.
  has_many :followees, through: :followed_users, dependent: :destroy

  # Access the Relationship Object.
  has_many :following_users,
           foreign_key: :followee_id,
           class_name: "Relationship",
           dependent: :destroy

  # Accesses the user through the relationship object.
  has_many :followers, through: :following_users, dependent: :destroy

  # Like Feature
  has_many :likes

  private

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { value: login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end
end
