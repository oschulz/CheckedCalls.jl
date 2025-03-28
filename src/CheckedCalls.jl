# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

"""
    CheckedCalls

Function calls with additional checks.
"""
module CheckedCalls

include("exceptions.jl")
include("containsnan.jl")
include("checkedcall.jl")

end # module
