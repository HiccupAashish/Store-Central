class Product < ApplicationRecord
    has_many :product_categories, :dependent => :destroy
    has_many :categories, through: :product_categories
    belongs_to :user, optional: true
  
    def categories=(attributes)
        user=User.find(attributes[:user_id])
        # attributes[:name].each do |new_cat|     
         cat= user.categories.find_or_create_by(name: attributes[:name])
         cat.products << self
        # end
    end
    
    def self.search(query)
    
        if query.present?
            where('name like ?', "%#{query}%")
        else
             self.all
        end
    end
   
end
