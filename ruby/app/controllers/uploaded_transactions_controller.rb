class UploadedTransactionsController < ApplicationController
  def new
    @agent = Agent.find(params[:agent_id])
    @uploaded_transaction = @agent.uploaded_seller_transactions.new
  end

  #Before creating a transaction record check if if all the params are present. 
  #IF the values are missing the log
  #If present try saving, when that is successfull redirect to agents page
  # else try again
  def create
    agent = Agent.find(params[:agent_id])    
      uploaded_transaction = agent.uploaded_seller_transactions.create(uploaded_transaction_params)        
      if uploaded_transaction.save
        redirect_to agent_path(agent), notice: "Transaction saved!"
      else
      render "new"
      end
  end

  def search
  query = params[:uploaded_transaction].presence && params[:uploaded_transaction][:query]
  
  if query
    @uploaded_transaction = UploadedTransaction.search_published(query)
  end
end

  private

  def uploaded_transaction_params
    params.require(:uploaded_transaction).permit(:address, :city, :state, :zip, :listing_agent, :listing_price, :listing_date, :selling_price, :selling_agent, :selling_date, :status, :property_type)
  end

  def checkParamValues
    params.has_key?(:address) && params.has_key?(:city) &&
      params.has_key?(:state) && params.has_key?(:zip) &&
      params.has_key?(:listing_agent) && params.has_key?(:listing_price) &&
      params.has_key?(:listing_date) && params.has_key?(:selling_price) &&
      params.has_key?(:selling_date) && params.has_key?(:status) &&
      params.has_key?(:property_type)
  end

end
