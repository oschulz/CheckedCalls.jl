# Use
#
#     DOCUMENTER_DEBUG=true julia --color=yes make.jl local [nonstrict] [fixdoctests]
#
# for local builds.

using Documenter
using CheckedCalls

# Doctest setup
DocMeta.setdocmeta!(
    CheckedCalls,
    :DocTestSetup,
    :(using CheckedCalls);
    recursive=true,
)

makedocs(
    sitename = "CheckedCalls",
    modules = [CheckedCalls],
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        canonical = "https://oschulz.github.io/CheckedCalls.jl/stable/"
    ),
    pages = [
        "Home" => "index.md",
        "API" => "api.md",
        "LICENSE" => "LICENSE.md",
    ],
    doctest = ("fixdoctests" in ARGS) ? :fix : true,
    linkcheck = !("nonstrict" in ARGS),
    warnonly = ("nonstrict" in ARGS),
)

deploydocs(
    repo = "github.com/oschulz/CheckedCalls.jl.git",
    forcepush = true,
    push_preview = true,
)
