class AgentsController < ApplicationController
  def show
    @agent = Agent.find(params[:id])
    @uploaded_transactions = @agent.all_transactions
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end

  ##Used active record import for handling large transaction upload
  def bulkTransactionsUploader(csv_file)
    items = []
    CSV.foreach(csv_file, headers: true) do |row|
      items << UploadedTransaction.new(row.to_h)
    end
    UploadedTransaction.import(items)
  end
end
