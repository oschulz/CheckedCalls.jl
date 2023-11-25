# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

"""
    CheckedCalls

Function calls with additional checks.
"""
module CheckedCalls

include("exceptions.jl")
include("containsnan.jl")
include("checkedcall.jl")

@static if !isdefined(Base, :get_extension)
    include("../ext/CheckedCallsChainRulesCoreExt.jl")
    include("../ext/CheckedCallsChangesOfVariablesExt.jl")
    include("../ext/CheckedCallsForwardDiffExt.jl")
    include("../ext/CheckedCallsInverseFunctionsExt.jl")
end

end # module
