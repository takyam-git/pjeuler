class Maze
	ROOT='0'; WALL='1'; START='2'; GOAL='3'
	
	def initialize(map=nil, vec=nil, size=nil)
		@map = map.split("\n").map{|line| line.split(',') }
		@average = @map.inject(0.0){|ave,row| ave+=row.inject(0.0){|aveRow,n| aveRow+=n.to_i }/row.size }/@map.size
		unless vec
			vec = []
			for i in 0..3
				j = i%3==0 ? 1 : -1
				vec[i] = { :x=>(i+1)%2*j, :y=>i%2*j }
			end
		end
		@vec = vec
		@size = size ? size : { :x=>80, :y=>80 }
		@start = { :x=>0, :y=>0 }
		@goal =  { :x=>@size[:x]-1, :y=>@size[:y]-1 }
	end
	
	# 探索開始
	def search()
		self.openNode(nil, pos=@start)
		loop do
			@vec.each do |vec|
				newPos = { :x=>pos[:x]+vec[:x], :y=>pos[:y]+vec[:y] }
				self.openNode(@map[pos[:y]][pos[:x]], newPos)
				return true if newPos==@goal
			end
			self.closeNode(pos)
			return false unless pos=self.getNextPos()
		end
	end
	
	# OPENノードからコストが最小のノードを選ぶ
	def getNextPos()
		minScore = nil
		minNode = []
		for j in 0..@size[:y]-1
			for i in 0..@size[:x]-1
				if @map[j][i].is_a?(AStar) && @map[j][i].status===true then
					if !minScore || minScore>@map[j][i].score then
						minScore = @map[j][i].score
						minNode = [{ :x=>i, :y=>j }]
					elsif minScore==@map[j][i].score then
						minNode.push({ :x=>i, :y=>j })
					end
				end
			end
		end
		return minNode.length ? minNode[rand(minNode.length)] : false
	end
	
	# ノードを開く
	def openNode(parent, pos)
		x=pos[:x]; y=pos[:y]
		return false if x<0 || y<0 || x>=@size[:x] || y>=@size[:y]
		return false if @map[y][x].is_a?(AStar)
		cost = parent ? parent.cost + @map[pos[:y]][pos[:x]].to_i : @map[0][0].to_i
		@map[y][x] = AStar.new(parent, cost, self.calcHeuristic(pos), pos)
		return true
	end
	
	# ノードを閉じる
	def closeNode(pos)
		@map[pos[:y]][pos[:x]].status = false
	end
	
	# ヒューリスティックコストを計算する
	def calcHeuristic(pos)
		x = pos[:x] - @goal[:x]
		y = pos[:y] - @goal[:y]
		return (x.abs+y.abs)*@average
	end
	
	# スタートからゴールまでの道筋を辿る
	def calcSum()
		return node=@map[@goal[:y]][@goal[:x]].cost
	end

end

class AStar
	attr_accessor :status, :cost, :heuristic, :pos, :score, :parent
	
	def initialize(parent, cost, heuristic, pos)
		@status = true
		@parent=parent; @cost=cost; @heuristic=heuristic; @pos=pos
		self.calcScore()
	end
	
	def calcScore
		@score = @cost + @heuristic
	end
end


matrix = File.read('matrix_sample.txt')

vec = [ { :x=>1, :y=>0 }, { :x=>0, :y=>1 } ]
maze = Maze.new(matrix, vec, { :x=>5, :y=>5 } )

maze.search

p maze.calcSum
