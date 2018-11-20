FactoryBot.define do
  factory :bbs_post do
    association :bbs_thread
    body { "投稿本文サンプル" }
    poster_name { "投稿者名サンプル" }
  end
end
