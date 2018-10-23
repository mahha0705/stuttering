require 'test_helper'

class QuestionCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get question_comments_create_url
    assert_response :success
  end

end
