# encoding: utf-8
class Code
  include Mongoid::Document
  # mindapp begin
  include Mongoid::Timestamps
  field :atype, :type => Integer
  field :subject, :type => String
  field :detail, :type => String
  field :attach, :type => String
  field :pic, :type => String
  # mindapp end
end
