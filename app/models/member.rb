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

  enumerize :role, in: [:applicant, :member, :admin, :sock_puppet], default: :applicant

  scope :active, -> { where(role: ['member', 'admin']) }
  scope :sock_puppets, -> { where(role: 'sock_puppet') }
  scope :applicants, -> { where(role: 'applicant') }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :mobile_number, phone_number: true, allow_blank: true

  before_create :set_handle

  def full_name
    return handle if role.sock_puppet?
    [first_name, last_name].join(' ')
  end

  protected

  def generate_handle
    candidate = full_name.sub('.', ' ').gsub(/\s+/, '.').downcase
    return candidate unless Member.exists?(handle: candidate)

    counter = 2
    while Member.exists?(handle: "#{candidate}.#{counter}")
      counter += 1
    end

    "#{candidate}.#{counter}"
  end

  def set_handle
    return if handle
    self.handle = generate_handle
  end
end
