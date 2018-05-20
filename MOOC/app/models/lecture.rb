class Lecture < ApplicationRecord
    mount_uploader :attachment, FileUploader
    belongs_to :course
    has_many :comments
    belongs_to :user
    acts_as_votable
end
