require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bill = bills(:one)
  end

  test "should get index" do
    get bills_url
    assert_response :success
  end

  test "should get new" do
    get new_bill_url
    assert_response :success
  end

  test "should create bill" do
    assert_difference('Bill.count') do
      post bills_url, params: { bill: { ccyisocode: @bill.ccyisocode, date: @bill.date, place_generated: @bill.place_generated, product_id: @bill.product_id, quantity: @bill.quantity, vigente: @bill.vigente, uuid: @bill.uuid } }
    end

    assert_redirected_to bill_url(Bill.last)
  end

  test "should show bill" do
    get bill_url(@bill)
    assert_response :success
  end

  test "should get edit" do
    get edit_bill_url(@bill)
    assert_response :success
  end

  test "should update bill" do
    patch bill_url(@bill), params: { bill: { ccyisocode: @bill.ccyisocode, date: @bill.date, place_generated: @bill.place_generated, product_id: @bill.product_id, quantity: @bill.quantity, vigente: @bill.vigente, uuid: @bill.uuid } }
    assert_redirected_to bill_url(@bill)
  end

  test "should destroy bill" do
    assert_difference('Bill.count', -1) do
      delete bill_url(@bill)
    end

    assert_redirected_to bills_url
  end
end
