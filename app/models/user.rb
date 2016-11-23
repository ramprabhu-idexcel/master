class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_secure_token
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :events, dependent: :destroy
  validates :first_name, :last_name, :email, :username, :phone, :age, presence: true
  validates :username, :email, uniqueness: true

  def name
    first_name + last_name
  end
end
