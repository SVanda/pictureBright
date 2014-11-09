#require 'rails_helper'

#RSpec.describe Asset, :type => :model do
#  pending "add some examples to (or delete) #{__FILE__}"
#end

describe Asset do
  describe "associations" do
    it {should belong_to(:user)}
  end
  
end