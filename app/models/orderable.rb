class Orderable < ApplicationRecord
  belongs_to :article
  belongs_to :cart
end
