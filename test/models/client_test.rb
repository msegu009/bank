# encoding: utf-8
require 'test_helper'

class ClientTest < ActiveSupport::TestCase

  def setup
    @client = Client.new
  end

  def teardown
    @client.destroy
  end

  test "init" do
    assert @client.invalid?
  end

  test "name length" do
    @client.valid?
    assert @client.errors[:name].any?
    @client.name = 'X'
    @client.valid?
    assert @client.errors[:name].any?
    @client.name = 'Ala'
    @client.valid?
    assert @client.errors[:name].empty?
  end

  test "email format" do
    @client.valid?
    assert @client.errors[:email].any?
    @client.email = 'ala'
    @client.valid?
    assert @client.errors[:email].any?
    @client.email = 'ala@wp.pl'
    @client.valid?
    assert @client.errors[:email].empty?
  end

  test "phone format" do
    @client.valid?
    assert  @client.errors[:phone].any?
    @client.phone = '734'
    @client.valid?
    assert @client.errors[:phone].any?
    @client.phone = '504-234-334'
    @client.valid?
    assert @client.errors[:phone].empty?
  end
end
