%
%                              .;;.                    
%                             /;;;;\  ___      .;;.       |\
%                            |;(;;;-""   `'-.,;;;;;\      +-+
%                             \;'            ';;;);/      |X|
%                             /                \;;'       |X|
%                            /    .;.   .;.     \         |X|    ___
%                            |   ;;o;; ;;o;;    |         +-+   /MMMMMA.
%                            ;   '"-'` `'-"'    |         |X|  /____  
%                            /\      ._.       /          |X| / `VMMMA.
%                          ;;;;;_   ,_Y_,   _.'           |X|/    
%                         /;;;;;\`--.___.--;.             +-+
%                        /|;;;;;;;.__.;;;.  \\            |X|
%                       ;  \;;;;;;;;;;;;;;\  ;\__  .;.    |X|
%                       |   ';;;;;;;;=;;;;'  |-__;;;;/    |X|
%                       |     `""`  .---._  /;/;;\;;/     +-+
%                      / ;         /;;;;;;;-;/;;/|;/      |X|
%                      \_,\       |;;;;;;;;;;;;| |        |X|
%                          '-...--';;;;;;;;;;;;\/         |X|
%                                   `"""`   `"`       
%                                                      
%                         B O N A P A R T I C L E      
%                         =======================
%
% This class helps you make magazines that do not look awful (although nothing
% stops you from making awful-looking magazines anyway), using LaTeX.
%
% This class was created with several goals:
% - To offer an easy and somewhat idiot-proof interface to those who need to
%   create reasonably-looking magazines with lots of images;
% - To offer an easy interface to those who are tasked with the creation of a
%   custom-made LaTeX class, but don’t want to spend much time doing that;
% - So I finally have something to put on my GitHub account (even though I
%   technically never use (La)TeX, so this is kind of not very representative
%   of what I actually do).
%
%
%     -- Chun Fei Lung




% ---------------------------------------------------------------------------- %




\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{bonaparticle}[
    2015/10/25
    I definitely should've named this the magazine class.
]




% ---------------------------------------------------------------------------- %




%    C L A S S   O P T I O N S
%    -------------------------
% Several options can be passed to the bonaparticle class, including (but not
% necessarily limited to):
%  - print
%  - a4paper
%  - a5paper




%    p r i n t
%    - - - - -
% The "print" class option adds crop marks, color bars and other fancy stuff
% that make industrial printers very happy.
%
%  +- Example 1 (useful example) ----------+
%  |                                       |
%  |  \documentclass[print]{bonaparticle}  |
%  |                                       |
%  +---------------------------------------+
%
%  +- Example 2 (stupid example) ----------+
%  |                                       |    This is a stupid example,
%  |  \LoadClass[print]{bonaparticle}      |    because this should be left to
%  |                                       |    whoever compiles the document.
%  +---------------------------------------+


% This creates a new \print boolean
\newif\ifprint


\DeclareOption{print}{
    % We'll use the print variable later in this class file
    \printtrue
}




%    a 4 p a p e r / a 5 p a p e r
%    - - - - - - - - - - - - - - -
% Theoretically you can choose to pass either the a4paper or a5paper option to
% the bonaparticle class. Currently the a4paper is horribly broken however, and
% to make matters worse, the class will assume that you'll want a4paper if you
% don't explicitly tell it to use something different.
%
%  +- Example 1 (stupid example) ------------+
%  |                                         |    This is a stupid example,
%  |  \documentclass[a4paper]{bonaparticle}  |    because you're not supposed to
%  |                                         |    use this class directly.
%  +-----------------------------------------+
%
%  +- Example 2 (useful example) ----------+
%  |                                       |
%  |  \LoadClass[a4paper]{bonaparticle}    |
%  |                                       |
%  +---------------------------------------+


% Some sensible values for A4-sized magazines (okay, I have to admit that they
% might not necessarily make sense - but hey, at least it compiles, right?)
\newcommand{\geometrypaperheight}{297mm}
\newcommand{\geometrypaperwidth} {210mm}
\newcommand{\geometrytextheight} {255mm}
\newcommand{\geometrytextwidth}  {182mm}
\newcommand{\geometrytop}        {1.8cm}
\newcommand{\geometrybottom}     {1.2cm}
\newcommand{\geometryleft}       {1.4cm}
\newcommand{\geometryright}      {1.4cm}

\newcommand{\croppaperheight}{337mm}
\newcommand{\croppaperwidth} {242mm}


\DeclareOption{a4paper}{
    % Just use the values listed above
}


\DeclareOption{a5paper}{
    % Or use these if the magazine should be A5-sized
    \renewcommand{\geometrypaperheight}{210mm}
    \renewcommand{\geometrypaperwidth} {148mm}
    \renewcommand{\geometrytextheight} {168mm}
    \renewcommand{\geometrytextwidth}  {120mm}
    \renewcommand{\geometrytop}        {1.8cm}
    \renewcommand{\geometrybottom}     {1.2cm}
    \renewcommand{\geometryleft}       {1.4cm}
    \renewcommand{\geometryright}      {1.4cm}

    \renewcommand{\croppaperheight}{250mm}
    \renewcommand{\croppaperwidth} {180mm}
}




% Parse options and do things (this is both a fancy and casual way of saying
% that I don't really know what it does nor should I have to know)
\ExecuteOptions{}
\ProcessOptions




% ---------------------------------------------------------------------------- %




% Rather than reinventing the wheel entirely, we base the bonaparticle class on
% the standard report class (Why not memoir, you ask? I don't know anymore)
\LoadClass[twoside]{report}




% ---------------------------------------------------------------------------- %




%    P A C K A G E S
%    ---------------
% Loadin' packages here!
%
% Please note that the babel package is NOT automatically loaded by this class.
% If your class is used with pdftex, please load the babel package in your
% bonaparticle child class.




% This tells LaTeX what size the page should be. The \geometrysomethings were
% defined a few lines earlier (up there ^)
\RequirePackage[
    paperheight=\geometrypaperheight,
    paperwidth =\geometrypaperwidth,
    textheight =\geometrytextheight,
    textwidth  =\geometrytextwidth,
    top        =\geometrytop,
    bottom     =\geometrybottom,
    left       =\geometryleft,
    right      =\geometryright
]{geometry}


% This tells LaTeX that we want to make use of colors, without having to work
% with human-unfriendly color codes (unless we want to).
\RequirePackage[
    usenames,
    dvipsnames,
    svgnames,
    table
]{xcolor}


% Microtypography
\RequirePackage[
    factor=2000 % "This" is how paragraphs with quotation marks at the beginning
]{microtype}    %  or end of lines will be typeset with a factor of 2000.




%    A   b i g   a s s - l i s t
%    - - - - - - - - - - - - - -
% A very long list with packages that can be loaded without passing options.
%
% Also see: http://xkcd.com/37/


\RequirePackage{
  % I don't know what these packages do exactly, but I was told that they make
  % mathematicians very happy. Happy mathematicians make me happy.
    amsfonts,
    amsmath,
    amssymb,
    amsthm,
  % Better-looking tables
    booktabs,
  % For doing calculations
    calc,
  % A more clever way to insert references to figures, tables, equations, etc.
    cleveref,
  % Used for the color bar in the print version
    colortbl,
  % Better quotations
    csquotes,
  % More control over the presentation of itemize, description, and enumerate
    enumitem,
  % Pictures.
    eso-pic,
  % Offers programming facilities for LaTeX
    etoolbox,
  % Stuff that should be executed every page
    everypage,
  % One can't ever have enough weird symbols.
    latexsym,
  % Makes it easier to style headers and footers.
    fancyhdr,
  % Fancier-looking verbatims (@todo: replace this by the minting package?)
    fancyvrb,
  % For some lines and stuff
    framed,
  % Listing graphicx here again
    graphicx,
  % Does exactly what you think it does
    ifthen,
  % Only used for checking whether the document is compiled using XeTeX
    ifxetex,
  % For redefining commands with optional arguments
    letltxmacro,
  % Easily insert placeholder texts
    lipsum,
  % Handy for code
    listings,
  % Support for multi-column articles.
    multicol,
  % Fixes some of the issues with two-column articles 
    fix2col,
  % We don't want no \noindent
    parskip,
  % For including full-page centered PDFs and raster images
    pdfpages,
  % Includes support for highlighting and strikethrough text among other things
    soul,
  % Arbitrary font sizes
    scrextend,
  % Fancier captions (don't load this too early)
    caption,
  % A considerably better linespread
    setspace,
  % Subfigures
    subcaption,
  % Not actually used in this class yet, but kind of nice to have
    tikz,
  % Styling of chapters and sections
    titlesec,
  % Easily style the table of contents
    titletoc,
  % I forgot what this does. Just gonna leave it just in case.
    trimspaces,
  % Straight quotes in verbatim environments
    upquote,
  % Smart spaces (but still not self-aware)
    xspace,
  % For inserting full-page images
    wallpaper,
  % For inserting floating images
    wrapfig,
  % Hyperlink support. You will want to load this package as late as possible.
    hyperref
}




%    X e T e X
%    - - - - -


% Depending on whether the document is compiled using pdfLaTeX (which is what
% the majority of people use) or XeTeX (which has a considerably more user-
% friendly way of handling fonts), we'll need either mathspec and polyglossia
% or inputenc. The babel package is not loaded automatically.
\ifxetex
    \RequirePackage{
        % Enables font loading for math. Also loads fontspec, which is used to
        % load "normal" fonts
        mathspec,
        % A XeTeX man's babel package
        polyglossia
    }
\else
    \RequirePackage[utf8]{inputenc}
    % Make sure you load this package in your subclass with the correct set of
    % languages.
    % \RequirePackage[<language(s)>]{babel}
\fi




%    p r i n t
%    - - - - -


% See? I told you I would use the \print variable! Here we check whether it's
% true (i.e. the bonaparticle class was loaded with the print option). If so,
% we'll load the crop package with some sensible default options, draw a fancy
% color bar on every page, and use color definitions in CMYK format rather than
% RGB.
\ifprint
    \RequirePackage[
        cam,
        width=\croppaperwidth,
        height=\croppaperheight,
        center
    ]{crop}
\fi




% ---------------------------------------------------------------------------- %




%    A R C A N E   S T U F F   T H A T   S O M E H O W   W O R K S
%    -------------------------------------------------------------
% While most of this class was written to be somewhat easy to understand for
% LaTeX novices (with some degree of exposure to markup languages and/or basic
% scripting), there are also things which cannot easily be expressed in simple
% LaTeX code. This section contains exactly that type of code. It's probably
% best to treat everything in this section as a black box.




%    d o c m u t e   ( m o d i f i e d )
%    - - - - - - - - - - - - - - - - - -
% The following code is a simplified version of the docmute package. In a
% nutshell: this allows us to include entire LaTeX documents. If you want to
% know what each line does, run a diff on this section and docmute.sty, and read
% the package documentation.
%
% Important changes include:
%  - The preamble is kept intact: this also means that whoever compiles the
%    master document should make sure there are no conflicts among files
%  - Some class variables are reset each time the compiler encounters a
%    \documentclass


\let\article@document=\document
\let\article@enddocument=\enddocument
\def\document{%
    \article@document
    \newcount\article@nestinglevel
    \article@nestinglevel=0\relax
    \renewcommand{\documentclass}[2][]{
        % You may want to redefine this \resetbonaparticlevariables command in
        % your child class.
        \resetbonaparticlevariables
    }
    \renewenvironment{document}{%
        \clearpage
        \endgroup
        \advance \article@nestinglevel 1\relax
        \ignorespaces
    }{%
        \ifnum\article@nestinglevel=0
            \expandafter\article@enddocument
        \else
            \advance \article@nestinglevel -1\relax
            \begingroup
            \endinput
        \fi
    }%
    \ignorespaces
}


% This command resets a number of counters and class variables. Redefine this
% command in your child class as you see fit.
\newcommand{\resetbonaparticlevariables}{
    \setcounter{figure}{0}
    \setcounter{equation}{0}
    \setcounter{table}{0}

    \genre     {Article}
    \title     {***INSERT TITLE HERE***}
    \subtitle  {\vspace{-.2\baselineskip}} % Prevent awkward whitespace
    \author    {}
    \date      {\today}
    \genrecolor{black}

    % Using \thisheadercolor and \thisfootercolor won't work here
    \renewcommand{\theheadercolor}{gray}
    \renewcommand{\thefootercolor}{black}
}




% ---------------------------------------------------------------------------- %




%    C O N S T A N T S   A N D   V A R I A B L E S
%    ---------------------------------------------
% Constants and variables are defined in this section. If you want to base your
% own magazine class on bonaparticle, you'll probably want to override these
% defaults.




%    D i m e n s i o n s
%    - - - - - - - - - -
% Sizes and stuff. Note that dimensions related to the page size and page
% margins have already been set above when loading packages.


% Adding more (but not too much) white space between lines makes text more
% pleasant to read.
\linespread{1.2}


% Adding more (but not too much) white space between columns makes text more
% pleasant to look at (and read).
\setlength{\columnsep}{15pt}




%    C o l o r s
%    - - - - - -
% Colors make everyone happy!


% Make hyperlinks invisible to the user. This is absolutely horrible from a UX
% point of view, but it ensures that the online PDF version will look exactly
% the same as the print version (give or take 3 millimeters due to inprecise
% cutting of paper sheets). I strongly advise converting your TeX articles to
% either XML+XSLT or HTML+CSS if you want to publish an online version.
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}




%    P a t h s
%    - - - - -
% Everything related to paths is listed here. These commands tell LaTeX where
% it can find certain files.


% Modifying \include so that it correctly sets the graphicspaths
% for each article
\let\originalinclude\include
\LetLtxMacro\originalincludepdf\includepdf

\renewcommand{\includepdf}[2][]{
    \IfFileExists{./#2.jpg}{
        \originalincludepdf[#1]{./#2.jpg}
    }{
        \IfFileExists{./#2.pdf}{
            \originalincludepdf[#1]{./#2.pdf}
        }{
            \originalincludepdf[#1]{./#2.png}
        }
    }
}

\renewcommand{\include}[1]{
    % Extract the folder and filename of the included article
    \makeatletter
    \filename@parse{#1}
    \let\articlepath\filename@area
    \let\articlefile\filename@base
    \makeatother

    % When each of these paths will be used, in reverse order:
    %  2. When you compile a standalone article
    %  1. When you compile a master document
    \graphicspath{
        {./\articlepath/}
        {./}
    }

    % Let‘s just pretend that this code is some kind of expressionist art,
    % and not something my three year old nephew could have written.
    \renewcommand{\includepdf}[2][]{
        \IfFileExists{./\articlepath/##2.jpg}{
            \originalincludepdf[##1]{./\articlepath/##2.jpg}
        }{
            \IfFileExists{./\articlepath/##2.pdf}{
                \originalincludepdf[##1]{./\articlepath/##2.pdf}
            }{
                \IfFileExists{./\articlepath/##2.png}{
                    \originalincludepdf[##1]{./\articlepath/##2.png}
                }{
                    \IfFileExists{./##2.jpg}{
                        \originalincludepdf[##1]{./##2.jpg}
                    }{
                        \IfFileExists{./##2.pdf}{
                            \originalincludepdf[##1]{./##2.pdf}
                        }{
                            \IfFileExists{./##2.png}{
                                \originalincludepdf[##1]{./##2.png}
                            }{
                                \originalincludepdf[##1]{./##2}
                            }
                        }
                    }
                }
            }
        }
    }

    % Fake pages should not show up in the final version of the magazine.
    \renewcommand{\fakepage}{}

    \originalinclude{./\articlepath/\articlefile}
}


% This allows us to include graphics without the need to include the file
% extension. This is useful if you need to convert image files from one format
% to another (e.g. RGB to CMYK), and want to prioritize JPEGs.
\DeclareGraphicsExtensions{.jpg,.pdf,.png}




%    P l a c e h o l d e r s
%    - - - - - - - - - - - -
% Every document compiled using the bonaparticle class should set a number of
% variables. Here we set some sensible placeholders. These variables are
% explained in the "Commands" section of this class.


% Variables that should only be set once per issue
\newcommand{\themagazinename  }{Bonaparticle}
\newcommand{\themagazinetheme }{Undefined theme}
\newcommand{\themagazinevolume}{0}
\newcommand{\themagazineissue }{0}


% Variables that can be set for each article
\newcommand{\thegenre          }{}
\newcommand{\thetitle          }{}
\newcommand{\theshortenedtitle }{} % Not to be directly set by users
\newcommand{\thesubtitle       }{}
\newcommand{\theauthor         }{}
\newcommand{\theshortenedauthor}{} % Not to be directly set by users
\newcommand{\thedate           }{} % 


% These values will be redefined by \resetbonaparticlevariables.
\newcommand{\thegenrecolor }{black}
\newcommand{\thegenrecolour}{black}
\newcommand{\theheadercolor}{black}
\newcommand{\thefootercolor}{black}




%    C o l o r s
%    - - - - - -
% Q: What is black and white and red all over?
% A: A panda bear with a sunburn!
%
% The following four blocks of color definitions are for the colorbar.


% 50 Shades of Cyan
\definecolor{colorbar.c.one}  {cmyk}{1,   0, 0, 0}
\definecolor{colorbar.c.two}  {cmyk}{0.9, 0, 0, 0}
\definecolor{colorbar.c.three}{cmyk}{0.8, 0, 0, 0}
\definecolor{colorbar.c.four} {cmyk}{0.7, 0, 0, 0}
\definecolor{colorbar.c.five} {cmyk}{0.6, 0, 0, 0}
\definecolor{colorbar.c.six}  {cmyk}{0.5, 0, 0, 0}
\definecolor{colorbar.c.seven}{cmyk}{0.4, 0, 0, 0}
\definecolor{colorbar.c.eight}{cmyk}{0.3, 0, 0, 0}
\definecolor{colorbar.c.nine} {cmyk}{0.2, 0, 0, 0}
\definecolor{colorbar.c.ten}  {cmyk}{0.1, 0, 0, 0}
\definecolor{colorbar.c.zero} {cmyk}{0,   0, 0, 0}


% 50 Shades of Magenta
\definecolor{colorbar.m.one}  {cmyk}{0, 1,   0, 0}
\definecolor{colorbar.m.two}  {cmyk}{0, 0.9, 0, 0}
\definecolor{colorbar.m.three}{cmyk}{0, 0.8, 0, 0}
\definecolor{colorbar.m.four} {cmyk}{0, 0.7, 0, 0}
\definecolor{colorbar.m.five} {cmyk}{0, 0.6, 0, 0}
\definecolor{colorbar.m.six}  {cmyk}{0, 0.5, 0, 0}
\definecolor{colorbar.m.seven}{cmyk}{0, 0.4, 0, 0}
\definecolor{colorbar.m.eight}{cmyk}{0, 0.3, 0, 0}
\definecolor{colorbar.m.nine} {cmyk}{0, 0.2, 0, 0}
\definecolor{colorbar.m.ten}  {cmyk}{0, 0.1, 0, 0}
\definecolor{colorbar.m.zero} {cmyk}{0, 0,   0, 0}


% 50 Shades of Yellow
\definecolor{colorbar.y.one}  {cmyk}{0, 0, 1,   0}
\definecolor{colorbar.y.two}  {cmyk}{0, 0, 0.9, 0}
\definecolor{colorbar.y.three}{cmyk}{0, 0, 0.8, 0}
\definecolor{colorbar.y.four} {cmyk}{0, 0, 0.7, 0}
\definecolor{colorbar.y.five} {cmyk}{0, 0, 0.6, 0}
\definecolor{colorbar.y.six}  {cmyk}{0, 0, 0.5, 0}
\definecolor{colorbar.y.seven}{cmyk}{0, 0, 0.4, 0}
\definecolor{colorbar.y.eight}{cmyk}{0, 0, 0.3, 0}
\definecolor{colorbar.y.nine} {cmyk}{0, 0, 0.2, 0}
\definecolor{colorbar.y.ten}  {cmyk}{0, 0, 0.1, 0}
\definecolor{colorbar.y.zero} {cmyk}{0, 0, 0,   0}


% 50 Shades of Grey
\definecolor{colorbar.k.one}  {cmyk}{0, 0, 0, 1  }
\definecolor{colorbar.k.two}  {cmyk}{0, 0, 0, 0.9}
\definecolor{colorbar.k.three}{cmyk}{0, 0, 0, 0.8}
\definecolor{colorbar.k.four} {cmyk}{0, 0, 0, 0.7}
\definecolor{colorbar.k.five} {cmyk}{0, 0, 0, 0.6}
\definecolor{colorbar.k.six}  {cmyk}{0, 0, 0, 0.5}
\definecolor{colorbar.k.seven}{cmyk}{0, 0, 0, 0.4}
\definecolor{colorbar.k.eight}{cmyk}{0, 0, 0, 0.3}
\definecolor{colorbar.k.nine} {cmyk}{0, 0, 0, 0.2}
\definecolor{colorbar.k.ten}  {cmyk}{0, 0, 0, 0.1}
\definecolor{colorbar.k.zero} {cmyk}{0, 0, 0, 0  }


% Other colors
\definecolor{bonaparticle.syntax.command}{HTML}{861001}




%    O t h e r
%    - - - - -
% Other stuff.

% Display non-breaking spaces as... spaces
\DeclareUnicodeCharacter{00A0}{ }




% ---------------------------------------------------------------------------- %




%    S T Y L I N G
%    -------------
% Unless you are extremely lazy or generally unknowledgeable about LaTeX, you
% will want to define your own class style. The bonaparticle class comes with
% custom titles, headers, and footers. You are strongly encouraged to override
% these.




%    T i t l e s   a n d   s e c t i o n s
%    - - - - - - - - - - - - - - - - - - -
% Styling and stuff


% Chapters
\makeatletter
\renewcommand\chapter{
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter
}
\makeatother


% \chapter (\thetitle, and consequently, \placetitle) formatting
\titleformat
    {\chapter}[display]
    {
        \pagestyle{bonaparticle}
        \thispagestyle{bonaparticlefirstpage}
        \raggedright
        \vspace{-5\baselineskip}
        \fontsize{18}{20}
        \bfseries
        \selectfont
    }
    {}
    {0cm}
    {}


% \chapter* formatting. Note that article titles are technically numbered!
\titleformat
    {name=\chapter,numberless}[display]
    {
        \raggedright
        \vspace{-5\baselineskip}
        \fontsize{18}{20}
        \bfseries
        \selectfont
    }
    {}
    {0cm}
    {}


% Disable chapter numbering. It probably isn't necessary to do this.
\renewcommand{\thechapter}{}


% Ensure that section and equation numbering ignores the (now non-existing)
% chapter numbers
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\theequation}{\arabic{equation}}


% \section formatting
\titleformat
    {\section}[display]
    {
        \raggedright
        \fontsize{11}{12}
        \bfseries
        \color{\thegenrecolor}
        \selectfont
    }
    {
        \vspace{-\baselineskip}
    }
    {0cm}
    {
        \thesection
        \quad
    }


% \section* formatting
\titleformat
    {name=\section,numberless}[display]
    {
        \raggedright
        \fontsize{11}{12}
        \bfseries
        \color{\thegenrecolor}
        \selectfont
    }
    {
        \vspace{-\baselineskip}
    }
    {0cm}
    {}


% Configure how much room should be added to \sections
\titlespacing
    {\section}
    {0mm}
    {0mm}
    {-2mm}




%    H e a d e r s   a n d   f o o t e r s
%    - - - - - - - - - - - - - - - - - - -
% Each article can set its own particular style of headers and footers using the
% \fancypagestyle command.
% Good to know: the header and footer will not be set up before all other stuff
% is placed. Keep this in mind when redefining commands that contain variables.
% This also makes headers and footers extremely vulnerable to off-by-one errors.


% Reset the header and footer definitions
\newcommand{\resetbonaparticlehf}{
    \fancyhf{}
}


% Set the headers. The first argument may either be "" or "title". Using "title"
% will result in the article title being included in the header.
\newcommand{\makebonaparticleheaders}[1][]{
    % Headers on [E]ven pages are [L]eft-aligned
    \fancyhead[LE]
    {
        \ifthenelse{\equal{\thegenre}{}}
        {}{
            \textbf{\thegenre}
            \quad
        }
        \ifstrequal{#1}{title}{
            \leftmark
        }{}
    }

    % Headers on [O]dd pages are [R]ight-aligned
    \fancyhead[RO]
    {
        \ifstrequal{#1}{title}{
            \leftmark% Prevent whitespaces on the right using %
        }{}%
        \ifthenelse{\equal{\thegenre}{}}
        {}{
            \quad%
            \textbf{\thegenre}%
        }%
    }

    % This sets the thickness of the line below the header
    \renewcommand{\headrulewidth}{0.5pt}
}


% Set the footers.
\newcommand{\makebonaparticlefooters}{
    % Footers on [E]ven pages are [L]eft-aligned
    \fancyfoot[LE]
    {
        \vspace{-2pt}
        {
            \color{\thefootercolor}
            \small
            \vspace{-\baselineskip}
            \raggedright
            \textbf{\thepage}
            \quad
            \themagazinename
            \quad
            \textbf{Volume \themagazinevolume, Issue \themagazineissue}
        }
        \ifprint
            \begin{picture}(0, 0)(-257,5){}
                \colorbar
            \end{picture}
        \fi
    }

    % Footers on [O]dd pages are [R]ight-aligned
    \fancyfoot[RO]
    {
        \vspace{-2pt}
        {
            \color{\thefootercolor}
            \small
            \vspace{-\baselineskip}
            \raggedleft
            \textbf{\themagazinetheme}
            \quad
            \themagazinename
            \quad
            \textbf{\thepage}%
        }
        \ifprint
            \begin{wrapfigure}[0]{l}{0cm}
                \begin{picture}(0, 0)(-30,-20){}
                    \colorbar
                \end{picture}
            \end{wrapfigure}
        \fi
    }
}


% This style should be used for all pages, except for first pages of articles,
% advertisements, and the front page.
\fancypagestyle{bonaparticle}{
    \protect\resetbonaparticlehf
    \protect\makebonaparticleheaders[title]
    \protect\makebonaparticlefooters

    % This sets the distance between the header and the body text
    \setlength{\headsep}{0.5cm}
}


% This style should be used for the first page of each article. The article
% title should be left out of such pages. This header style differs in that the
% article title is not shown in the header, as it can already be found on the
% same page.
\fancypagestyle{bonaparticlefirstpage}{
    \protect\resetbonaparticlehf

    \protect\makebonaparticleheaders
    \protect\makebonaparticlefooters

    % This sets the distance between the header and the body text
    \setlength{\headsep}{0.5cm}

    % This sets the thickness of the line below the header
    \renewcommand{\headrulewidth}{0pt}
}


% bonaparticle is now our default header/footer style
\fancypagestyle{plain}{
    \pagestyle{bonaparticle}
}
\pagestyle{bonaparticle}


% Change the article title color in the header for this particular page.
\newcommand{\thisheadercolor}[1]{
    \AddThispageHook{
        \renewcommand{\theheadercolor}{#1}
    }
}
\newcommand{\thisheadercolour}[1]{
    \thisheadercolor{#1}
}


% Change the footer color for this particular page.
\newcommand{\thisfootercolor}[1]{
    \AddThispageHook{
        \renewcommand{\thefootercolor}{#1}
    }
}
\newcommand{\thisfootercolour}[1]{
    \thisfootercolor{#1}
}


% This changes the text in the header to the current article's title
\renewcommand{\chaptermark}[1]{
    \markboth{#1}{}
}




%    T a b l e   o f   c o n t e n t s
%    - - - - - - - - - - - - - - - - -
% Make the table of contents suitable for magazines. By default, all this will
% do is configure \tableofcontents to only list article titles, and remove the
% `Contents` text from the header.


\addtocontents{toc}{
    \protect\setcounter{tocdepth}{0}
}


% Table of contents chapter title
\newcommand{\thetableofcontentstitle}{In this issue}


% Suppress table of contents title and add our own
\makeatletter
\renewcommand\tableofcontents{
    \chapter*{\vspace{-.75\baselineskip}\thetableofcontentstitle}
    \vspace{-2\baselineskip}
    \@starttoc{toc}
}
\makeatother


% Define how article titles should be displayed in the table of contents
\titlecontents{chapter}
              [0pt]
              {\vspace{.6\baselineskip}}
              {\bfseries\thecontentslabel}
              {}
              {\hfill\thecontentspage}
              []




%    C a p t i o n s
%    - - - - - - - -
% Mostly styling, and removal of "chapter" numbers (because they make no sense
% in a magazine)


\captionsetup{
    belowskip=3mm,
    labelfont=bf,
    labelsep=quad,
    textfont=it,
    within=none
}




% ---------------------------------------------------------------------------- %




%    A T O M I C    C O M M A N D S
%    ------------------------------
% Small and simple commands that are unique to the bonaparticle class.




%    G e n e r a l
%    - - - - - - -
% Stuff that's used throughout the publication


% \themagazinename
\newcommand{\magazinename}[1]{
    \renewcommand{\themagazinename}{#1}
}


% \themagazinetheme
\newcommand{\magazinetheme}[1]{
    \renewcommand{\themagazinetheme}{#1}
}


% \themagazinevolume
\newcommand{\magazinevolume}[1]{
    \renewcommand{\themagazinevolume}{#1}
}


% \themagazineissue
\newcommand{\magazineissue}[1]{
    \renewcommand{\themagazineissue}{#1}
}


% First argument specifies the name that will be displayed
\newenvironment{colophon}[1]{
    \textbf{#1}\\
    \renewcommand{\and}{~\\}
}
{}


% Removing the new lines in this empty environment declaration will cause the
% compiler to generate warnings. I don't know why, but I for one welcome our
% new cargo cult programming overlords.
\newenvironment{editorial}{

}{

}


% Insert a fake page (useful if you want your article to start on a left page
% rather than a left one. This command only works when typesetting individual
% articles.
\newcommand{\fakepage}{
    \clearpage

    \begin{center}
        \Huge
        % Heart-breakers gonna
        ~\\ % Break
        ~\\ % Break
        ~\\ % Break
        ~\\ % Break
        ~\\ % Break
            % And the fakers gonna
            %                   fake,
            %                   fake,
            %                   fake,
            %                   fake,
        \hl{\textbf{PLACEHOLDER/FAKE PAGE}}

        ~\\

        \large{
            By default, \LaTeX{} will start articles with an odd page number
            (that is, you end up with a page “on the right”). But sometimes
            you’re really sure you want an article to start on the left. This
            placeholder/fake page forces an article to start with an even page
            number, so you can typeset your article accordingly.

            Note for editors: unless you’re planning on publishing only this
            article (there are better ways to do that), you don’t have to remove
            this page! Placeholder/fake pages won’t show up articles are
            compiled as part of a larger document (i.e.
            {% Prevent extra space before...
                \color{bonaparticle.syntax.command}
                \textbf{\texttt{\textbackslash include}}% ...and after \include
            }d).
        }
    \end{center}

    \newpage
}
% \placeholderpage is an alias for \fakepage
\let\placeholderpage\fakepage




%    A r t i c l e   b u i l d i n g   b l o c k s
%    - - - - - - - - - - - - - - - - - - - - - - -
% Articles will generally contain calls to most of these commands.


% \thegenre
\newcommand{\genre}[1]{
    \renewcommand{\thegenre}{#1}
}


% \genrecolor and \genrecolour can be used interchangeably to set the color of
% the article genre (type).
\newcommand{\genrecolor}[1]{
    \renewcommand{\thegenrecolor}{#1}
    \renewcommand{\thegenrecolour}{#1}
}
\newcommand{\genrecolour}[1]{
    \renewcommand{\thegenrecolor}{#1}
    \renewcommand{\thegenrecolour}{#1}
}


% \thetitle is set using the \title command.
\renewcommand{\title}[2][]{
    \renewcommand{\thetitle}{#2}

    \ifstrequal{#1}{}{
        \renewcommand{\theshortenedtitle}{#2}
    }{
        \renewcommand{\theshortenedtitle}{#1}        
    }
}


% This should be set using \title[<shortenedtitle>]{<full title>}
\newcommand{\shortenedtitle}[1]{
    \renewcommand{\theshortenedtitle}{#1}
}


% \thesubtitle is set using the \subtitle command.
\newcommand{\subtitle}[1]{
    \renewcommand{\thesubtitle}{#1}
}


% \theauthor may contain anywhere between 0 and N authors. Technically there's
% no real limit, but you are advised to list no more than eight names. Multiple
% authors' names should be separated using \and. If more than four authors are
% listed, only the first author will be mentioned explicitly in the table of
% contents.
\newcommand{\authorignore}[1]{%
    \ignorespaces%
    #1%
    \ignorespacesafterend%
}


% Set the article author(s)
\renewcommand{\author}[2][]{
    \renewcommand{\theauthor}{#2}

    \ifstrequal{#1}{}{
        \renewcommand{\theshortenedauthor}{#2}
    }{
        \renewcommand{\theshortenedauthor}{#1}        
    }
}


% This should be set using \author[<shortenedauthor>]{<full list of authors>}
\newcommand{\shortenedauthor}[1]{
    \renewcommand{\theshortenedauthor}{#1}
}


% Set the date
\renewcommand{\date}[1]{
    \renewcommand{\thedate}{#1}
}


% Right now, this is pretty much equivalent to \bfseries
\newenvironment{lead}{
      \noindent
      \bfseries\bgroup
      \ignorespaces
}{
      \egroup
      \par\noindent
      \ignorespacesafterend
      \vspace{-1.5\baselineskip}
}




%    F a n c y   t e x t 
%    - - - - - - - - - -
% Different kinds of text.

% This is for a pullquote. I don't know what else you could be expecting.
\newenvironment{pullquote}{
    \begin{leftbar}
    \noindent
    \raggedright
    \Large\textbf\bgroup\textit\bgroup
    \ignorespaces
    \color{\thegenrecolor}
}{
    \egroup\egroup
    \par\noindent
    \ignorespacesafterend
    \vspace{-1.3\baselineskip}
    \end{leftbar}
    \vspace{-.5\baselineskip}
}


% This is for those (possibly) brightly colored boxes that may contain some
% fun anecdotes, explanation of basic concepts (which an author didn't include
% in his/her article), or something else entirely
\newsavebox{\coloredbox}
\newenvironment{infobox}{
    \begin{lrbox}{\coloredbox}
        \begin{minipage}{.98\textwidth}
            \vskip10pt
            \leftskip10pt\rightskip10pt
            \color{white}
            \begin{spacing}{1.15}
}{
            \end{spacing}
            ~\vskip10pt
        \end{minipage}
    \end{lrbox}%
    \begin{center}
        \colorbox{\thegenrecolor}{
            \usebox{\coloredbox}
        }
    \end{center}
}




%    I m a g e s
%    - - - - - -
% Several commands for including big-ass images.


% Insert a full-page image as a background.

%  +- Example -----------------------------+
%  |                                       |
%  |  \coverart{beautiful-teapot}{15}{15}  |
%  |                                       |
%  +---------------------------------------+
\newcommand{\coverart}[1]{
    \AddToShipoutPicture*{
        \put(0,-10.5)
        {
            \hspace{-4.5mm}
            \parbox[b]
            [\paperheight+6mm]
            {\paperwidth+6mm}
            {
                \centering
                \includegraphics[
                    width=\paperwidth+6mm,
                    height=\paperheight+6mm
                ]{#1}%
            }
        }
    }
}


% The magazine's front page. Somewhat similar to \coverart
%
%  +- Example ----------------------------+
%  |                                      |
%  |  \frontpage{girl-next-door}{15}{15}  |
%  |                                      |
%  +--------------------------------------+
\newcommand{\frontpage}[3]{
    \includepdf[
        noautoscale,
        width=\paperwidth+#2mm,
        height=\paperheight+#3mm
    ]
    {#1}
    % If you don't do this, your first page(s) might look a bit silly.
    \resetbonaparticlevariables
}


% Technically an alias for \frontpage, but has slightly different semantics.
%
%  +- Example ----------------------------------+
%  |                                            |
%  |  \fullpageadvertisement{deloitte}{15}{15}  |
%  |                                            |
%  +--------------------------------------------+
\newcommand{\fullpageadvertisement}[3]{
    \clearpage
    \newpage
    \frontpage{#1}{#2}{#3}
}


% Another variation for full-page images that should be listed in the table of
% contents.
%
%  +- Example ------------------------------------------------------------+
%  |                                                                      |
%  |  \fullpagefeaturedimage{cartoon-2015-02}{5}{5}{Cartoon of the Week}  |
%  |                                                                      |
%  +----------------------------------------------------------------------+
\newcommand{\fullpagefeaturedimage}[4]{
    \clearpage
    \begin{minipage}{\paperwidth}
        \placetitle{#4}{}
        \includepdf[
            noautoscale,
            width=\paperwidth+#2mm,
            height=\paperheight+#3mm
        ]
        {#1}
    \end{minipage}
}


% Add a marginless image that takes up the entire paper width.
%
% The following command will add the image to the top of the page:
%
%  +- Example -----------------------------------------+
%  |                                                   |
%  |  \fullwidthimage{image-on-upper-half-of-page}{t}  |
%  |  <your other content>                             |
%  |                                                   |
%  +---------------------------------------------------+
%
% This will place the image at the bottom of the page. Somewhat quirky at times.
%
%  +- Example -----------------------------------------+
%  |                                                   |
%  |  <your other content>                             |
%  |  \fullwidthimage{image-on-upper-half-of-page}{b}  |
%  |                                                   |
%  +---------------------------------------------------+
\newlength\fullwidthimageheight

\newcommand{\fullwidthimage}[2]{
    % Measure the height of the image when we set its width to \paperwidth
    \def\mygraphic{\includegraphics[draft,width=\paperwidth+5mm]{#1}}
    \setlength\fullwidthimageheight{\heightof{\phantom{\mygraphic}} - 1.5cm}

    \ifstrequal{#2}{t}{
        
        % Actually placing the image. The reason we don't simply use
        % \includegraphics, is because we want the header to have a higher
        % z-index than the image.
        \AddToShipoutPicture*{
            \AtPageUpperLeft
            {
                \hspace{-4.5mm}
                \parbox[t]
                {\paperwidth+5mm}
                {
                    \vspace{-3.5mm}
                    \centering
                    \includegraphics[
                    width=\paperwidth+5mm
                    ]{#1}%
                }
            }
        }
        
        ~\vspace{\fullwidthimageheight}

    }{
        \begin{figure*}[b!]
            % Without this, text will be overlaid on top of the image, which
            % is not what we want!
            \phantom{
                \includegraphics[
                    draft,
                    width=\textwidth,
                    height=\fullwidthimageheight - 5mm
                ]
                {#1}
            }

            % Actually placing the image. The reason we don't simply use
            % \includegraphics, is because we want the footer to have a higher
            % z-index than the image.
            \AddToShipoutPicture*{
                {
                    \hspace{-4.5mm}
                    \parbox[b]
                    {\paperwidth+5mm}
                    {
                        \centering
                        ~\vspace{-3.5mm}
                        \includegraphics[
                        width=\paperwidth+5mm
                        ]{#1}%
                    }
                }
            }
        \end{figure*}
    }
}

% Use this environment to mark up advertisements.
%
% This is not strictly necessary, and indeed one doesn’t _have_ to use this for
% images, but it does make it easier to determine which parts of a TeX document
% are actually part of the article, and which parts are not. This may be useful
% if you ever decide you want to convert an article to HTML or EPUB, and insert
% some nice web advertisements into them, rather than showing out-dated, non-
% personalized print advertisements.
\newenvironment{advertisement}{

}{

}




%    M i s c e l l a n e o u s
%    - - - - - - - - - - - - -
% This section should've been deleted commits ago.


% This pretty prints an ASCII panda to the file, but otherwise doesn't really
% serve any useful purpose.
\newcommand{\panda}{
    \begin{minipage}{\columnwidth}
        % verbatim environments don't work here, so this'll have to do...
        \texttt{~~~~~~~~~~.;;.}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~~/;;;;\textbackslash~~\_\_\_~~~~~~.;;.}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~|;(;;;-""~~~`'-.,;;;;;\textbackslash}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~~\textbackslash;'~~~~~~~~~~~~';;;);/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~~/~~~~~~~~~~~~~~~~\textbackslash;;'}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~/~~~~.;.~~~.;.~~~~~\textbackslash}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~|~~~;;o;;~;;o;;~~~~|}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~;~~~'"-'`~`'-"'~~~~|}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~/\textbackslash~~~~~~.\_.~~~~~~~/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~;;;;;\_~~~,\_Y\_,~~~\_.'}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~/;;;;;\textbackslash`--.\_\_\_.--;.}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~/|;;;;;;;.\_\_.;;;.~~\textbackslash\textbackslash}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~;~~\textbackslash;;;;;;;;;;;;;;\textbackslash~~;\textbackslash\_\_~~.;.}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~|~~~';;;;;;;;=;;;;'~~|-\_\_;;;;/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~|~~~~~`""`~~.---.\_~~/;/;;\textbackslash;;/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~/~;~~~~~~~~~/;;;;;;;-;/;;/|;/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~\textbackslash\_,\textbackslash~~~~~~~|;;;;;;;;;;;;|~|}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~'-...--';;;;;;;;;;;;\textbackslash/}\\
        \vspace{-.2\baselineskip}
        \texttt{~~~~~~~~~~~~~~~~`"""`~~~`"`}
        \vspace{-.2\baselineskip}
    \end{minipage}
}




