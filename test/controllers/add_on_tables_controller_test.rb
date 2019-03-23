require 'test_helper'

class AddOnTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add_on_table = add_on_tables(:one)
  end

  test "should get index" do
    get add_on_tables_url, as: :json
    assert_response :success
  end

  test "should create add_on_table" do
    assert_difference('AddOnTable.count') do
      post add_on_tables_url, params: { add_on_table: { info: @add_on_table.info, name: @add_on_table.name, rate: @add_on_table.rate } }, as: :json
    end

    assert_response 201
  end

  test "should show add_on_table" do
    get add_on_table_url(@add_on_table), as: :json
    assert_response :success
  end

  test "should update add_on_table" do
    patch add_on_table_url(@add_on_table), params: { add_on_table: { info: @add_on_table.info, name: @add_on_table.name, rate: @add_on_table.rate } }, as: :json
    assert_response 200
  end

  test "should destroy add_on_table" do
    assert_difference('AddOnTable.count', -1) do
      delete add_on_table_url(@add_on_table), as: :json
    end

    assert_response 204
  end
end
