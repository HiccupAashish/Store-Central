class Product < ApplicationRecord

    has_many :product_categories, :dependent => :destroy
    has_many :categories, through: :product_categories
    belongs_to :user, optional: true
  
    def categories=(attributes)
        raise attributes.inspect
        # user=User.find(attributes[:user_id])
        # attributes[:name].each do |new_cat|  
        attributes.each do |key,value| 
            
         cat= session[:user_id].categories.find_or_create_by(name: value[:name])
         cat.products << self
        end
    end
    
    def self.search(query)
    
        if query.present?
            where('name like ?', "%#{query}%")
        else
             self.all
        end
    end
   
end
