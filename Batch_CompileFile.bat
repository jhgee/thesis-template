:: --- 'rem' or '::' is the key word for comments in batch files like this

rem --- Call cleanup script in order to delete all auxiliary files ---
:: --- Sometimes after error messages there are still errors in the auxiliary files even if the root of the error was corrected in the tex file
:: ---
call Batch_CleanUp.bat
:: ---
rem --- First LaTeX run (pdflatex) with special options (more memory) for large LaTeX projects and tikz stuff (-shell-escape) ---
:: --- I use MiKTeX -- maybe you need another syntax if you use TeX Live for example ---
:: ---
pdflatex --extra-mem-top=60000000 -synctex=1 -shell-escape -interaction=batchmode MainFile.tex

rem --- Execude biber if used ---
:: ---
biber	  MainFile
:: ---
rem --- glossaries
makeglossaries MainFile
:: ---
rem --- Compile three times to make sure everything is correct ---
:: ---
pdflatex --extra-mem-top=60000000 -synctex=1 -shell-escape -interaction=batchmode MainFile.tex
pdflatex --extra-mem-top=60000000 -synctex=1 -shell-escape -interaction=batchmode MainFile.tex
pdflatex --extra-mem-top=60000000 -synctex=1 -shell-escape -interaction=batchmode MainFile.tex
:: ---