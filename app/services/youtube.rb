class Youtube
    RETURN_TO_SENDER = '<iframe width="640" height="390" src="//www.youtube.com/embed/PU5xxh5UX4U" frameborder="0" allowfullscreen></iframe>'

    attr_reader :client, :search_term, :videos

    def initialize(search_term)
      Yt.configure do |config|
        config.api_key = ENV['YOUTUBE_KEY']
      end
      @search_term = search_term
      @videos = Yt::Collections::Videos.new
    end

  

    
      def self.run(search_term)
        self.new(search_term).get_vid
      end
   

    def get_vid
      
      video = self.videos.where(q: self.search_term, order: 'viewCount').first
      video_url = video.embed_html
      video_url.gsub!("<iframe",'<iframe id="ytplayer"')
      video.empty? ? RETURN_TO_SENDER : video.embed_html
    end

   end