\ProvidesClass{thesis}

%  Tesis se parace mucho a un report
\LoadClass[12pt]{report}

% geometry - Margin package
\usepackage[right=2cm,left=3cm,top=2cm,bottom=2cm,headsep=0.5cm,footskip=1cm]{geometry}

%Enumeracion con esstilo
\usepackage{paralist}
\setlength\pltopsep{0pt} %Space between first item and preceding paragraph.
\setlength\plpartopsep{5pt} %Extra space added to \topsep when environment starts a new paragraph (is called in vmode).
\setlength\plitemsep{5pt} %Space between successive items.
\setlength\plparsep{\parskip} %Space between paragraphs within an item – the \parskip forthis environment

% Comitas en inglés
%\usepackage{textcmds}

\usepackage[section]{placeins}
%\clearpage 

% Cabecera
%\usepackage{fancyhdr}
%\fancyhf{}
%\pagestyle{fancy}
%\pagestyle{fancyplain}
%\setlength{\headheight}{1.5cm}
%\renewcommand{\headrulewidth}{0.4pt}
%\rhead{\rightmark}
%\lhead{}

% Tablas con estilo
\usepackage{array}

% "native" support for japanese/chinese/korean, but must compole with XeLatex
\usepackage{xeCJK}
\setCJKmainfont{IPAMincho}
\setCJKsansfont{IPAGothic}
\setCJKmonofont{IPAGothic}
\setCJKfamilyfont{cjk-vert}[Script=CJK,RawFeature=vertical]{IPAGothic}

% Caption
\usepackage[belowskip=-2pt,aboveskip=4pt,justification=centering]{caption}
\captionsetup{font=footnotesize,labelfont=footnotesize}

% Sangría en el primer párrafo después de seccion o capítulo
\usepackage{indentfirst}

% Images
\usepackage{float}

% Spacing after section and chapter
% \titlespacing{<command>}{<left>}{<before-sep>}{<after-sep>}[<right>]
\usepackage{titlesec}

\usepackage{etoolbox}

\makeatletter
\patchcmd{\ttlh@hang}{\parindent\z@}{\parindent\z@\leavevmode}{}{}
\patchcmd{\ttlh@hang}{\noindent}{}{}{}
\makeatother


\titleformat{\chapter}[display]{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}
\titlespacing{\section}{0pt}{0pt}{0pt} 
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}

%  amsmath, amsthm, amssymb - Mathematical packages
\usepackage{amsmath} \usepackage{amsthm} \usepackage{amssymb}

% subfig - Used to have subfigures within figures, or subtables within table floats
\usepackage{subfig}


% xspace - text macros
\usepackage{xspace}

% inputec, babel, blindtext ::  Español + UTF8
\usepackage[utf8]{inputenc}
\usepackage[english]{babel}
\usepackage{blindtext}
\selectlanguage{english}

% Change the name of each capter from "Caput" to Chapter, etc.
\addto\captionslatin{%
\renewcommand\chaptername{Chapter}
\renewcommand\listtablename{Index of Tables}
\renewcommand\listfigurename{Index of Figures}
\def\figurename{Figure}
\def\tablename{Table}
}

% Change Line Spacing in the index
\usepackage[subfigure]{tocloft}
\setlength\cftparskip{-2pt}
\setlength\cftbeforesecskip{1pt}
\setlength\cftaftertoctitleskip{2pt}

%\PrerenderUnicode{áéíóúÁÉÍÓÚüÜ}
%\decimalpoint

% centered columns with given width
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}


% clrscode3e - Typeset pseudo-code "Intro to Algorithms" style
%\usepackage{packages/clrscode3e}
%\usepackage{algorithm,algpseudocode}
\usepackage[pscoord]{eso-pic}% The zero point of the coordinate systemis the lower left corner of the page (the default).

