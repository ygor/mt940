require 'helper'

class TestMt940Deutschabank < Test::Unit::TestCase

  def setup
    file_name = File.dirname(__FILE__) + '/fixtures/deutschebank.txt'
    @transactions = MT940::Base.transactions(file_name)
    @transaction = @transactions.first
  end

  should 'have the correct number of transactions' do
    assert_equal 6, @transactions.size
  end

  context 'Transaction' do
     should 'have a bank_account' do
       assert_equal '571161782', @transaction.bank_account
     end

     should 'have an amount' do
       assert_equal -5.00, @transaction.amount
     end

     context 'Description' do
       should 'have the correct description' do
         assert_equal 'Incasso Afschrijving (DT) /ORDP/Transip B.V. //REMI/FACTUUR F0000 .2012.0017.5939', @transactions.last.description
       end
     end

     should 'have a date' do
       assert_equal Date.new(2012,8,27), @transaction.date
     end

     should 'return its bank' do
       assert_equal 'DeutscheBank', @transaction.bank
     end

     should 'have a currency' do
       assert_equal 'EUR', @transaction.currency
     end

     context 'Contra account' do
       should 'be determined' do
         assert_equal '0654416265', @transactions.last.contra_account
       end
     end
  end

end