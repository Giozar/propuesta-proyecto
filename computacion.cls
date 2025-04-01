
\NeedsTeXFormat{LaTeX2e}
\LoadClass[11pt, letterpaper]{article}
\pdfminorversion 4

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{listings}
\RequirePackage[letterpaper, margin=1in]{geometry}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{graphicx}
\RequirePackage{ragged2e}
\RequirePackage{pgfgantt}
\RequirePackage{soul}
\RequirePackage[bottom]{footmisc}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}
\RequirePackage{titlesec}
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\RequirePackage{palatino}
\RequirePackage{caption}
\captionsetup{skip=5pt}
\captionsetup{font={bf}}
\captionsetup[figure]{name={Figura },labelsep=period}
\captionsetup[table]{name={Tabla },labelsep=period}
\RequirePackage[spanish]{babel}
\RequirePackage{enumitem}
\RequirePackage[T1]{fontenc}
\graphicspath{{./Imagenes/}}
\RequirePackage{fancyhdr}
\fancyhead{}
\fancyhead[L]{\footnotesize \fontfamily{qtm}\selectfont Propuesta de Proyecto de Integración}
\fancyhead[R]{\footnotesize \fontfamily{qtm}\selectfont Ingeniería en Computación}
\fancyfoot{}
\fancyfoot[R]{\footnotesize \fontfamily{qtm}\selectfont \thepage}
\fancyfoot[L]{\footnotesize \fontfamily{qtm}\selectfont UAM-Azcapotzalco}
\fancyfoot[C]{}

\def\version#1{\def\@version{#1}}
\def\trimestre#1{\def\@trimestre{#1}}
\def\tipo#1{\def\@tipo{#1}}
\def\matricula#1{\def\@matricula{#1}}
\def\alumno#1{\def\@alumno{#1}}
\def\titulo#1{\def\@titulo{#1}}
\def\rol#1{\def\@rol{#1}}
\def\rola#1{\def\@rola{#1}}
\def\asesor#1{\def\@asesor{#1}}
\def\categoria#1{\def\@categoria{#1}}
\def\departamento#1{\def\@departamento{#1}}
\def\correo#1{\def\@correo{#1}}
\def\rolb#1{\def\@rolb{#1}}
\def\coasesor#1{\def\@coasesor{#1}}
\def\categoriacoasesor#1{\def\@categoriacoasesor{#1}}
\def\departamentocoasesor#1{\def\@departamentocoasesor{#1}}
\def\correocoasesor#1{\def\@correocoasesor{#1}}

\bibliographystyle{IEEEtran}
\newcommand{\portada}{\maketitle}
\newcommand{\referencias}{\bibliography{./Referencias/piic.bib}}
\newcommand{\responsabilidad}{\resp}

\newcommand{\resp}{
  \ifthenelse{\equal{\@coasesor}{\empty}}{
    El/La asesor(a) se responsabiliza de guiar al alumnado y de que todos los recursos mencionados en la Factibilidad Técnica estarán disponibles para el alumnado, de modo que el proyecto de integración se pueda concluir en tiempo y forma.\\[2.5cm]
    \begin{center}
      \begin{minipage}{0.5\linewidth}
        \centering
        \small\@asesor\\
        \textbf{\@rola}\\
      \end{minipage}
    \end{center}
  }{
    Las/Los asesoras(es) se responsabilizan de guiar al alumnado y de que todos los recursos mencionados en la Factibilidad Técnica estarán disponibles para el alumnado, de modo que el proyecto de integración se pueda concluir en tiempo y forma.\\[2.5cm]
    \begin{center}
      \begin{minipage}{0.4\textwidth}
        \centering
        \small\@asesor\\
        \textbf{\@rola}\\
      \end{minipage}\hspace*{2cm}
      \begin{minipage}{0.4\textwidth}
        \centering
        \small\@coasesor\\
        \textbf{\@rolb}\\
      \end{minipage}
    \end{center}
  }
}

\newcommand{\asesores}[8]{
  \ifthenelse{\equal{#5}{\empty}}{
    \begin{minipage}{0.5\linewidth}
      \centering
      \textbf{\fontfamily{qtm}\selectfont{\@rola}}\\
      #1\\#2\\#3\\\href{mailto:#4}{#4}
    \end{minipage}
  }{
    \begin{minipage}{0.4\textwidth}
      \centering
      \textbf{\fontfamily{qtm}\selectfont{\@rola}}\\
      #1\\#2\\#3\\\href{mailto:#4}{#4}
    \end{minipage}\hspace*{2cm}
    \begin{minipage}{0.4\textwidth}
      \centering
      \textbf{\fontfamily{qtm}\selectfont{\@rolb}}\\
      #5\\#6\\#7\\\href{mailto:#8}{#8}
    \end{minipage}
  }\\[2.5cm]
}

\newcommand{\asesoresp}[2]{
  \ifthenelse{\equal{#2}{\empty}}{
    \centering
    \begin{minipage}{0.45\linewidth}
      \centering
      \small #1\\
      \textbf{\@rola}\\
    \end{minipage}\\[2.5cm]
  }{
    \begin{minipage}{0.45\linewidth}
      \centering
      \small #1\\
      \textbf{\@rola}\\
    \end{minipage}\hspace*{2cm}
    \begin{minipage}{0.45\linewidth}
      \centering
      \small #2\\
      \textbf{\@rolb}\\
    \end{minipage}\\[2.5cm]
  }
}

\newcommand{\declaratoria}[1]{
  \ifthenelse{\equal{#1}{Experiencia Profesional}}{
    \noindent \small Esta propuesta es solo para aprobar el Seminario de Integración en Ingeniería en Computación.
  }{}
}

\makeatletter
\renewcommand\maketitle{
  \begin{titlepage}
    \vspace*{\fill}
    \centering
    \fontfamily{bch}\selectfont
    \includegraphics[width=\textwidth]{banner}
    \vspace{2cm}
    {\Large\textbf{\fontfamily{qtm}\selectfont{\@titulo}}}\\[0.5cm]
    \@tipo\\[0.1cm]
    \@version~versión\\[0.1cm]
    Trimestre \@trimestre \\[3cm]
    \small
    \textbf{\fontfamily{qtm}\selectfont{\@rol}}\\
    \@alumno\\
    \@matricula\\
    \href{mailto:al\@matricula @azc.uam.mx}{al\@matricula @azc.uam.mx}\\[3.5cm]
    \asesores{\@asesor}{\@categoria}{\@departamento}{\@correo}{\@coasesor}{\@categoriacoasesor}{\@departamentocoasesor}{\@correocoasesor}
    \textspanish{\today}
    \vfill
  \end{titlepage}
  \thispagestyle{empty}
  \section*{\centering Declaratoria}
  \noindent \justifying{En caso de que el Comité de Estudios de la Licenciatura en Computación apruebe la realización de la presente propuesta, otorgamos nuestra autorización para su publicación en la página de la División de Ciencias Básicas e Ingeniería.}\\[4cm]
  \centering{\small\@alumno}\\
  \small\textbf{\@rol}\\[4cm]
  \asesoresp{\@asesor}{\@coasesor}
  \vfill
  \declaratoria{\@tipo}
  \newpage
}
\makeatother