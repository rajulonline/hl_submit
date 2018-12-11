class UploadedTransaction < ApplicationRecord
  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"
  
  require 'csv'

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }
  
  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def bulkTransactionsUploader
    items = []
    # byebug
    CSV.foreach('/Users/lraghavan/Desktop/csv/testing.csv', headers: true) do |row|
      items << UploadedTransaction.new(row.to_h)
    end
    UploadedTransaction.import(items)
  end

end
