set datafile separator ";"
set xlabel "Version"
set ylabel "Size"
set grid
set key outside
set xtics rotate by -45
set style data histograms
set terminal png size 1920,1080
set output "locust-exp.png"
set boxwidth 0.8 relative  # Adjust this as needed
set style fill solid 1.0

plot "locust-size.csv" using 2:xtic(1) title col , '' using 3:xtic(1) title col lw 1 lc rgb "black", '' using 4:xtic(1) title col

