#= FortyTwo_Referee.jl
Keeps track of score and stats for 42 games
By: Timothy Anglea
=#

struct domino_player
    playername::String
    playerhand::Array{Tuple{Int,Int}}
    teamplayername::String
end

function get_hand(avail_dom)
    hand = Array{Tuple{Int,Int}}(undef,7)
    if length(avail_dom) == 7
        hand = copy(avail_dom)
        avail_dom = [] # no more avilable dominoes
    else # if more than 7 dominoes
        for i1 in 1:7
            number = rand(1:length(avail_dom))
            #push!(hand, avail_dom[number])
            hand[i1] = avail_dom[number]
            deleteat!(avail_dom, findfirst(x->x==avail_dom[number],avail_dom))
        end
    end
    return hand, avail_dom
end

function win_trick(four_doms, trump)
    win_index = 0
    # Who won the trick, given the four_doms and the trump?
    return win_index
end

function play_dom(hand, first_dom, trump)
    domino_to_play = 0
    # Which domino can the player play for this trick?
    return domino_to_play
end

all_dominoes = Tuple{Int,Int}[]
set_size = 6 # double-6 domino set
for s1 in 0:set_size
    for s2 in 0:s1
        push!(all_dominoes, (s1, s2))
    end
end
println(all_dominoes)
#println(length(all_dominoes))

# Da Hands
available_dominoes = copy(all_dominoes)
hand1, available_dominoes = get_hand(available_dominoes)
println(hand1)
hand2, available_dominoes = get_hand(available_dominoes)
println(hand2)
hand3, available_dominoes = get_hand(available_dominoes)
println(hand3)
hand4, available_dominoes = get_hand(available_dominoes)
println(hand4)
# Da Players
player1 = domino_player("Jeniya", hand1, "Timothy")
player3 = domino_player("Timothy", hand3, "Jeniya")
player2 = domino_player("Mom", hand2, "Dad")
player4 = domino_player("Dad", hand4, "Mom")

#println(player4.playerhand)

available_dominoes = copy(all_dominoes)
trick_play_array = Array{Tuple{Int, Int}}(undef, 7, 4)
for trick in 1:7
    dom1 = player1.playerhand[rand(1:length(player1.playerhand))]
    deleteat!(player1.playerhand, findfirst(x->x==dom1,player1.playerhand))
    dom2 = player2.playerhand[rand(1:length(player2.playerhand))]
    deleteat!(player2.playerhand, findfirst(x->x==dom2,player2.playerhand))
    dom3 = player3.playerhand[rand(1:length(player3.playerhand))]
    deleteat!(player3.playerhand, findfirst(x->x==dom3,player3.playerhand))
    dom4 = player4.playerhand[rand(1:length(player4.playerhand))]
    deleteat!(player4.playerhand, findfirst(x->x==dom4,player4.playerhand))

    trick_play_array[trick,1] = dom1
    trick_play_array[trick,2] = dom2
    trick_play_array[trick,3] = dom3
    trick_play_array[trick,4] = dom4
    #=for play in 1:4
        dom_num = rand(1:length(available_dominoes))
        trick_play_array[trick, play] = available_dominoes[dom_num]
        deleteat!(available_dominoes, findfirst(x->x==available_dominoes[dom_num],available_dominoes))
    end =#
end
#println(trick_play_array)
#display(trick_play_array)
show(stdout, "text/plain", trick_play_array) # Displays whole array