
\ProvidesClass{assignment}[2004/07/14 Madhusudan Singh, Copyright (C) 2004]
\NeedsTeXFormat{LaTeX2e}[1999/09/01]
\typeout{}
\typeout{ ==========> Assignment Class (assignment.cls) 2002 <============= }
\typeout{ Madhusudan Singh (C) 2004 }
\typeout{ In case of questions, etc. use comp.text.tex }
\typeout{}

\DeclareOption{twoside}{\PassOptionsToPackage{twoside}{article}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}\typeout{Delegating option ``\CurrentOption'' to the standard LaTeX2e article class, I hope you know what you are doing.}}

\ProcessOptions

\LoadClass[10pt,a4paper]{article}

\RequirePackage{ifthen}
\RequirePackage[export]{adjustbox}
\def\beforeLastpageClearpage{\relax}
\AtEndDocument{\beforeLastpageClearpage}
\RequirePackage{lastpage}
\setlength{\textwidth}{6.0in}
\pagestyle{empty}
\newcommand{\@coursetitle}{{\em No course title specified}}
\newcommand{\@courselabel}{{\em No course label specified}}
\newcommand{\@exercisesheet}{{\em No exercise sheet title specified}}
\newcommand{\@ExerciseSheet}{{\em NO EXERCISE SHEET TITLE SPECIFIED}}
\newcommand{\@semester}{{\em No semester specified}}
\newcommand{\@student}{{\em Student unknown}}
\newcommand{\@subject}{}
\newcommand{\@university}{Johns Hopkins University}
\newcommand{\@school}{Whiting School of Engineering }
\newcommand{\solutionstext}{\bfseries (Solutions)}
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{{#1}}}
\newcommand{\courselabel}[1]{\renewcommand{\@courselabel}{{#1}}}
\newcommand{\exercisesheet}[2]{%
\renewcommand{\@exercisesheet}{#1}%
\renewcommand{\@ExerciseSheet}{\protect\uppercase{#1}}%
\renewcommand{\@subject}{#2}%
}
\newcommand{\semester}[1]{\renewcommand{\@semester}{{#1}}}
\newcommand{\student}[1]{\renewcommand{\@student}{{#1}}}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}
\newcommand{\school}[1]{\renewcommand{\@school}{#1}}
\newcommand{\department}[1]{}
\newcommand{\PB}{{\bfseries Problem}}
\newcounter{problem}
\renewcommand{\theequation}{\arabic{equation}}
\newcommand{\e}{\epsilon}
\newcommand{\asgimplies}{\Rightarrow}
\newcommand   {\boxit}[1]     {$$\fbox{$#1$}$$}

\newcommand{\pbitem}{
\ifthenelse{\equal{\the\@enumdepth}{0}}{\item}{}
\ifthenelse{\equal{\the\@enumdepth}{1}}{\item[\PB\ \addtocounter{enumi}{1}\labelenumi]}{}
\ifthenelse{\equal{\the\@enumdepth}{2}}{\item[\PB\ \addtocounter{enumii}{1}\labelenumii]}{}
\ifthenelse{\equal{\the\@enumdepth}{3}}{\item[\PB\ \addtocounter{enumiii}{1}\labelenumiii]}{}
\ifthenelse{\equal{\the\@enumdepth}{4}}{\item[\PB\ \addtocounter{enumiv}{1}\labelenumiv]}{}
}

\newenvironment{problemlist}%
{%
\advance\@enumdepth by 1%
\ifthenelse{\equal{\the\@enumdepth}{1}}{\setcounter{enumi}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{2}}{\setcounter{enumii}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{3}}{\setcounter{enumiii}{0}}{}%
\ifthenelse{\equal{\the\@enumdepth}{4}}{\setcounter{enumiv}{0}}{}%
\begin{list}{%
\phantom{\CW}\
\ifthenelse{\equal{\the\@enumdepth}{1}}{\addtocounter{enumi}{1}\labelenumi}{}%
\ifthenelse{\equal{\the\@enumdepth}{2}}{\addtocounter{enumii}{1}\labelenumii}{}%
\ifthenelse{\equal{\the\@enumdepth}{3}}{\addtocounter{enumiii}{1}\labelenumiii}{}%
\ifthenelse{\equal{\the\@enumdepth}{4}}{\addtocounter{enumiv}{1}\labelenumiv}{}%
}%
{%
}
}%
{%
\end{list}%
\advance\@enumdepth by -1%
}

\newenvironment{problem}%
{%
\addtocounter{problem}{1}
\addtocounter{equation}{-\arabic{equation}}
\phantom{\PB}\
{%
}
}%
{%
}

\newenvironment{answer}%
{%
\begin{samepage}
\vspace{0.1 in}
\begin{boldmath}
\begin{emph}
{%
}
}%
{%
\end{emph}
\end{boldmath}
\begin{flushright}
\bfseries{$\longrightarrow \mathcal{A}$\sf{nswer}}
\end{flushright}
\end{samepage}
}

\let\ifshowanswers=\iffalse

\AtBeginDocument{%
\begin{flushright}
% \includegraphics[scale=0.3,right]{../jhu_whiting_soe_logo.jpeg}
\sf{\@student} \\
\emph{\@school} \\
{\protect\emph{\@university}}\\[0.5\baselineskip]
\bf{\@date}
\end{flushright}\hfill\\
{
\begin{samepage}
\bfseries\@ExerciseSheet%
\ifthenelse{\equal{\@subject}{}}{}{\ --- \@subject}%
\ifshowanswers\ \solutionstext \fi
\end{samepage}
}%

\renewcommand{\@oddfoot}%
{%
\noindent\parbox{0.99\textwidth}{\em%
\@courselabel:\ \@exercisesheet\hfill\@semester}%
\hspace{-0.99\textwidth}%
\parbox{0.99\textwidth}{\centering\thepage/\pageref{LastPage}}
}
}
\AtEndDocument{\vfill\noindent \sl{Submitted by \@student\ on \@date.}}
\endinput
%%
%% End of file `assignment.cls'.
