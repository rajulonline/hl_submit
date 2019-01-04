class UploadedTransaction < ApplicationRecord	
  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"
  
  validates :address, presence: true

  require 'csv'
  require "activerecord-import"

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # only send to Elasticsearch what we care about searching and running stats on
  def as_indexed_json(*_)
    as_json(
      only: [:address, :city, :status]
    )
  end

  settings do
    mappings dynamic: false do
      indexes :address, type: :text
      indexes :city, type: :text, analyzer: :english      
      indexes :status, type: :text, analyzer: :english      
    end
  end

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }
  
  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def bulkTransactionsUploader
    items = []
    CSV.foreach(params[:csv_file], headers: true) do |row|
      items << UploadedTransaction.new(row.to_h)
    end
    UploadedTransaction.import(items)
  end

  def self.search_published(query)
    self.search({
      from: 0, size: 1000,
      query: {
        bool: {
          should: [
          {
            multi_match: {
              query: query,
              fields: [:address, :city, :status]
            }
          },
          {
            match: {
              published: true
            }
          }]
        }
      }
    })
  end

end
