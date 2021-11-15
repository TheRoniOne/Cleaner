using Test
using Cleaner: CleanTable, get_all_repeated

@testset "get_all_repeated is working as expected" begin
    testCT = CleanTable([:A, :B], [["y", "x", "y"], ["x", "x", "x"]])

    let result = nothing
        result = get_all_repeated(testCT, [:A])
        @test result.row_index == [1, 3]
        @test result.A == ["y", "y"]
    end

    let result = nothing
        result = get_all_repeated(testCT, [:A, :B])
        @test result.row_index == [1, 3]
        @test result.A == ["y", "y"]
        @test result.B == ["x", "x"]
    end

    let err = nothing
        try
            get_all_repeated(testCT, [:C])
        catch err
        end

        @test err isa Exception
        @test sprint(showerror, err) == "All column names specified must exist in the table"
    end
end
