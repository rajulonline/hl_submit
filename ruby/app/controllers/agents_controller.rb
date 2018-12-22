class AgentsController < ApplicationController
  require 'csv'

  def show
    @agent = Agent.find(params[:id])
    @uploaded_transactions = @agent.all_transactions
  end

  def random_agent
    redirect_to agent_path(Agent.all.sample)
  end

  def bulkuploadcsv
  end

  ##Used active record import for handling large transaction upload
  def bulkTransactionsUploader    
    if(params.has_key?(:agent))
    items = []
    CSV.foreach(params[:agent][:query].path, headers: true) do |row|      
      items << UploadedTransaction.new(row.to_h)
    end    
    UploadedTransaction.import(items)    
    redirect_to agent_path(Agent.all.sample)    
    else
      flash[:notice] = 'Please try upload again'
      redirect_to request.referrer
    end
  end

end
