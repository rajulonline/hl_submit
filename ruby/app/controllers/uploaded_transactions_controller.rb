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
    if (checkParamValues(uploaded_transaction_params))
      uploaded_transaction = agent.uploaded_seller_transactions.create(uploaded_transaction_params)        
      if uploaded_transaction.save
        redirect_to agent_path(agent), notice: "Transaction saved!"
      else
      render "new"
      end
    else
      Rails.logger.debug(json: {status: "error", code: 3000, message: "Incorrect value(s) filled for mandatory fields"})
    end
  end

  private

  def uploaded_transaction_params
    params.require(:uploaded_transaction).permit(:address, :city, :state, :zip, :listing_agent, :listing_price, :listing_date, :selling_price, :selling_agent, :selling_date, :status, :property_type)
  end

  def checkParamValues(form_values)
    form_values.has_key?(:address) && form_values.has_key?(:city) &&
      form_values.has_key?(:state) && form_values.has_key?(:zip) &&
      form_values.has_key?(:listing_agent) && form_values.has_key?(:listing_price) &&
      form_values.has_key?(:listing_date) && form_values.has_key?(:selling_price) &&
      form_values.has_key?(:selling_date) && form_values.has_key?(:status) &&
      form_values.has_key?(:property_type)
  end

end
