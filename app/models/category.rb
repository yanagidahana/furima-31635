class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カテゴリー' },
    { id: 2, name: '商品の状態' },
    { id: 3, name: '配送料の負担' },
    { id: 4, name: '発送元の地域' },
    { id: 5, name: '発送日までの日数' },
  ]


end