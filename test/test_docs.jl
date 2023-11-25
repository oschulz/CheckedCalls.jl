# This file is a part of CheckedCalls.jl, licensed under the MIT License (MIT).

using Test
using CheckedCalls
import Documenter

Documenter.DocMeta.setdocmeta!(
    CheckedCalls,
    :DocTestSetup,
    :(using CheckedCalls);
    recursive=true,
)
Documenter.doctest(CheckedCalls)
