class Shipping < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '--' },
    { id: 3, name: '着払い(購入者の負担)' },
    { id: 4, name: '送料込み(出品者の負担)' },
  ]

end