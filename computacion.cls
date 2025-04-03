\NeedsTeXFormat{LaTeX2e}
\LoadClass[11pt, letterpaper]{article}
\pdfminorversion=4

%Para no resaltar las ligas
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{listings}

%Determinar el tamaño del papel y el margen
\RequirePackage[letterpaper, margin=1in]{geometry}

%Necesarias para usar tablas de varias páginas y líneas de separación
\RequirePackage{longtable}
\RequirePackage{booktabs}

\usepackage[dvipsnames]{xcolor}
%Necesario para incluir gráficas
\RequirePackage{graphicx} 
\RequirePackage{ragged2e}

%Para diagramas de Gantt
\RequirePackage{pgfgantt}

%Para resaltar
\RequirePackage{soul}

%Para notas al pie al final sin desperdicio
\RequirePackage[bottom]{footmisc}
\RequirePackage{etoolbox}
\RequirePackage{ifthen}

%Para el tipo y tamaño de letras en secciones
\RequirePackage{titlesec}
\titleformat*{\section}{\large\bfseries}
\titleformat*{\subsection}{\normalsize\bfseries}
\RequirePackage{palatino}

%Para indicar Figura y Tabla en español
\RequirePackage{caption}
\captionsetup{skip=5pt}
\captionsetup{font={bf}}
\captionsetup[figure]{name={Figura },labelsep=period}
\captionsetup[table]{name={Tabla },labelsep=period}

%Utilizar el idioma español en la fecha
\RequirePackage[spanish]{babel}
\RequirePackage{enumitem}
\usepackage{booktabs}
\addtolength\aboverulesep{0.0ex}
\addtolength\belowrulesep{0.0ex}
\usepackage{longtable, array}

\RequirePackage[T1]{fontenc}
\graphicspath{{./Imagenes/}}
\RequirePackage{fancyhdr}

\fancyhead{}
\fancyhead[L]{\footnotesize \fontfamily{qtm}\selectfont Propuesta de Proyecto de Integración}
\fancyhead[R]{\footnotesize \fontfamily{qtm}\selectfont Ingeniería en Computación}
\fancyfoot{} % clear all footer fields
\fancyfoot[R]{\footnotesize\fontfamily{qtm}\selectfont \thepage}
\fancyfoot[L]{\footnotesize \fontfamily{qtm}\selectfont UAM-Azcapotzalco}
\fancyfoot[C]{}

%================= Definición de variables =====================
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

%============ Comandos para portada, asesores, declaratoria, etc. ===========

\newcommand{\portada}{\maketitle}
\newcommand{\referencias}{\bibliography{./Referencias/piic.bib}}
\newcommand{\responsabilidad}{\resp}

%Responsabilidad: con firma
\newcommand{\resp}{
  \ifthenelse{\equal{\@coasesor}{\empty}}
  {
    El/La asesor(a) se responsabiliza de guiar al alumnado y de que todos los recursos mencionados en la Factibilidad Técnica estarán disponibles para el alumnado, de modo que el proyecto de integración se pueda concluir en tiempo y forma.\\[2.5cm]
    \begin{center}
      \begin{minipage}{0.5\textwidth}
        \centering
        \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
        \small\@asesor\\
        \textbf{\@rola}\\
      \end{minipage}
    \end{center}
  }
  {
    Las/Los asesoras(es) se responsabilizan de guiar al alumnado y de que todos los recursos mencionados en la Factibilidad Técnica estarán disponibles para el alumnado, de modo que el proyecto de integración se pueda concluir en tiempo y forma.\\[2.5cm]
    \begin{center}
      \begin{minipage}{0.4\textwidth}
        \centering
        \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
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

%Asesores en la portada
\newcommand{\asesores}[8]{%
  \ifthenelse{\equal{#5}{\empty}}
  { % un asesor
    \begin{minipage}{0.5\linewidth}
      \centering
      \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
      \textbf{\fontfamily{qtm}\selectfont{\@rola}}\\
      #1\\
      #2\\
      #3\\
      \href{mailto:#4}{#4}
    \end{minipage}
  }
  { % hay coasesor
    \begin{minipage}{0.4\textwidth}
      \centering
      \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
      \textbf{\fontfamily{qtm}\selectfont{\@rola}}\\
      #1\\
      #2\\
      #3\\
      \href{mailto:#4}{#4}
    \end{minipage}\hspace*{2cm}
    \begin{minipage}{0.4\textwidth}
      \centering
      \textbf{\fontfamily{qtm}\selectfont{\@rolb}}\\
      #5\\
      #6\\
      #7\\
      \href{mailto:#8}{#8}
    \end{minipage}
  }\\[1cm]
}

%Asesores en la Declaratoria
\newcommand{\asesoresp}[2]{%
  \ifthenelse{\equal{#2}{\empty}}
  {
    \centering
    \begin{minipage}{0.45\linewidth}
      \centering
      \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
      \small #1\\
      \textbf{\@rola}\\
    \end{minipage}\\[2cm]
  }
  { % hay coasesor
    \begin{minipage}{0.45\linewidth}
      \centering
      \includegraphics[height=1.5cm]{Imagenes/Firma-Victor-Benjamin-Aguilar-Orocio.png}\\[0.2cm]
      \small #1\\
      \textbf{\@rola}\\
    \end{minipage}\hspace*{2cm}
    \begin{minipage}{0.45\linewidth}
      \centering
      \small #2\\
      \textbf{\@rolb}\\
    \end{minipage}\\[2cm]
  }%
}

\newcommand{\declaratoria}[1]{%
   \ifthenelse{\equal{#1}{Experiencia Profesional}}
   {
     \noindent \small Esta propuesta es solo para aprobar el Seminario de Integración en Ingeniería en Computación.
   }
   {}
}

\makeatletter
\renewcommand\maketitle{
  {
    \begin{titlepage}
      \centering
      \fontfamily{bch}\selectfont

      \includegraphics[width=\textwidth]{banner}

      \vspace{2cm}
      {\Large\textbf{\fontfamily{qtm}\selectfont{\@titulo}}}\\[0.5cm]
      \@tipo\\[0.1cm]
      \@version~versión\\[0.1cm]
      Trimestre \@trimestre \\[2.5cm]

      \small
      \textbf{\fontfamily{qtm}\selectfont{\@rol}}\\
      \@alumno\\
      \@matricula\\
      \href{mailto:al\@matricula @azc.uam.mx}{al\@matricula @azc.uam.mx}\\[1cm]

      \asesores{\@asesor}{\@categoria}{\@departamento}{\@correo}{\@coasesor}{\@categoriacoasesor}{\@departamentocoasesor}{\@correocoasesor}

      \textspanish{\today}

    \end{titlepage}

    \thispagestyle{empty}
    \section*{\centering Declaratoria}
    \noindent \justifying
    En caso de que el Comité de Estudios de la Licenciatura en Computación apruebe la realización de la presente propuesta, otorgamos nuestra autorización para su publicación en la página de la División de Ciencias Básicas e Ingeniería.\\[2cm]

    \centering{\small\@alumno}\\
    \small\textbf{\@rol}\\[2cm]

    \asesoresp{\@asesor}{\@coasesor}

    %CERRAMOS ESTA PÁGINA AQUÍ
    \newpage
  }
}
\makeatother