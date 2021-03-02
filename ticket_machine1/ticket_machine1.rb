# 商品データ
products = [
  { name: '塩らあめん', price: 850 },
  { name: '醤油らあめん', price: 850 },
  { name: 'あごらあめん', price: 880 },
  { name: 'つけ麺(並)', price: 900 },
  { name: 'あご玉', price: 900 },
  { name: 'あごチャー', price: 1100 }
]

# 商品の表示
puts 'いらっしゃい!発券機で食券を買ってね！'
products.each.with_index(1) do |product, i|
  puts "#{i}.#{product[:name]} (#{product[:price]}円)"
end

# 商品を選択
print '商品の番号を選択 >'
select_product_num = gets.to_i
chosen_product = products[select_product_num - 1]

puts "#{chosen_product[:name]}ですね。何個買いますか？"
print '個数を入力 > '
quantity_of_product = gets.to_i

# 合計金額を計算
total_price = chosen_product[:price] * quantity_of_product
if quantity_of_product >= 2
  puts '2つ以上なので100円引きになります！'
  total_price -= 100
end
puts "合計金額は#{total_price.floor}円です。"
puts 'ありがとうございました！'
