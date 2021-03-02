# 商品を表示
def disp_products(products)
  puts 'いらっしゃい!発券機で食券を買ってね！'
  products.each.with_index(FIRST_PRODUCT_NUM) do |product, i|
    puts "#{i}.#{product[:name]} (#{product[:price]}円)"
  end
end

# 商品を選択
def choose_product(products)
  while true
    print '商品の番号を選択 > '
    select_product_num = gets.to_i
    break if (FIRST_PRODUCT_NUM..LAST_PRODUCT_NUM).include?(select_product_num)

    puts "#{FIRST_PRODUCT_NUM}～#{LAST_PRODUCT_NUM}の番号から選択して下さい。"
  end
  chosen_product_index = select_product_num - FIRST_PRODUCT_NUM
  products[chosen_product_index]
end

# 個数を決定
def decide_quantity(chosen_product)
  puts "#{chosen_product[:name]}ですね。いくつ注文しますか？"
  while true
    print '個数を入力 > '
    quantity_of_product = gets.to_i
    break if quantity_of_product >= 1

    puts 'もう一度個数を選択して下さい。'
  end
  quantity_of_product
end

# 合計金額を計算
def calculate_charges(chosen_product, quantity_of_product)
  total_price = chosen_product[:price] * quantity_of_product
  if total_price >= DISCOUNT_STANDARD_PRICE
    puts "ご注文の商品は#{DISCOUNT_STANDARD_PRICE}円以上なので#{DISCOUNT_PRICE}円引きになります！"
    total_price -= DISCOUNT_PRICE
  end
  puts "合計金額は#{total_price}円です。"
  puts 'ありがとうございました！'
end

# メソッドの呼び出し部分-----------------------------------------

# 商品データ
products = [
  { name: '塩らあめん', price: 850 },
  { name: '醤油らあめん', price: 850 },
  { name: 'あごらあめん', price: 880 },
  { name: 'つけ麺(並)', price: 900 },
  { name: 'あご玉', price: 900 },
  { name: 'あごチャー', price: 1100 }
]

# 定義を指定

FIRST_PRODUCT_NUM = 1
LAST_PRODUCT_NUM = (FIRST_PRODUCT_NUM + products.size) - 1
DISCOUNT_STANDARD_PRICE = 1000
DISCOUNT_PRICE = 100

disp_products(products) # 商品を表示
chosen_product = choose_product(products) # 商品を選択
quantity_of_product = decide_quantity(chosen_product) # 商品の個数を決定
calculate_charges(chosen_product, quantity_of_product) # 合計金額を計算
