# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

module CheckedCallsChainRulesCoreExt

using CheckedCalls
using ChainRulesCore

using CheckedCalls: ReturnValueContainsNaN


_containsnan_pullback(ΔΩ) = (NoTangent(), NoTangent())
function ChainRulesCore.rrule(::typeof(containsnan), x)
    return containsnan(x), _containsnan_pullback
end


_throw_if_containsnan_pullback(ΔΩ) = (NoTangent(), NoTangent(), NoTangent(), NoTangent())
function ChainRulesCore.rrule(::typeof(throw_if_containsnan), r, f, args)
    return throw_if_containsnan(r, f, args), _throw_if_containsnan_pullback
end


_curried_checkedcall_pullback(ΔΩ) = (ΔΩ,)
function ChainRulesCore.rrule(::typeof(checkedcall), f)
    return checkedcall(f), _curried_checkedcall_pullback
end


end # module CheckedCallsChainRulesCoreExt
