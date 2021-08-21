var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = Cleaner","category":"page"},{"location":"#Cleaner","page":"Home","title":"Cleaner","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Simple tools for common data cleaning problems.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [Cleaner]","category":"page"},{"location":"#Cleaner.CleanTable","page":"Home","title":"Cleaner.CleanTable","text":"CleanTable <: Tables.AbstractColumns\n\nA Tables.jl implementation that stores column names and columns for Cleaner.jl internal use.\n\nThe default behavior of this type is to try to copy the columns of the original Tables  implementation a.k.a: the source, but the user can call the second constructor specifiying  copycols=false to override this behavior and try to use the original columns directly.\n\nIf the source column type is not mutable, this will end up in errors.\n\nConstructors\n\nCleanTable(names::Vector{Symbol}, cols; copycols::Bool=true)\nCleanTable(table; copycols::Bool=true)\nCleanTable(table::CleanTable; copycols::Bool=true)\n\n\n\n\n\n","category":"type"},{"location":"#Cleaner.compact_columns!-Tuple{Cleaner.CleanTable}","page":"Home","title":"Cleaner.compact_columns!","text":"compact_columns!(table::CleanTable; empty_values::Vector=[])\n\nRemoves in-place from a CleanTable all columns filled entirely by missing and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.compact_columns-Tuple{Any}","page":"Home","title":"Cleaner.compact_columns","text":"compact_columns(table; empty_values::Vector=[])\n\nCreates a CleanTable with copied columns and removes from it all columns filled entirely by missing  and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.compact_rows!-Tuple{Cleaner.CleanTable}","page":"Home","title":"Cleaner.compact_rows!","text":"compact_rows!(table::CleanTable; empty_values::Vector=[])\n\nRemoves in-place from a CleanTable all rows filled entirely by missing and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.compact_rows-Tuple{Any}","page":"Home","title":"Cleaner.compact_rows","text":"compact_rows(table; empty_values::Vector=[])\n\nCreates a CleanTable with copied columns and removes from it all rows filled entirely by missing  and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.compact_table!-Tuple{Cleaner.CleanTable}","page":"Home","title":"Cleaner.compact_table!","text":"compact_table!(table::CleanTable; empty_values::Vector=[])\n\nRemoves in-place from a CleanTable all rows and columns filled entirely by missing and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.compact_table-Tuple{Any}","page":"Home","title":"Cleaner.compact_table","text":"compact_table(table; empty_values::Vector=[])\n\nCreates a CleanTable with copied columns and removes from it all rows and columns filled entirely by missing  and empty_values.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.generate_polished_names-Tuple{Any}","page":"Home","title":"Cleaner.generate_polished_names","text":"generate_polished_names(names; style::Symbol=:snake_case)\n\nReturn a vector of symbols containing new names that are unique and formated using the style selected.\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.polish_names!-Tuple{Cleaner.CleanTable}","page":"Home","title":"Cleaner.polish_names!","text":"polish_names!(table::CleanTable; style::Symbol=:snake_case)\n\nReturn a CleanTable where column names have been replaced to be unique and formated using  the style selected. \n\nStyles\n\nsnake_case\ncamelCase\n\n\n\n\n\n","category":"method"},{"location":"#Cleaner.polish_names-Tuple{Any}","page":"Home","title":"Cleaner.polish_names","text":"polish_names(table; style=:snake_case)\n\nCreate and return a CleanTable with copied columns having column names replaced to be unique and formated  using the style selected. \n\nStyles\n\nsnake_case\ncamelCase\n\n\n\n\n\n","category":"method"}]
}
