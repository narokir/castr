# == Schema Information
#
# Table name: roles
#
#  id               :bigint           not null, primary key
#  role_description :text
#  role_name        :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  job_id           :bigint           not null
#
# Indexes
#
#  index_roles_on_job_id  (job_id)
#
# Foreign Keys
#
#  fk_rails_...  (job_id => jobs.id)
#
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
