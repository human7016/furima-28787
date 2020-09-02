class Quality < ActiveHash::Base
  self.data = [
    {id:1, quality:'__'},
    {id:2, quality:'新品、未使用'},
    {id:3, quality:'未使用に近い'},
    {id:4, quality:'目立った傷や汚れなし'},
    {id:5, quality:'やや傷や汚れあり'},
    {id:6, quality:'傷や汚れあり'},
    {id:7, quality:'全体的に状態が悪い'}
  ]
end
