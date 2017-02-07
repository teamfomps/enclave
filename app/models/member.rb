class Member < ApplicationRecord
  attr_accessor :mobile_number
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
  validates :mobile_number, phone_number: true

  before_create :set_handle

  def full_name
    [first_name, last_name].join(' ')
  end

  # def mailboxer_email(object)
  #   email
  # end

  protected

  def set_handle
    self.handle = full_name.sub('.', ' ').gsub(/\s+/, '.').downcase
  end

  def set_e164_phone_number
    return unless mobile_number
    # Twilio needs phone numbers in E.164 format
    p = Phoner::Phone.parse(mobile_number)
    self.e164_number = p.format(:default)
  end
end
