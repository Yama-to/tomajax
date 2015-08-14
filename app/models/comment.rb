class Comment < ActiveRecord::Base
  after_update :update_date_info
  validates :text, presence: true

  private
    def update_date_info
      updated_at = Time.now
    end
end
