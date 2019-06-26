# End-to-end Deep Learning of Optimization Heuristics (PACT'17).

licenses(["restricted"])  # GPL v3

exports_files([
    "LICENSE",
    "README.md",
])

genrule(
    name = "2017_09_pact",
    srcs = glob([
        "tex/**/*.tex",
        "tex/img/*",
        "tex/refs.bib",
        "tex/IEEEtran.cls",
        "tex/IEEEtranS.bst",
    ]),
    outs = ["2017_09_pact.pdf"],
    cmd = "$(location //tools:autotex) docs/2017_09_pact/tex/paper.tex $@",
    tools = ["//tools:autotex"],
)
