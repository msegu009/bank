require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  def setup
    @transaction = Transaction.new
    assert @transaction.invalid?
  end

  test "amount is number" do
    assert @transaction.errors[:amount].any?
    @transaction.amount = 100
    @transaction.valid?
    assert @transaction.errors[:amount].empty?
  end
end
