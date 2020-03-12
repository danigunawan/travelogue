require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url, as: :json
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post entries_url, params: { entry: { comments: @entry.comments, place_id: @entry.place_id, private: @entry.private, rating: @entry.rating, user_id: @entry.user_id, visit_date: @entry.visit_date } }, as: :json
    end

    assert_response 201
  end

  test "should show entry" do
    get entry_url(@entry), as: :json
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { comments: @entry.comments, place_id: @entry.place_id, private: @entry.private, rating: @entry.rating, user_id: @entry.user_id, visit_date: @entry.visit_date } }, as: :json
    assert_response 200
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response 204
  end
end