\newcommand{\placetextbox}[3]{% \placetextbox{<horizontal pos>}{<vertical pos>}{<stuff>}
  \setbox0=\hbox{#3}% Put <stuff> in a box
  \AddToShipoutPictureFG*{% Add <stuff> to current page foreground
    \put(\LenToUnit{#1\paperwidth},\LenToUnit{#2\paperheight}){\vtop{{\null}\makebox[0pt][c]{#3}}}%
  }%
}%


% graphicx - logo and graphics
\usepackage[pdftex]{graphicx}
\graphicspath{{images/}}
\DeclareGraphicsExtensions{.pdf,.png,.jpeg,.jpg}

%Merge PDF's
\usepackage{pdfpages}

% Mostrar lista de cosas pendientes
%\newif{\if@uchiletesis@showtodolist}
%\@uchiletesis@showtodolisttrue
%\DeclareOption{notodo}{\@uchiletesis@showtodolistfalse}

% Spacing
\DeclareOption{singlespace}{\gdef\@space{1.0}}%Espacio Simple
\DeclareOption{doublespace}{\gdef\@space{2.0}}%Espacio Doble
\DeclareOption{defaultspace}{\gdef\@space{1.5}}%Espacio y Medio
\ExecuteOptions{singlespace}

% Separacion entre parrafos
\setlength{\parskip}{\baselineskip} 

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

% url Hyphenation
\usepackage[hyphens]{url}

%% hyperref - Pdftex hypertext
%\usepackage[
%    colorlinks=true
%    , unicode=true
%    , pdftex
%    , pdfborderstyle={/S/U/W 0}
%    , pdfusetitle
%    , breaklinks=true
%]{hyperref}

% urls in bibtex
%\usepackage{abntcite}

% cite - must go after hyperref, used to add cite references
\usepackage{cite}

%\if@uchiletesis@showtodolist
%\usepackage[colorinlistoftodos, textwidth=3cm]{todonotes}
%\reversemarginpar
%\setlength{\marginparwidth}{2.64cm}
%\else
%\usepackage[disable]{todonotes}
%\fi

%%%%%%%%%%%%%%%%%%%%%%
%Constants used in the class
%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\bibliographyname}{References}

% Definimos el espacio a usar
\renewcommand{\baselinestretch}{\@space}

% Portada
%\renewcommand{\maketitle}{%
%    \thispagestyle{empty}
%    \renewcommand{\baselinestretch}{1}
%    \begin{tabular}{ll}
%        \multirow{3}{*}{\includegraphics[height=84pt,width=42pt]{\@logofile}}
%        &\\
%        &\\
%        &\large{\MakeUppercase{Universidad de Chile}}\\
%        &\large{\MakeUppercase{\@facultad}}\\
%        &\large{\MakeUppercase{\@departamento}}\\
%        &\\
%    \end{tabular}
%    \begin{center}
%        \vskip 1.75cm%
%            {\large \MakeUppercase{\@title}}\\
%        \vskip 1.75cm%
%            {\large \MakeUppercase{\@trabajoygrado}}\\
%        \ifx \@trabajoysubgrado \undefined
%            \vskip 0.33cm
%            \vskip 0.75cm
%            \vskip 11pt
%        \else
%            \vskip 0.75cm
%                {\large \MakeUppercase{\@trabajoysubgrado}}\\
%        \fi
%        \vskip 1.75cm%
%            {\large \MakeUppercase{\@author}}\\
%        \vskip 1.0cm%
%            \MakeUppercase{Profesor guía:}\\
%            \MakeUppercase{\@profguia}\\
%        \vskip 0.75cm
%            \MakeUppercase{Miembros de la Comisión:}\\
%            \MakeUppercase{\@profcoguia}\\
%            \MakeUppercase{\@profint}\\
%            \ifx \@profinta \undefined
%                \vskip 0.33cm
%                \vskip 11pt
%            \else
%                \MakeUppercase{\@profinta}\\
%            \fi
%            \ifx \@profintb \undefined
%                \vskip 0.33cm
%                \vskip 11pt
%            \else
%                \MakeUppercase{\@profintb}\\
%            \fi
%        \vskip 0.75cm%
%            \begin{small}
%                \MakeUppercase{\@ciudad{} de \@pais}\\
%                \MakeUppercase{\@month{} \@year}\\
%            \end{small}
%        \vskip 1cm%
%            \ifx \@proyecto \undefined
%                {}
%            \else
%                \begin{footnotesize}
%                    \begin{tabular}{c}
%                        \hline
%                        \\
%                        \@proyecto\\
%                        \\
%                        \hline
%                    \end{tabular}
%                \end{footnotesize}
%            \fi
%    \end{center}
%    \newpage
%}

%%% Cambiamos section cuando estamos en el prefacio
\let\oldsection=\section
\let\oldthesection=\thesection
\newenvironment{preface}{
        \pagenumbering{roman}
        \pagestyle{plain}
        \renewcommand{\section}[1]{%
            \cleardoublepage
            \phantomsection
            \addcontentsline{toc}{chapter}{##1}
			\titlespacing*{\chapter}{0pt}{0pt}{40pt}
            \chapter*{##1}
        }
}{
        \newpage
		\titlespacing*{\chapter}{0pt}{50pt}{40pt}        
        \pagenumbering{arabic}
        \pagestyle{headings}
        \let\section=\oldsection
}


% Appendix
%\renewenvironment{appendix}{
%     \phantomsection
%       \addcontentsline{toc}{chapter}{Appendixs}
%    \chapter*{Appendixs}
%        \setcounter{section}{0}
%
%    \renewcommand{\thesection}{
%        \Alph{section}
%    }
%}{
%        \let\thesection=\oldthesection
%}


%%%%%%%%%%%%%%%%%
%modifications to bibliography
%%%%%%%%%%%%%%%%%
%save the old bibliography
\let\oldbiblio=\bibliography
%redefine the bibliography in order to get the names we want and listed in the index
\renewcommand{\bibliography}[2]{
    %add it to the index
    \cleardoublepage
    \phantomsection
    \addcontentsline{toc}{chapter}{\bibliographyname}
    %change the name to what we want
    \renewcommand{\bibname}{\bibliographyname}
    %call the old bibilo command
    \oldbiblio{#1}{#2}
\newpage
}


\newcommand{\dedicatoria}[1]{
    \newpage
    \thispagestyle{empty}
    \subsubsection*{}
    \vskip 5cm
    \begin{flushright}
        \emph{#1}
    \end{flushright}
}


%% Comandos personalizados para el paquete todonotes
%\if@uchiletesis@showtodolist
%% fillup - agregar un comentario rojo señalando que hay que llenar un texto
%    \newcommand{\fillup}[1]{%
%        \todo[color=red!20!white, inline, caption={Completar sección \thesubsection{}}]{%
%        \begin{minipage}{\linewidth}\Blindtext[#1][1]\end{minipage}%
%        }%
%    }
%
%% missing reg - agregar "citation needed " todos
%    \newcounter{missingReferenceItems}
%    \addtocounter{missingReferenceItems}{1}
%    \newcommand{\missingref}[2][]{%
%        \renewcommand{\@todonotes@text}{#2}%
%        \renewcommand{\@todonotes@caption}{\protect\hypertarget{todo\themissingReferenceItems}{}\textbf{Agregar referencia:} #2}%
%        \setkeys{todonotes}{noline, color=green!40, #1}%
%        \if@todonotes@localdisable%
%        \else%
%            \addtocounter{@todonotes@numberoftodonotes}{1}%
%            \if@todonotes@appendtolistoftodos%
%                \phantomsection%
%                \if@todonotes@captiongiven%
%                \else%
%                    \renewcommand{\@todonotes@caption}{\protect\hypertarget{todo:missingref:\themissingReferenceItems}{}\textbf{Agregar referencia \#\themissingReferenceItems:} #2}%
%                \fi%
%                \@todonotes@addElementToListOfTodos
%            \fi%
%            \textbf{\hyperlink{todo:missingref:\themissingReferenceItems}{[\themissingReferenceItems]}}%
%            \addtocounter{missingReferenceItems}{1}%
%        \fi}%
%\else
%% fillup - agregar un comentario rojo señalando que hay que llenar un texto
%    \newcommand{\fillup}[2][]{}
%
%% missing reg - agregar "citation needed " todos
%    \newcommand{\missingref}[2][]{\textbf{[?]}}
%\fi