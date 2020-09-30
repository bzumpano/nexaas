class StockItemsController < ApplicationController
  PERMITTED_PARAMS = %i[
    store_id
    product_id
  ]
end
