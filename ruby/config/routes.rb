Rails.application.routes.draw do
  root to: "agents#random_agent"

  match '/bulkuploadcsv', to: 'agents#bulkuploadcsv',via: [:get, :post]
  post '/bulkTransactionsUploader', to: 'agents#bulkTransactionsUploader'

  resources :agents do
    resources :uploaded_transactions
  end
end
