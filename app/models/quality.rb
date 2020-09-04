class Quality < ActiveHash::Base
  self.data = [
    {id:1, quality_name:'__'},
    {id:2, quality_name:'新品、未使用'},
    {id:3, quality_name:'未使用に近い'},
    {id:4, quality_name:'目立った傷や汚れなし'},
    {id:5, quality_name:'やや傷や汚れあり'},
    {id:6, quality_name:'傷や汚れあり'},
    {id:7, quality_name:'全体的に状態が悪い'}
  ]
end
