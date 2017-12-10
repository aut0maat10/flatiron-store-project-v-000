class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :current_cart, class_name: 'Cart', foreign_key: 'current_cart_id'
  has_many :carts 

  def create_current_cart
    new_cart = carts.create
    self.current_cart_id = new_cart.id 
  end 

  def remove_cart
    self.current_cart_id = nil
  end

end
