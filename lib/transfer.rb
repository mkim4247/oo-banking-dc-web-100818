class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    if @sender.valid? && @receiver.valid?
      true
    else
      false
    end
  end
  
  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
    else
      "Transaction rejected. Please check your account balance."
    end
    @status = 'complete'
  end
end