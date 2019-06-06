# == Schema Information
#
# Table name: albums
#
#  id           :bigint           not null, primary key
#  band_id      :integer          not null
#  title        :string           not null
#  year         :string           not null
#  studio_album :boolean          default(TRUE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Album < ApplicationRecord

    belongs_to :band
end
