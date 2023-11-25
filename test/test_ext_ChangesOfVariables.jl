# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using CheckedCalls
using Test

using ChangesOfVariables

@testset "ChangesOfVariablesExt" begin
    @test @inferred(with_logabsdet_jacobian(checkedcall(log), 0.7)) == with_logabsdet_jacobian(log, 0.7)
end
