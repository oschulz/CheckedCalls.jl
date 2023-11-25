# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using CheckedCalls
using Test

@testset "checkedcall" begin
    for (f, args) in (
        (+, (2, 3)),
        (/, (2, 3)),
    )
        @test @inferred(checkedcall(f, args...)) == f(args...)
        @test @inferred(checkedcall(f)(args...)) == f(args...)
    end

    for (f, args) in (
        (+, (Inf, -Inf)),
        (/, (0, 0)),
    )
        @test_throws ReturnValueContainsNaN checkedcall(f, args...)

        err = try
            checkedcall(f, args...)
        catch err
            err
        end

        @test err == CheckedCalls.ReturnValueContainsNaN(f(args...), f, args, missing)

        err = try
            checkedcall(f)(args...)
        catch err
            err
        end

        @test err == CheckedCalls.ReturnValueContainsNaN(f(args...), f, args, missing)
    end
end
