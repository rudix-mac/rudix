set terminal pdfcairo color
set output 'test.pdf'
set xrange [-3 to 3]
plot sin(x), cos(x)

