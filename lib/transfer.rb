require 'pry'

class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid?
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    else 
    "Transaction rejected. Please check your account balance."
    #
    #
    #   sender.valid? && sender.balance > amount && self.status == "pending"
    #     sender.balance -= self.amount
    #     receiver.balance += self.amount
    #     self.status = "complete"
    # elsif !valid?
    #     "Transaction rejected. Please check your account balance."
    #     self.status = "rejected"
    # end

  end


end
#
#     it "rejects a transfer if the sender doesn't have a valid account" do
#       expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
#       expect(bad_transfer.status).to eq("rejected")
#     end
#   end
#
# #   describe '#reverse_transfer' do
# #     it "can reverse a transfer between two accounts" do
# #       transfer.execute_transaction
# #       expect(amanda.balance).to eq(950)
# #       expect(avi.balance).to eq(1050)
# #       transfer.reverse_transfer
# #       expect(avi.balance).to eq(1000)
# #       expect(amanda.balance).to eq(1000)
# #       expect(transfer.status).to eq("reversed")
# #     end
# #
# #     it "it can only reverse executed transfers" do
# #       transfer.reverse_transfer
# #       expect(amanda.balance).to eq(1000)
# #       expect(avi.balance).to eq(1000)
# #     end
# #   end
# # end
