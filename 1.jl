function part1()
    f = open("1.in")
    left_array::Vector{Int64} = []
    right_array::Vector{Int64} = []
    while !eof(f)
        input = split(readline(f), "   ")
        append!(left_array, parse(Int64, input[1]))
        append!(right_array, parse(Int64, input[2]))
    end
    sort!(left_array)
    sort!(right_array)
    sum::Int64 = 0
    for i in eachindex(left_array)
        sum += abs(right_array[i] - left_array[i])
    end
    return sum
end

function part2()
    f = open("1.in")
    left_array::Vector{Int64} = []
    right_array::Vector{Int64} = []
    while !eof(f)
        input = split(readline(f), "   ")
        append!(left_array, parse(Int64, input[1]))
        append!(right_array, parse(Int64, input[2]))
    end
    sum::Int64 = 0
    for i in left_array
        sum += i * count(j -> (j == i), right_array)
    end
    return sum
end