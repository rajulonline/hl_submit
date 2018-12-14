class AgentsController < ApplicationController
  def show
    @agent = Agent.find(params[:id])
    @uploaded_transactions = @agent.all_transactions.page params[:page]
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end

  def bulkTransactionsUploader
    items = []
    CSV.foreach(params[:csv_file], headers: true) do |row|
      items << UploadedTransaction.new(row.to_h)
    end
    UploadedTransaction.import(items)
  end
end
