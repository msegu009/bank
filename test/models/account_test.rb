# encoding: utf-8
require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
    @client = Client.new(name: 'Jan', surname: 'Kowalski',
                         email: 'jan@wp.pl', phone: '345-678-334',
                         password: '123123', password_confirmation: '123123')
    assert @client.save
    @account = @client.accounts.create
  end

  def teardown
    @client.destroy
  end

  test "set_number" do
    assert @account.number.present?
    assert @account.number > 1
  end

  test "to_s" do
    assert_match /\[\d+\] 0 zł/, @account.to_s
  end

  test "balance" do
    @account = @client.accounts.create
    @account.balance = 'ala'
    assert @account.invalid?
    assert @account.errors[:balance].any?
    @account.balance = 100
    assert @account.valid?
    assert @account.errors[:balance].empty?
  end

  test "update_balance" do
    @account.transactions.create(amount: 100, descr: 'wpłata 1')
    @account.transactions.create(amount: 350, descr: 'wpłata 2')
    @account.reload
    assert_equal 450, @account.balance
  end
end
