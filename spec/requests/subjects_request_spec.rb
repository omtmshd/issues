require 'rails_helper'

RSpec.describe "Subjects", type: :request do

  describe 'GET /subjects' do

    it '検索ワードがない場合、すべてのSubjectを返すこと' do
      create(:subject)
      create(:subject)
      get '/api/v1/subjects'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json.count).to eq(2)
    end

    it 'keyword 検索が成功すること' do
      create(:subject)
      create(:subject, title: "title_1")
      get '/api/v1/subjects', params: { keyword: "title_1"}
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json.count).to eq(1)
    end

    it 'teacher_name 検索が成功すること' do
      bob = create(:teacher, name: "bob")
      create(:subject)
      create(:subject, teacher: bob)
      get '/api/v1/subjects', params: { teacher_name: "bob"}
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json.count).to eq(1)
    end

    it 'keyword,teacher_name 検索が成功すること' do
      bob = create(:teacher, name: "bob")
      create(:subject, teacher: bob,)
      create(:subject, title: "title_1")
      create(:subject, teacher: bob, title: "title_1")
      get '/api/v1/subjects', params: { teacher_name: "bob", keyword: "title_1"}
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json.count).to eq(1)
    end

    it 'lectures.date が昇順になっていること' do
      subject = create(:subject, :with_lectures, lectures_count: 3)
      get '/api/v1/subjects'
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json[0]['lectures'][0]['date']).to eq("2020-01-01")
      expect(json[0]['lectures'][2]['date']).to eq("2020-01-03")
    end

  end
end
