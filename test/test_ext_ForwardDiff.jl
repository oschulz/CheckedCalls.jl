# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using CheckedCalls
using Test

using ForwardDiff

@testset "ForwardDiffExt" begin
    @test !@inferred(containsnan(ForwardDiff.Dual(1.2, (1.2, 3.0, 4.0))))
    @test @inferred(containsnan(ForwardDiff.Dual(NaN, (1.2, 3.0, 4.0))))
    @test @inferred(containsnan(ForwardDiff.Dual(1.2, (1.2, NaN, 4.0))))
end
