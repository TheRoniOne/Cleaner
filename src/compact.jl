"""
    compact_table!(table::CleanTable; empty_values::Vector=[])


"""
function compact_table!(table::CleanTable; empty_values::Vector=[])
    return compact_rows!(compact_columns!(table, empty_values=empty_values), empty_values=empty_values)
end

function compact_table(table; empty_values::Vector=[])
    return compact_table!(CleanTable(table), empty_values=empty_values)
end

function compact_columns!(table::CleanTable; empty_values::Vector=[])
    columns = cols(table)
    ndel = 0

    for i in 1:length(columns)
        if _is_empty_col(columns[i - ndel], empty_values=empty_values)
            deleteat!(columns, i - ndel)
            deleteat!(names(table), i - ndel)
            ndel += 1
        end
    end

    return table
end

function compact_columns(table; empty_values::Vector=[])
    return compact_columns!(CleanTable(table), empty_values=empty_values)
end

function _is_empty_col(col; empty_values::Vector=[])
    for el in skipmissing(col)
        isempty(empty_values) && return false

        !in(el, empty_values) && return false
    end
    
    return true
end

function compact_rows!(table::CleanTable; empty_values::Vector=[])
    columns = cols(table)
    nrows = length(columns[1])
    row_state = replace!(Vector{Bool}(undef, nrows), true => false)
    
    for col in columns
        i = 1

        while i <= nrows
            if !row_state[i] && !ismissing(col[i]) && !in(col[i], empty_values) #el problema esta en q row_state se esta tomando como col_state (no revisa col 1 ni 3)
                row_state[i] = true
            end
            i += 1
        end
    end

    to_delete = findall(!, row_state)
    for col in columns
        map(x -> deleteat!(col, x), to_delete)
    end

    return table
end

function compact_rows(table; empty_values::Vector=[])
    return compact_rows!(CleanTable(table), empty_values=empty_values)
end
