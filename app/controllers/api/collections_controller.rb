module Api
  class CollectionsController < ApplicationController
    before_action :set_collection, only: [:show]

    def show
      respond_to do |format|
        format.any do
          render json: @collection, serializer: V1::CollectionSerializer, root: false, status: :ok
        end
      end
    end

    private

    def set_collection
      @collection ||= Collection.find(params[:id])
    end
  end
end
