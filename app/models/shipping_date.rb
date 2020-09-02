class ShippingDate < ActiveHash::Base
  self.data = [
    {id:1, shipping_date_name:'__'},
    {id:2, shipping_date_name:'1~2日で発送'},
    {id:3, shipping_date_name:'2~3日で発送'},
    {id:4, shipping_date_name:'4~7日で発送'},
  ]
end
