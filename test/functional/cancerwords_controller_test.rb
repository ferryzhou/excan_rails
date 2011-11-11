require 'test_helper'

class CancerwordsControllerTest < ActionController::TestCase
  setup do
    @cancerword = cancerwords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cancerwords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cancerword" do
    assert_difference('Cancerword.count') do
      post :create, :cancerword => @cancerword.attributes
    end

    assert_redirected_to cancerword_path(assigns(:cancerword))
  end

  test "should show cancerword" do
    get :show, :id => @cancerword.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cancerword.to_param
    assert_response :success
  end

  test "should update cancerword" do
    put :update, :id => @cancerword.to_param, :cancerword => @cancerword.attributes
    assert_redirected_to cancerword_path(assigns(:cancerword))
  end

  test "should destroy cancerword" do
    assert_difference('Cancerword.count', -1) do
      delete :destroy, :id => @cancerword.to_param
    end

    assert_redirected_to cancerwords_path
  end
end
