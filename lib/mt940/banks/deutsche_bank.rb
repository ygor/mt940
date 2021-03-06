class MT940::DeutscheBank < MT940::Abnamro

  def self.determine_bank(*args)
    self if args[0].match(/DEUTDE/)
  end

  def parse_contra_account
    if @transaction
      if @transaction.description.match(/(.+)\/\/ACCW\/(\d+)\//)
        @transaction.contra_account = $2
        @transaction.description    = $1.strip
      end
    end
  end

end
