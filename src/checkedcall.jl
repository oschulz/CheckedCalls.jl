# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).


"""
    checkedcall(f, args...)
    checkedcall(f)

Calls `f(args...)`, checks the result for abnormalities, and either returns
the result or throws an exception.

`checkedcall(f)(args...)` is equivalent to `checkedcall(f, args...)`.

By default, checks the return value with `containsnan`.

`checkedcall` should be specialized if the underlying cause of the
abnormality can be determined more precisely without undue computational
overhead. For example for

```julia
chained(f, g, x) = f(g(x))
```

One may want to specialize

```julia
function checkedcall(::typeof(chained), f, g, x)
    checkedcall(f, checkedcall(g, x))
end
```

`checkedcall` may also be specialized to perform additional output (and
input) value checks for specific functions, checks do not need to be limited
to `NaN` values.
"""
function checkedcall end
export checkedcall

@inline function checkedcall(f, args...)
    r = f(args...)
    throw_if_containsnan(r, f, args)
    return r
end


"""
    struct CheckedFunction{F}

Default return value of `checkedcall(f)`.

Do not instantiate this type directly, use [`checkedcall(f)`](@ref) instead.
"""
struct CheckedFunction{F} <: Function
    f::F
end

@inline (cf::CheckedFunction{F})(args...) where F = checkedcall(cf.f, args...)


@inline checkedcall(f::F) where {F} = CheckedFunction{F}(f)

# Ensure type stability if function is a type (constructor):
@inline checkedcall(f::Type{T}) where T = CheckedFunction{Type{T}}(f)

@inline checkedcall(cf::CheckedFunction) = cf
