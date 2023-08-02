require 'httparty'

class NewsApiClient
  BASE_URL = 'https://newsapi.org/v2/top-headlines'
  API_KEY = '6dc68d06ce9d43238418467a966aa939'

  def self.fetch_top_headlines(country: 'us', category: 'general', language: 'en')
    response = HTTParty.get(BASE_URL, query: {
      country: country,
      category: category,
      language: language,
      apiKey: API_KEY
    })

    if response.success?
      return response['articles']
    else
      raise "Error fetching top headlines: #{response.code} - #{response['message']}"
    end
  end
end






