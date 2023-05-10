class Product < ApplicationRecord

    has_many :product_categories, :dependent => :destroy
    has_many :categories, through: :product_categories
    belongs_to :user, optional: true
    

    def categories=(attributes)
        # raise attributes.inspect
        # raise attributes[:user_id].inspect nil/1 in check
     if attributes[:user_id]==nil
        attributes.each do |key,category| 
            user=User.find(category[:user_id])   
            cat= Category.find_or_create_by(name: category[:name])
            user.categories << cat
            cat.products << self
        end
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
