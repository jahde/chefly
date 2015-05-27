module RecipesHelper
  # class YouTube
    # RETURN_TO_SENDER = '<iframe width="640" height="390" src="//www.youtube.com/embed/PU5xxh5UX4U" frameborder="0" allowfullscreen></iframe>'

    # attr_reader :client, :search_term

    # def initialize(search_term)
    #   @client = YouTubeIt::Client.new(:dev_key => ENV['YOUTUBE_KEY'])
    #   @search_term = search_term
    # end

    # def self.run(search_term)
    #   self.new(search_term).get_vid
    # end

    # def get_vid
    #   videos = self.client.videos_by(:query => [self.search_term]).videos
    #   videos.empty? ? RETURN_TO_SENDER : get_embedded_vid(videos)
    # end

    # def get_embedded_vid(videos)
    #   videos.first.embed_html5(:id => "ytplayer", :width => 640, :height => 390)
    # end

    # class/instance method at same time
    RETURN_TO_SENDER = '<iframe width="640" height="390" src="//www.youtube.com/embed/PU5xxh5UX4U" frameborder="0" allowfullscreen></iframe>'

    attr_reader :client, :search_term

    def initialize(search_term)
      Yt.configure do |config|
        config.api_key = ENV['YOUTUBE_KEY']
      end
      @search_term = search_term
      @videos = Yt::Collections::Videos.new
    end

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def run(search_term)
        self.new(search_term).get_vid
      end
    end

    def get_vid
      video = self.videos.where(q: self.search_term, order: 'viewCount').first
      video_url = video.embed_html
      video_url.gsub!("<iframe",'<iframe id="ytplayer"')
      video.empty? ? RETURN_TO_SENDER : video.embed_html
    end

  # end
end

