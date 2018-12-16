class UploadedTransaction < ApplicationRecord	
  belongs_to :listing_agent, required: false, class_name: "Agent"
  belongs_to :selling_agent, required: false, class_name: "Agent"
  
  validates :address, presence: true, length: { maximum: 10 },numericality: { message: "%{value} seems wrong" }

  require 'csv'

  scope :single_family_homes, -> { where(property_type: "single_family_home") }
  scope :sold, -> { where(status: "sold") }
  
  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

end
