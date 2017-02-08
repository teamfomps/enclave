class Member < ApplicationRecord
  acts_as_messageable
  extend Enumerize
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  enumerize :role, in: [:applicant, :member, :admin], default: :applicant

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :mobile_number, phone_number: true, allow_blank: true

  before_create :set_handle

  def full_name
    [first_name, last_name].join(' ')
  end

  protected

  def set_handle
    self.handle = full_name.sub('.', ' ').gsub(/\s+/, '.').downcase
  end
end
