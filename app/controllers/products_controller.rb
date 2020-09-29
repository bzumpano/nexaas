class ProductsController < ApplicationController
  PERMITTED_PARAMS = %i[
    name
    price
  ]
end
