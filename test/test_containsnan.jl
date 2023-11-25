# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using CheckedCalls
using Test

@testset "containsnan" begin
    for x in (
        1.0,
        [[1.0, 2.0], [3.0, 4.0]],
        ((1.0, 2.0), (3.0, 4.0)),
        (a = (c = 1.0, d = 2.0), b = (e = 3.0, f = 4.0)),
    )
        @test !(@inferred(containsnan(x)))
    end

    for x in (
        NaN,
        [[1.0, 2.0], [NaN, 4.0]],
        ((1.0, 2.0), (NaN, 4.0)),
        (a = (c = 1.0, d = 2.0), b = (e = NaN, f = 4.0)),
    )
        @test @inferred(containsnan(x))
    end
end
