class Wildcat < ApplicationRecord
    validates :name, :age, :enjoys, :dislikes, presence:true
    validates :enjoys, length:{minimum: 10}
    validates :dislikes, length:{minimum: 10}
end
