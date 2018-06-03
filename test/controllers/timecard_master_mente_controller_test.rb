require 'test_helper'

class TimecardMasterMenteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get timecard_master_mente_index_url
    assert_response :success
  end

end
