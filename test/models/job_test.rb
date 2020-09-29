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
require 'test_helper'

class JobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
