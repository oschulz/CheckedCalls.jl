# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using CheckedCalls
using Test

@testset "exceptions" begin
    @test ReturnValueContainsNaN(NaN, +, (Inf, -Inf)) == ReturnValueContainsNaN(NaN, +, (Inf, -Inf), missing)
end
