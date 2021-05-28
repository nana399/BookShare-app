require 'net/https' # モジュールの読み込み

class BookSearch # クラスとして定義
  include Singleton # デザインパターンの一種。GoogleBookClient.instance.search(keyword)のように外部から呼び出す

  def initialize
    @uri = URI.parse 'https://www.googleapis.com/books/v1/volumes' # URIにparseする
    @http = Net::HTTP.new @uri.host, @uri.port # httpインスタンスを生成
    @http.use_ssl = true # httpsで通信を行うようにする。指定しないとエラーする場合がある
  end

  def search(keyword) # 検索を行って配列を返すメソッド
    create_request(keyword)

    @res['items'].map do |item|
      info = item['volumeInfo']
      {
        id: item['id'],
        title: info['title'],
        price: item['saleInfo']['listPrice'].nil? ? ' - ' : item['saleInfo']['listPrice']['amount'].floor.to_s,
        authors: info['authors'],
        publisher: info['publisher'],
        published_date: info['publishedDate'],
        description: info['description'],
        image_path: info['imageLinks']['smallThumbnail']
      }
    end
  end

  private

    def create_request(keyword) # httpリクエストを投げてレスポンスを返り値とするメソッド
      req = Net::HTTP::Get.new @uri.path + "?q=#{keyword}" # getリクエストを生成
      _res = @http.request req # httpリクエストを投げる
      @res = JSON.parse(_res.body) # レスポンスをJSON形式にparseする
    end

end