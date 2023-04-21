# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 学部と学科を登録する
faculties = {
  "法学部" => %w[法律学科],
  "経済学部" => %w[経済学科 総合経済政策学科 国際経済学科],
  "経営学部" => %w[経営学科 商学科 会計学科 キャリア・マネジメント学科],
  "理工学部" => %w[理学科 生命科学科 応用化学科 機械工学科 電気電子工学科 電気電子通信工学科 情報学科 社会環境工学科 エネルギー物質学科],
  "建築学部" => %w[建築学科],
  "薬学部" => %w[医療薬学科 創薬科学科],
  "文芸学部" => %w[文学科 芸術学科 文化・歴史学科 文化デザイン学科],
  "総合社会学部" => %w[総合社会学科],
  "国際学部" => %w[国際学科],
  "情報学部" => %w[情報学科],
  "農学部" => %w[農業生産科学科 水産学科 応用生命化学科 食品栄養学科 環境管理学科 生物機能科学科 バイオサイエンス学科],
  "医学部" => %w[医学科],
  "生物理工学部" => %w[生物工学科 食品安全工学科 遺伝子工学科 生命情報工学科 システム生命科学科 人間環境デザイン工学科 医用工学科],
  "工学部" => %w[化学生命工学科 機械工学科 情報学科 建築学科 電子情報工学科 ロボティクス学科],
  "産業理工学部" => %w[生物環境工学科 電気電子工学科 建築・デザイン学科 情報学科 経営ビジネス学科],
  "短期大学部" => %w[商経科],
  "通信教育部" => %w[法律学科 商経科],
  "大学院法学研究科" => %w[法律学専攻],
  "大学院商学研究科" => %w[商学専攻],
  "大学院経済学研究科" => %w[経済学専攻],
  "大学院総合理工学研究科" => %w[理学専攻 物質系工学専攻 メカニックス系工学専攻 エレクトロニクス系工学専攻 環境系工学専攻 建築デザイン専攻 東大阪モノづくり専攻],
  "大学院薬学研究科" => %w[薬科学専攻 薬学専攻],
  "大学院総合文化研究科" => %w[日本文学専攻 英語英米文学専攻 文化・社会学専攻 心理学専攻],
  "大学院農学研究科" => %w[農業生産科学専攻 水産学専攻 応用生命化学専攻 環境管理学専攻 バイオサイエンス専攻],
  "大学院医学研究科" => %w[医学専攻],
  "大学院生物理工学研究科" => %w[生物工学専攻 生体システム工学専攻],
  "大学院システム工学研究科" => %w[システム工学専攻],
  "大学院産業理工学研究科" => %w[産業理工学専攻]
}
# 一度追加したものは追加されないようにする
faculties.each do |faculty_name, department_names|
  faculty = Faculty.find_by(name: faculty_name)
  unless faculty.present?
    faculty = Faculty.create!(name: faculty_name)
  end
  department_names.each do |department_name|
    department = Department.find_by(name: department_name, faculty: faculty)
    unless department.present?
      puts "Create #{faculty.name} / #{department_name}"
      Department.create!(name: department_name, faculty: faculty)
    end
  end
end