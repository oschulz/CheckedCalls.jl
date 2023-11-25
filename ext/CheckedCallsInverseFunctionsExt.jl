# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

module CheckedCallsInverseFunctionsExt

using CheckedCalls
import InverseFunctions

InverseFunctions.inverse(cf::CheckedCalls.CheckedFunction) = checkedcall(inverse(cf.f))

end # module CheckedCallsInverseFunctionsExt
