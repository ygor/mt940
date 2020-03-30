class MT940::Bunq < MT940::Base

  def self.determine_bank(*args)
    self if args[0].match(/^BUNQNL2A/)
  end

  def parse_contra_account
    if @transaction.contra_account.nil? && @transaction.description.match(/(IBAN\/(.*))?\/NAME\/(.*)\/REMI/)
        @transaction.contra_account = $2
        @transaction.contra_account_name = $3
    end
  end
end
