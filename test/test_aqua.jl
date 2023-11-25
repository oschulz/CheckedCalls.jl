# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

import Test
import Aqua
import CheckedCalls

Test.@testset "Package ambiguities" begin
    Test.@test isempty(Test.detect_ambiguities(CheckedCalls))
end # testset

Test.@testset "Aqua tests" begin
    Aqua.test_all(
        CheckedCalls,
        ambiguities = VERSION≥v"1.9"
    )
end # testset
