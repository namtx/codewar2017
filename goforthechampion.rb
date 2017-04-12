def quizz
  points = {}
  hieu_so = {}
  matches = {}
  goals = {}
  (0...5).each do
    team1, team2, goal = gets.split.map &:to_s
    team1_goal, team2_goal = goal.split(':').map &:to_i
    points[team1.to_sym] ||= 0
    points[team2.to_sym] ||= 0
    hieu_so[team1.to_sym] ||= 0
    hieu_so[team2.to_sym] ||= 0
    matches[team1.to_sym] ||= 0
    matches[team2.to_sym] ||= 0
    goals[team1.to_sym] ||= 0
    goals[team2.to_sym] ||= 0
    if team1_goal > team2_goal
      points[team1.to_sym] += 3
    elsif team1_goal < team2_goal
      points[team2.to_sym] += 3
    else
      points[team2.to_sym] += 1
      points[team1.to_sym] += 1
    end
    hieu_so[team1.to_sym] += team1_goal - team2_goal
    hieu_so[team2.to_sym] += team2_goal - team1_goal
    matches[team1.to_sym] += 1
    matches[team2.to_sym] += 1
    goals[team1.to_sym] = team1_goal
    goals[team2.to_sym] = team2_goal
  end
  vs_vietnam = matches.select{|team, match| team !=:VIETNAM && match == 2}.keys.first
  (1..9).each do |m|
    break unless (m-1..0).each do |n|
      points[:VIETNAM] += 3
      hieu_so[:VIETNAM] += m - n
      hieu_so[vs_vietnam.to_sym] += n - m
      goals[:VIETNAM]+= m
      goals[vs_vietnam.to_sym] += n
      arr = points.sort_by do |team|
        [team[1], hieu_so[team[0]], goals[team[0]], team[0]]
      end
      if(arr[-1][0] == :VIETNAM || arr[-2][0]==:VIETNAM)
        return "#{m}:#{n}"
      end
      points[:VIETNAM] -= 3
      hieu_so[:VIETNAM] += n - m
      hieu_so[vs_vietnam.to_sym] += m - n
      goals[:VIETNAM]-= m
      goals[vs_vietnam.to_sym] -= n
    end
  end
  return "IMPOSSIBLE"
end

puts quizz
