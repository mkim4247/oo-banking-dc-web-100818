class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
  def execute_transaction
    if sender.valid? && self.status != "complete" && sender.balance >= self.amount
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
end