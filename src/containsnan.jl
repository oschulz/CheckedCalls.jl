# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).


"""
    containsnan(x)::Bool

Checks if `x` definitely is or contains a `NaN` value.

Returns `false` if `containsnan` is not defined for the type of `x` and should
also return `false` if checking `x` would be computationally expensive.
"""
function containsnan end
export containsnan

@inline containsnan(x) = false

@inline containsnan(x::Number) = isnan(x)::Bool

@inline containsnan(x::Tuple) = any(containsnan, x)::Bool

@inline containsnan(x::NamedTuple{names,T}) where {names,T} = containsnan(values(x)::T)::Bool

containsnan(x::AbstractArray) = any(containsnan, x)::Bool


"""
    throw_if_containsnan(r, f, args)

Utility function that checks if a value `r`, assumed to be the result of
`f(args...)`, contains `NaN` values and if so, throws an
`ReturnValueContainsNaN` exception.

`throw_if_containsnan` comes with an specialized `ChainRulesCore.rrule` to avoid
computational overhead during automatic differentiation.
"""
function throw_if_containsnan(r, f, args)
    if containsnan(r)
        throw(ReturnValueContainsNaN(r, f, args))
    end
    return nothing
end
export throw_if_containsnan
