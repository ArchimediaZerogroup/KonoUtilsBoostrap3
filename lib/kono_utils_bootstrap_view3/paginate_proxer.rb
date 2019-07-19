module KonoUtilsBootstrapView3
  class PaginateProxer < KonoUtils::PaginateProxer

    def paginate(params = {})
      collection.paginate(:page => params[:page])
    end

  end
end