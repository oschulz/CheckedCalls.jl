# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

module CheckedCallsChangesOfVariablesExt

using CheckedCalls
using ChangesOfVariables

function ChangesOfVariables.with_logabsdet_jacobian(cf::CheckedCalls.CheckedFunction{F}, x) where F
    checkedcall(with_logabsdet_jacobian, cf.f, x)
end

end # module CheckedCallsChangesOfVariablesExt
