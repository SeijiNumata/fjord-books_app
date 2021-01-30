# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    bob = users(:bob)
    report = alice.reports.build(title: 'タイトル', content: '内容')
    assert report.editable?(alice)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = Report.new(id: 1, title: 'タイトル', content: '内容', created_at: '2021-01-15 20:17:38'.in_time_zone)
    assert_equal '2021-01-15'.to_date, report.created_on
  end
end
