# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the report index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a new report' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: '初めての日報投稿'
    fill_in '内容', with: 'こんにちは、今日は雨が降っていました。'
    click_on '登録する'
    assert_text '日報が作成されました。'
    assert_text '初めての日報投稿'
    assert_text 'こんにちは、今日は雨が降っていました。'
  end
end
