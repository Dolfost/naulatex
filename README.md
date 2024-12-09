# latex-report-template
This project is a `CMake` template generator for latex reports.
It is intended that it isn't integrated into editor, just pure `CMake`, `latexmk` and `texlogfilter`.

## Typical workfrow
Fork the repository, change the `/src/templates/` to your liking.
Then when the `LRT_JOB` writing time on `LRT_SUBJECT` strikes, just clone the repository and configure it with 
```
$ cmake -B build -S . -DJRT_SUBJECT=<subject> -DLRT_JOB=<job> 
```
and go fill configured project in `src/contents/chapters`.

## Configuration in detail
### CMake settings 
Next options are avaliable:

Option | Type | Explanation
-|-|-|
`LRT_SUBJECT`| STRING | provides the subject folder name in `/src/templates/subjects`
`LRT_JOB`| STRING | provides the job folder name in `/src/templates/jobs`
`LRT_OVERRIDE_CHAPTERS` | BOOL | if `src/contents/chapters.lock` already exists, this option makes it to be deleted and configured with according `LRT_SUBJECT` chapters

### CMake targets
Target | Explanation
-|-|
`pdf` | main document 
`pdf_clean` | remove all files produced by `latexmk`

Also, after configuration the `build/continious` `sh` script is generated as an alternative to `pdf` target.
### Configuration process
1. Process options
1. Configure chapters in `src/contents/chapters` if `src/contents/chapters.lock` doesn't exists or `LRT_OVERRIDE_CHAPTERS` is true.
1. Create empty subject-specific bibliography in `src/contents/bibliography` if it does not exists.
1. Create subject-specific redefines in `src/contents/redefines` if it does not exists.

### Tree overview
```
./
├── CMakeLists.txt
├── LICENSE.txt
├── README.md
├── build/
│   ├── CMakeCache.txt
│   ├── CMakeFiles/
│   ├── Makefile
│   ├── cmake_install.cmake
│   ├── continious* >> script to start continious compilation
│   └── src/
│       ├── CMakeFiles/
│       ├── Makefile
│       ├── cmake_install.cmake
│       ├── config/ >> configured project
│       │   ├── bibliography.bib
│       │   ├── cmakeDefines.tex
│       │   ├── jobDefines.tex
│       │   ├── matter/
│       │   └── subjectDefines.tex
│       └── latexmkrc
├── cmake/
└── src/
    ├── CMakeLists.txt
    ├── cmake/
    │   ├── FindLatexMk.cmake
    │   ├── FindTexLogFilter.cmake
    │   └── setup.cmake >> configuration logics
    ├── contents/
    │   ├── bibliography.bib
    │   ├── chapters/ >> configured chapters
    │   ├── chapters.lock
    │   └── redefines.tex >> configured redefines
    ├── document.tex >> main document
    ├── preamble.tex >> main preamble
    └── templates/
        ├── cmakeDefines.tex.in >> bridge for cmake variable to latex
        ├── continuous.sh.in
        ├── defines.tex
        ├── jobs/
        │   └── ... >> LRT_JOB
        ├── latexmkrc.in
        ├── matter/ >> default matter
        │   ├── backmatter.tex
        │   ├── frontmatter.tex
        │   └── title.tex
        ├── packages/ >> package specific settings
        ├── redefines.tex.in >> redefines input
        ├── resources/ >> project-specific resources
        │   ├── fonts/
        │   └── images/
        └── subjects/
            └── ... >> LRT_SUBJECT
```

### Contents of `src/templates/subjects/${LRT_SUBJECT}`
```
src/templates/subjects/${LRT_SUBJECT}
├── bibliography.bib
├── matter
│   ├── title.tex
│   ├── frontmatter.tex
│   └── backmatter.tex
├── chapters
│   ├── chapter1
│   │   ├── chapter1.tex
│   │   └── images
│   ├── chapter2
│   │   ├── chapter2.tex
│   │   └── images
│   ├── chapter3
│   │   ├── chapter3.tex
│   │   └── images
│   └── ...
├── chapters.tex
└── defines.tex
```
The `bibliography.bib` contains all-time avaliable bibliography. `chapters/`
directory contains chapters order and inclusion sequence of which are described
in `defines.tex`, for example:
```
\subfile{chapters/chapter1/chapter1} 
\subfile{chapters/chapter2/chapter2} 
\subfile{chapters/chapter3/chapter3} 
% ...
```
###### `defines.tex`
File contains subject-specific commands definitions:
```
\newcommand{\subjectname}{Computer Science}
\newcommand{\teachername}{professor Quentin~Tarantino}
```
###### `matter/`
This directory and its contents are optional. If some of `title.tex`, `frontmatter.tex` or `backmatter.tex` is not present, then the default one from `src/templates/matter/` is used. Useful if some subjects use different table of contents or title.
### Contents of `src/templates/jobs/${LRT_JOB}`
```
src/templates/jobs/${LRT_JOB}
└── defines.tex
```
###### `defines.tex`
```
\newcommand{\jobtitle}{Laboratory work}
```
