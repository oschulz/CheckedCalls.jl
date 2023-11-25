# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

import Test

Test.@testset "Package CheckedCalls" begin
    include("test_aqua.jl")
    include("test_exceptions.jl")
    include("test_containsnan.jl")
    include("test_checkedcall.jl")
    include("test_ext_ChainRulesCore.jl")
    include("test_ext_ChangesOfVariables.jl")
    include("test_ext_ForwardDiff.jl")
    include("test_ext_InverseFunctions.jl")
    include("test_docs.jl")
end # testset
