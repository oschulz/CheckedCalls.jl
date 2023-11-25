# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

module CheckedCallsForwardDiffExt

using CheckedCalls
import ForwardDiff

function CheckedCalls.containsnan(x::ForwardDiff.Dual)
    a = containsnan(x.value)
    b = containsnan(x.partials)
    return a || b
end

end # module CheckedCallsForwardDiffExt
