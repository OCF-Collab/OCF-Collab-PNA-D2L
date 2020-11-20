class CompetencyFrameworkFetcher
  class NotFoundError < StandardError; end

  attr_reader :id

  def initialize(id:)
    @id = id
  end

  def body
    response.body
  end

  def response
    @response ||= connection.get(framework_url).tap do |response|
      raise NotFoundError unless response.success?
    end
  end

  def connection
    @connection ||= Faraday.new do |c|
      c.response :follow_redirects
    end
  end

  def framework_url
    id
  end

  def content_type
    response.headers["content-type"]
  end
end
