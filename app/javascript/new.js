bubbly();

window.onload = async function() {
  // 検索する
  var search = async () => {
    // 入力された値でを本を検索
    var items = await searchBooks($q.value);
    
    // html に変換して表示用 DOM に代入
    var texts = items.map(item => {
      return `
      <a class='f border bg-white mb8' href='${item.link}', target='_blank'>
        <img class='w100 object-fit-contain bg-gray' src='${item.image}' />
        <div class='p16'>
          <h3 class='mb8'>${item.title}</h3>
          <p class='line-clamp-2'>${item.description}</p>
        </div>
      </div>`;
    });
    $results.innerHTML = texts.join('');
  };
  
  // 入力するたびに検索( debounce で API 連打対策 )
  $q.oninput = _.debounce(search, 256);
  
  // フォーカスしたら全文字選択
  $q.onfocus = () => { $q.select(); };
  
  // 初期値設定
  $q.value = '鬼滅';
  search();
};

// 本を検索して結果を返す
var searchBooks = async (query) => {
  // Google Books APIs のエンドポイント
  var endpoint = 'https://www.googleapis.com/books/v1';
  
  // 検索 API を叩く
  var res = await fetch(`${endpoint}/volumes?q=${$q.value}`);
  // JSON に変換
  var data = await res.json();
  
  // 必要なものだけ抜き出してわかりやすいフォーマットに変更する
  var items = data.items.map(item => {
    var vi = item.volumeInfo;
    return {
      title: vi.title,
      description: vi.description,
      link: vi.infoLink,
      image: vi.imageLinks ? vi.imageLinks.smallThumbnail : '',
    }; 
  });
  
  return items;
};