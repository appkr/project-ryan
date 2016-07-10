require 'test_helper'

class AttachmentTest < ActiveSupport::TestCase
  def setup
    @attachment = Attachment.new(article_id: '1', filename: 'filename', bytes: '1')
  end

  test 'should be valid' do
    assert @attachment.valid?
  end

  test 'article_id should be integer' do
    invalids = %w[integer integer0]
    invalids.each do |invalid|
      @attachment.article_id = invalid
      assert_not @attachment.valid?
    end
  end
  
  test 'article_id should be grater than or equal to  0' do
    @attachment.article_id = '-1'
    assert_not @attachment.valid?
  end

  test 'filename should be no whitespace' do
    @attachment.filename = 'white space'
    assert_not @attachment.valid?
  end
  
  test 'bytes should be integer' do
    invalids = %w[integer integer0]
    invalids.each do |invalid|
      @attachment.bytes = invalid
      assert_not @attachment.valid?
    end    
  end

  test 'bytes should be grater than or equal to 0' do
    @attachment.bytes = '-1'
    assert_not @attachment.valid?
  end    

end
