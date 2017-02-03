require 'test_helper'

class CashAccountsControllerTest < ActionController::TestCase
  setup do
    @cash_account = cash_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cash_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash_account" do
    assert_difference('CashAccount.count') do
      post :create, cash_account: { balance: @cash_account.balance, name: @cash_account.name }
    end

    assert_redirected_to cash_account_path(assigns(:cash_account))
  end

  test "should show cash_account" do
    get :show, id: @cash_account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cash_account
    assert_response :success
  end

  test "should update cash_account" do
    patch :update, id: @cash_account, cash_account: { balance: @cash_account.balance, name: @cash_account.name }
    assert_redirected_to cash_account_path(assigns(:cash_account))
  end

  test "should destroy cash_account" do
    assert_difference('CashAccount.count', -1) do
      delete :destroy, id: @cash_account
    end

    assert_redirected_to cash_accounts_path
  end
end
