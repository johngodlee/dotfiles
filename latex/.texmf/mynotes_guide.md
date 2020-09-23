# Documentation for mynotes.sty

Basic implementation:

```tex
\documentclass[11pt,a4paper]{article}

\usepackage{mynotes}

\begin{document}

BODY

\end{document}
```

Adding header material:

```tex
\documentclass[11pt,a4paper]{article}

\usepackage{mynotes}

\title{Title text}
\author{Author name}
\date{\today{}}

\begin{document}

\thispagestyle{empty}
\maketitle{}
\tableofcontents{}
\listoffigures{}
\listoftables{}
\newpage{}
\pagenumbering{arabic}

...
```

Citations:

Citing references:

```tex
\citep{}
\citet{}
\citealt{}
\citealp{}
\citeauthor{}
\citeyear{}

\bibliography{/Users/johngodlee/google_drive/bib/lib.bib}
```

Figures:

```tex
\begin{figure}[H]
	\includegraphics[width=0.8\textwidth]{img_file}
	\caption{Caption text}
	\label{fig_label}
\end{figure}
```

Subfigures can be placed side by side:

```tex
\begin{figure}[H]
	\subfloat[]{{\includegraphics[width=0.3\textwidth]{img_file_a}}
	\label{img_label_a}}%
    \qquad
	\subfloat[]{{\includegraphics[width=0.4\textwidth]{img_file_b}}
	\label{img_label_b}}%
	\caption{Caption text}
	\label{img_label_all}
\end{figure}

\autoref{img_label_a} % Figure 1a
\autoref{img_label_b} % Figure 1b
\autoref{img_label_all} % Figure 1
```

Tables:

Basic table:

```tex
\begin{table}[H]
	\centering
	\caption{Caption text}
	\label{table_label}
	\begin{tabular}{ccc}
		\hline \hline \\ [-2ex]
		{Col 1} & {Col 2} & {Col 3} \\
		\hline \\
		A & 1 & Text \\
		B & 2 & Sofa \\
		\hline \hline
	\end{tabular}
\end{table}
```

Table split over multiple pages:

```tex
\begin{longtable}[H]{ccc}
	\caption{Caption text}
	\label{table_label}
	\hline \hline \\ [-2ex]
	{Col 1} & {Col 2} & {Col 3} \\
	\hline \\
	A & 1 & Text \\
	B & 2 & Sofa \\
	\hline \hline
\end{longtable}
```

Table with cells split over multiple columns and rows:

```tex
\begin{table}[H]
	\centering
	\caption{Caption text}
	\label{table_label}
	\begin{tabular}{ccc}
		\hline \hline \\ [-2ex]
		{Col 1} & {Col 2} & {Col 3} \\
		\hline \\
		\multicolumn{3}{c}{Multi (3)-column cell} \\
		\multicolumn{2}{l}{2 col. cell on the left} & Cthird \\
		A & 1 & Text \\
		B & 2 & Sofa \\
		\multirow{2}{*}{Multi row} & 3 & Bead \\
    	& 4 & Tele \\
		\hline \hline
	\end{tabular}
\end{table}
```

Aligning on decimal points:

```tex
\begin{table}[H]
	\centering
	\caption{Caption text}
	\label{table_label}
	\begin{tabular}{Scc}
		\hline \hline \\ [-2ex]
		{Col 1} & {Col 2} & {Col 3} \\
		\hline \\
		1.53 & A & B \\
		100.2 & F & G \\
		-0.633 & G & J \\
		\hline \hline
	\end{tabular}
\end{table}
```

Internal citations, figures, tables, sections:

```tex
\autoref{fig_or_table_label}
\autopageref{label}
\href{URL}{text}
\url{URL}
```

Any of the above can be changed to e.g. `\url*{URL}` to remove the link but keep the text.

Miscellaneous:

```tex
\linenumbers{}
```

A good looking tilde: 

```tex
\textapprox{}
```

To-do items:

```tex
\todo{Item to do}
```

Landscape page

```tex
\begin{landscape}
Things in landscape
\end{landscape}
```

Framed boxes

```tex
\begin{minipage}{\linewidth}
\begin{framed}
We used a Nikon MF-16 ....
\end{framed}
\end{minipage}
```
