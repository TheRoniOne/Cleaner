import Tables

"""
    CleanTable <: Tables.AbstractColumns

A Tables.jl implementation that stores column names and columns for Cleaner.jl internal use.

The default behavior of this type is to try to copy the columns of the original Tables 
implementation a.k.a: the source, but the user can call the second constructor specifiying 
copycols=false to override this behavior and try to use the original columns directly.

If the source column type is not mutable, this will end up in errors.

# Constructors
```julia
CleanTable(names::Vector{Symbol}, cols; copycols::Bool=true)
CleanTable(table; copycols::Bool=true)
CleanTable(table::CleanTable; copycols::Bool=true)
```
"""
mutable struct CleanTable <: Tables.AbstractColumns
    names::Vector{Symbol}
    cols::Vector{AbstractVector}
    
    function CleanTable(names::Vector{Symbol}, cols; copycols::Bool=false)
        if copycols
            return new(copy(names), [copy(col) for col in cols])
        else
            return new(names, cols)
        end
    end
end

_getvector(x::AbstractVector) = x
_getvector(x) = collect(x)

function CleanTable(table; copycols::Bool=true)
    columns = Tables.columns(table)

    names = [Symbol(name) for name in Tables.columnnames(columns)]
    cols = Vector[_getvector(Tables.getcolumn(columns, name)) for name in names]

    return CleanTable(names, cols, copycols=copycols)
end

function CleanTable(table::CleanTable; copycols::Bool=true)
    return CleanTable(names(table), cols(table), copycols=copycols)
end

Tables.istable(::Type{<:CleanTable}) = true

names(ct::CleanTable) = getfield(ct, :names)
cols(ct::CleanTable) = getfield(ct, :cols)

Tables.schema(ct::CleanTable) = Tables.Schema(names(ct), [eltype(col) for col in cols(ct)])

Tables.columnaccess(::Type{<:CleanTable}) = true
Tables.columns(ct::CleanTable) = ct
Tables.getcolumn(ct::CleanTable, i::Int) = getindex(cols(ct), i)
Tables.getcolumn(ct::CleanTable, name::Symbol) = getindex(cols(ct), findfirst(isequal(name), names(ct)))
Tables.getcolumn(ct::CleanTable, ::Type{T}, i::Int, nm::Symbol) where {T} = getindex(cols(ct), i)
Tables.columnnames(ct::CleanTable) = names(ct)

Tables.materializer(ct::CleanTable) = CleanTable

function size(table::CleanTable)
    columns = cols(table)

    return (length(columns[1]), length(names(table)))
end