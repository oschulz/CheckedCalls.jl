# CheckedCalls.jl

CheckedCalls let's you call Julia functions with additional checks.

The main function provided by the package is [`checkedcall(f, args...)`](@ref). By default, it check if the return value of `f(args...)` contains `NaN` values. While `0 / 0` returns `NaN`,

```
checkedcall(/, 0, 0)
```

throws an [`ReturnValueContainsNaN`](@ref) exception. `checkedcall` is indended to be specialized for specific functions, and checks do not need to be limited to checking for `NaN` values.

The package also provides the utility function [`containsnan(x)`](@ref).
