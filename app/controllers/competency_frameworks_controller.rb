class CompetencyFrameworksController < ApplicationController
  def asset_file
    fetcher = CompetencyFrameworkFetcher.new(id: params.require(:id))

    send_data fetcher.body, type: fetcher.content_type, disposition: :inline
  end
end
