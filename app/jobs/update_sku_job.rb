class UpdateSkuJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    uri = URI('http://localhost:4567/updat_sku')
    req = Net::HTTP::Post.new(uri, 'Content-type' => 'application/json')
    req.body = { sku: 123, name: book_params[:name]}.to_json 
    res = Net::HTTP.start(uri.host, uri.port) do |http|
      http.request(req)
    end

  end
end
