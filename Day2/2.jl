function read_input()
    f = open("2.in")
    report_array = []
    while (!eof(f))
        push!(report_array, map(x -> parse(Int64, x), split(readline(f), " ")))
    end
    return report_array
end

function part1()
    report_array = read_input()
    no_safe_reports = 0

    for i in eachindex(report_array)
        past_slope = 0
        no_safe_reports += 1
        for j in 1 : length(report_array[i]) - 1 
            if 1 ≤ report_array[i][j + 1] - report_array[i][j] ≤ 3 && past_slope ≥ 0
                past_slope = report_array[i][j + 1] - report_array[i][j]
            elseif -3 ≤ report_array[i][j + 1] - report_array[i][j] ≤ -1 && past_slope ≤ 0
                past_slope = report_array[i][j + 1] - report_array[i][j]
            else
                no_safe_reports -= 1
                break
            end
        end
    end
    return no_safe_reports
end

function part2() #Non-regex solution
    report_array::Vector{Vector{Int64}} = read_input()
    no_safe_reports::Int64 = 0
    for report in report_array
        for r in 1 : length(report)
            is_report_unsafe = false
            new_report = deepcopy(report)
            deleteat!(new_report, r)
            past_slope = 0
            for i in 1 : length(new_report) - 1
                if 1 ≤ new_report[i + 1] - new_report[i] ≤ 3 && past_slope ≥ 0
                    past_slope = new_report[i + 1] - new_report[i]
                elseif -3 ≤ new_report[i + 1] - new_report[i] ≤ -1 && past_slope ≤ 0
                    past_slope = new_report[i + 1] - new_report[i]
                else
                    is_report_unsafe = true
                    break
                end
            end
            if !is_report_unsafe
                no_safe_reports += 1
                break
            end
        end
    end
    return no_safe_reports
end

println(part2())