%    C O M P O S I T E    C O M M A N D S
%    ------------------------------------
% These commands make use of one or more of the commands above. There's no real
% reason to separate these from the rest, but I guess it adds just that little
% bit extra structure.




% Add a title to the page and the table of contents. For consistency, every
% command that creates article titles should call this command.
\newcommand{\placetitle}[2]{
    \clearpage
    \chapter[#1]{#2}
    \renewcommand{\and}{ /\ }
    \ifstrempty{\theauthor}{
        \vspace{-\baselineskip}
    }{
        \addtocontents{toc}{{\textit{\small\theauthor}}\vspace{.1cm}\par}
    }
    \renewcommand{\and}{\unskip, }
}


% This creates a very simple article header that should work for most magazines.
% I actually recommend that you define your own (slightly more fancy-looking)
% headers however.
% Either way, you'll want to use this command AFTER you have defined your title
% and author (and optionally, your subtitle).
%
%  +- Example ---------------------------+
%  |                                     |
%  |  \title   {Apple pie is delicious}  |
%  |  \subtitle{A non-critical essay}    |
%  |  \author  {Pam Appleseed}           |
%  |                                     |
%  |  \maketitle                         |
%  |                                     |
%  +-------------------------------------+
\renewcommand{\maketitle}{
    \placetitle{\theshortenedtitle}{\thetitle}
    \vspace{-3.6\baselineskip}
    {
        \Large
        \selectfont
        \begin{spacing}{1.1}
            \raggedright
            \thesubtitle
        \end{spacing}
        \vspace{.5\baselineskip}
    }

    {
        \large
        \selectfont
        \theauthor
        \vspace{.5\baselineskip}
    }

}


% This command can be used to create a fancy-looking article cover page with a
% big-ass title (and possibly a subtitle), a big ass-background image (or
% something slightly more family-friendly), the author's name, and the lead.
%
% If you choose a rather dark background, some of the text can be hard to read.
% For this, you can use the optional parameters to respectively set the colors
% for the title, subtitle, author, and lead.
%
%  +- Example -----------------------------+
%  |                                       |
%  |  \title   {Apple pie is delicious}    |
%  |  \subtitle{A non-critical essay}      |
%  |  \author  {Pam Appleseed}             |
%  |                                       |
%  |  \makecovertitle[                     |
%  |      titlecolor=blue,                 |
%  |      subtitlecolor=green,             |
%  |      authorcolor=yellow,              |
%  |      leadcolor=red,                   |
%  |  ]{wintendo64}{                       |
%  |      This article teaches you how to  |
%  |      bake delicious Wintendo 64       |
%  |      apple-scented urinal cakes.      |
%  |  }                                    |
%  |                                       |
%  +---------------------------------------+


% Default values for cover page text
\newcommand{\thecovertitletitlecolor}   {black}
\newcommand{\thecovertitlesubtitlecolor}{black}
\newcommand{\thecovertitleauthorcolor}  {black}
\newcommand{\thecovertitleleadcolor}    {black}


% Define possible key values for the \makecovertitle command
\makeatletter
\define@key{makecovertitle}{titlecolor}[black]{
    \renewcommand{\thecovertitletitlecolor}   {#1}
}
\define@key{makecovertitle}{subtitlecolor}[black]{
    \renewcommand{\thecovertitlesubtitlecolor}{#1}
}
\define@key{makecovertitle}{authorcolor}[black]{
    \renewcommand{\thecovertitleauthorcolor}  {#1}
}
\define@key{makecovertitle}{leadcolor}[black]{
    \renewcommand{\thecovertitleleadcolor}    {#1}
}
\makeatother


% See the example above
\newcommand{\makecovertitle}[3][]{
    \setkeys{makecovertitle}{#1}

    \coverart{#2}

    \vspace{1cm}
    \placetitle{\thetitle}{
        \begin{center}
            \vspace{1cm}
            \fontsize{34}{38}
            \color{\thecovertitletitlecolor}
            \selectfont
            \thetitle
        \end{center}
    }
    
    \vspace{-2.3cm}
    
    \begin{center}
        {
            \color{\thecovertitlesubtitlecolor}
            \LARGE
            \thesubtitle
        }
      
        \vspace{.4cm}
      
        {
            \color{\thecovertitleauthorcolor}
            \Large
            \theauthor
        }
    \end{center}
    
    \vfill
    
    \begin{lead}
        \begin{spacing}{1.1}
            \fontsize{12}{14}%
            \selectfont
            \color{\thecovertitleleadcolor}
            #3
        \end{spacing}
    \end{lead}

    \vspace{.5cm}
    
    \newpage
}


% This places a color bar at the bottom of the page. I don't know whether we
% really need this, but at the very least it makes it look more professional.
% This command should only be used by people who build or maintain classes.
\newcommand{\colorbar}
    {
        \begin{picture}(200,10)(365,50)
            \put(0,0)
            {
                \begin{tabular}
                    {|cccccccccccc|cccccccccccc|}
                    % This is the first row of bars
                    ~ &
                    \cellcolor{colorbar.c.one}~   &
                    \cellcolor{colorbar.c.two}~   &
                    \cellcolor{colorbar.c.three}~ & 
                    \cellcolor{colorbar.c.four}~  &
                    \cellcolor{colorbar.c.five}~  &
                    \cellcolor{colorbar.c.six}~   & 
                    \cellcolor{colorbar.c.seven}~ &
                    \cellcolor{colorbar.c.eight}~ &
                    \cellcolor{colorbar.c.nine}~  & 
                    \cellcolor{colorbar.c.ten}~   &
                    \cellcolor{colorbar.c.zero}~  &
                    ~ &
                    \cellcolor{colorbar.m.one}~   &
                    \cellcolor{colorbar.m.two}~   &
                    \cellcolor{colorbar.m.three}~ & 
                    \cellcolor{colorbar.m.four}~  &
                    \cellcolor{colorbar.m.five}~  &
                    \cellcolor{colorbar.m.six}~   & 
                    \cellcolor{colorbar.m.seven}~ &
                    \cellcolor{colorbar.m.eight}~ &
                    \cellcolor{colorbar.m.nine}~  & 
                    \cellcolor{colorbar.m.ten}~   &
                    \cellcolor{colorbar.m.zero}~ \\
                    % This is the empty row
                    ~&&&&&&&&&&&& &&&&&&&&&&&\\
                    % And this is the third one
                    ~ &
                    \cellcolor{colorbar.y.one}~   &
                    \cellcolor{colorbar.y.two}~   &
                    \cellcolor{colorbar.y.three}~ & 
                    \cellcolor{colorbar.y.four}~  &
                    \cellcolor{colorbar.y.five}~  &
                    \cellcolor{colorbar.y.six}~   & 
                    \cellcolor{colorbar.y.seven}~ &
                    \cellcolor{colorbar.y.eight}~ &
                    \cellcolor{colorbar.y.nine}~  & 
                    \cellcolor{colorbar.y.ten}~   &
                    \cellcolor{colorbar.y.zero}~  &
                    ~ &
                    \cellcolor{colorbar.k.one}~   &
                    \cellcolor{colorbar.k.two}~   &
                    \cellcolor{colorbar.k.three}~ & 
                    \cellcolor{colorbar.k.four}~  &
                    \cellcolor{colorbar.k.five}~  &
                    \cellcolor{colorbar.k.six}~   & 
                    \cellcolor{colorbar.k.seven}~ &
                    \cellcolor{colorbar.k.eight}~ &
                    \cellcolor{colorbar.k.nine}~  & 
                    \cellcolor{colorbar.k.ten}~   &
                    \cellcolor{colorbar.k.zero}~ \\
                \end{tabular}
            }
        \end{picture}
    }


% Alias for milk-pouring tea connoisseurs
\let\colourbar\colorbar


% ---------------------------------------------------------------------------- %




%    O H ,   A N D   O N E   M O R E   T H I N G
%    -------------------------------------------
% Yep, this is just a squirrel jumping off a bridge, and an \endinput.


%          /\
%         /  \
%        /    \
%       /      \
%      / BRIDGE \
%     /   OUT    \
%    /____________\
%         | |
%         | |
%         | |
%         | |                                         ##
%         | |                        \    \          ##
%         | |                    \    \    \        ##
% --------+-+---------------      \     ____
%                          |           (.   \     ##
% -------------------------              \  |   
\endinput %                               \ |___(\--/)
%                                       __/    (  . . )
%                                      "'._.    '-.O.'
%                                           '-.  \ "|\
%                                              '.,,/'.,,
