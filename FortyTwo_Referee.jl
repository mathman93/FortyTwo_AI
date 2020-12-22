#= FortyTwo_Referee.jl
Keeps track of score and stats for 42 games
By: Timothy Anglea
=#
dominoes = Tuple{Int,Int}[]
set_size = 6 # double-6 domino set
for s1 in 0:set_size
    for s2 in 0:s1
        push!(dominoes, (s1, s2))
    end
end
println(dominoes)
println(length(dominoes))

trick_play_array = Array{Tuple{Int, Int}}(undef, 7, 4)

for trick in 1:7
    for play in 1:4
        dom_num = (trick - 1)*4 + play
        trick_play_array[trick, play] = dominoes[dom_num]
    end
end
println(trick_play_array)