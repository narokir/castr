# == Schema Information
#
# Table name: jobs
#
#  id                   :bigint           not null, primary key
#  company_name         :string
#  description          :text
#  featured             :boolean          default(FALSE)
#  listing_expires      :datetime
#  pay_interval         :string
#  payment              :string
#  payment_details      :text
#  published            :boolean          default(FALSE)
#  shoot_end_date       :datetime
#  shoot_location       :string
#  shoot_start_date     :datetime
#  special_instructions :text
#  title                :string
#  union_status         :string
#  url                  :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  member_id            :bigint           not null
#
# Indexes
#
#  index_jobs_on_member_id  (member_id)
#
# Foreign Keys
#
#  fk_rails_...  (member_id => members.id)
#
class Job < ApplicationRecord

  # ASSOCIATIONS
  # ======================================================================
  belongs_to :member
  has_many :roles, dependent: :destroy
  accepts_nested_attributes_for :roles, reject_if: lambda { |attributes| attributes["role_name"].blank? }, allow_destroy: true
  has_one_attached :production_image
  # has_rich_text :description

  # VALIDATIONS
  # ======================================================================
  validate :acceptable_image
  validates :title, presence: true
  validates :description, presence: true
  validates :shoot_location, presence: true

  # SCOPES
  # ======================================================================
  scope :featured, -> { where(featured: true).order(created_at: :desc) }
  scope :published, -> { where(published: true).order(created_at: :desc) }

  # CONSTANTSS
  # ======================================================================
  UNION_STATUS = ["Any", "SAG", "SAG-AFTRA", "Nonunion"]
  PAY_INTERVAL = ["Hour", "Day", "Week", "Month", "Project"]
  LOCATION = ["Albuquerque", "Santa Fe", "Taos", "Las Vegas", "Espanola"]

  # HELPERS
  # ======================================================================
  def acceptable_image
    return unless production_image.attached?
    errors.add(:production_image, "is nil") if production_image.attached?.nil?
    errors.add(:production_image, "is too big") unless production_image.byte_size <= 3.megabyte
    acceptable_types = ["image/jpeg", "image/png"]
    errors.add(:production_image, "must be JPEG or PNG") unless acceptable_types.include?(production_image.content_type)
  end

  def some_image # display some_image if attached blob is nil
    "https://dummyimage.com/800x600/f0f0f0/d4d4d4"
  end
end
