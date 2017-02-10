require 'test_helper'

class RelatedAccountsControllerTest < ActionController::TestCase
  setup do
    @related_account = related_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:related_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create related_account" do
    assert_difference('RelatedAccount.count') do
      post :create, related_account: { account_type: @related_account.account_type, balance: @related_account.balance, due_date: @related_account.due_date, name: @related_account.name }
    end

    assert_redirected_to related_account_path(assigns(:related_account))
  end

  test "should show related_account" do
    get :show, id: @related_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @related_account
    assert_response :success
  end

  test "should update related_account" do
    patch :update, id: @related_account, related_account: { account_type: @related_account.account_type, balance: @related_account.balance, due_date: @related_account.due_date, name: @related_account.name }
    assert_redirected_to related_account_path(assigns(:related_account))
  end

  test "should destroy related_account" do
    assert_difference('RelatedAccount.count', -1) do
      delete :destroy, id: @related_account
    end

    assert_redirected_to related_accounts_path
  end
end
